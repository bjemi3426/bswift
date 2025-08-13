
import SwiftUI

struct PlantRow: View {
    @ObservedObject var plant: Plant
    @State var deleteButtonTapped = false
    @State var notesButtonTapped = false
    @State var photoButtonTapped = false
    @State var schelduleWateringButtonTapped = false
    @State var isFavoritedButtonTapped = false
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        HStack {
            let imageName = plant.showName.lowercased()
            let imageExists = NSImage(named: imageName) != nil
            let plantImage = plant.image.flatMap { NSImage(data: $0) }

            if imageExists {
                Image(imageName)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(6)
                    .onTapGesture {
                        addPlantPhotoFromFileDialog(plant: plant)
                    }
            } else if let image = plantImage {
                Image(nsImage: image)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(6)
                    .onTapGesture {
                        addPlantPhotoFromFileDialog(plant: plant)
                    }
            } else {
                Button(action: {
                    addPlantPhotoFromFileDialog(plant: plant)
                }) {
                    VStack {
                        Image(systemName: "plus.square")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(6)
                    }
                    .frame(width: 60, height: 60)
                }
            }
        
    
            VStack(alignment: .listRowSeparatorLeading, spacing: 5) {
                Text(plant.showName)
                    .font(.title2)
                    .bold()
                    .italic()
                Text(plant.showCategory)
                Text(plant.showDatePlanted, format: .dateTime)
                HStack(alignment: .lastTextBaseline) {
                    Button(action: {
                        deleteButtonTapped.toggle()
                    }) {
                        VStack(alignment: .trailing) {
                            Image(systemName: "trash.circle.fill")
                            
                        }
                    }
                    
                    Button(action: {
                        notesButtonTapped.toggle()
                    }) {
                        VStack(alignment: .trailing) {
                            Image(systemName: "note.text.badge.plus")
                            
                        }
                    }
                    .sheet(isPresented: $notesButtonTapped, content: {
                        NotesDetailView(plant: .constant(plant))
                    })
                    
                    Button(action: {
                        photoButtonTapped.toggle()
                    }) {
                        VStack(alignment: .trailing) {
                            Image(systemName: "photo.circle.fill")
                            
                        }
                    }
                    .sheet(isPresented: $photoButtonTapped, content: {
                        PhotoDetailView()
                    })
                    
                    Button(action: {
                        schelduleWateringButtonTapped.toggle()
                      
                        
                    }) {
                        VStack(alignment: .trailing) {
                            Image(systemName: "timer.square")
                            
                        }
                    }
                    .sheet(isPresented: $schelduleWateringButtonTapped, content: {
                        WaterReminderView(plant: plant)
                    })
                    
                    Button(action: {
                        addPlantPhotoFromFileDialog(plant: plant)
                      
                        
                    }) {
                        VStack(alignment: .trailing) {
                            Image(systemName: "photo")
                            
                        }
                    }
                }
            }
            Button(action:{
                isFavoritedButtonTapped.toggle()
                plant.isFavorited.toggle()
            }) {
                Image(systemName: "star.circle.fill")
                    .foregroundColor(isFavoritedButtonTapped ? .indigo : .white)
            }
            .padding(.leading)
            
        }
        .confirmationDialog("Delete Item", isPresented: $deleteButtonTapped, actions: {
            
            Button("yes") {
                deletePlant(plant)
            }
            
            Button("no") {
                
            }
        })
        
    }
    private func deletePlant(_ plant: Plant) {
        viewContext.delete(plant)
        
        do {
            try viewContext.save()
        } catch {
            print("Failed to delete plant: \(error)")
        }
    }
    
    func addPlantPhotoFromFileDialog(plant: Plant) {
        let panel = NSOpenPanel()
        panel.allowedContentTypes = [.jpeg, .png, .heic]
        panel.allowsMultipleSelection = false
        panel.canChooseDirectories = false
        
        if panel.runModal() == .OK, let url = panel.url {
            do {
                let imageData = try Data(contentsOf: url)
                plant.image = imageData
                
                try viewContext.save()
                print("Saved image to plant: \(plant)")
            } catch {
                print("Failed to load or save image: \(error)")
            }
        }
    }
}

struct PlantRow_Previews: PreviewProvider {
    static var previewContext: NSManagedObjectContext = {
        let container = NSPersistentContainer(name: "PlantModel") 
        container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load in-memory store: \(error)")
            }
        }
        return container.viewContext
    }()
    
    static var samplePlant: Plant = {
        let plant = Plant(context: previewContext)
        plant.name = "Preview Apple"
        plant.category = "Seed and Fruit Crops"
        plant.datePlanted = Date()
        plant.nextWaterDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        plant.nextNutrientDate = Calendar.current.date(byAdding: .day, value: 7, to: Date())!
        plant.expectedVeggieDate = Calendar.current.date(byAdding: .day, value: 30, to: Date())!
        plant.expectedBloomDate = Calendar.current.date(byAdding: .day, value: 20, to: Date())!
        plant.notes = "This is a preview plant for UI testing."
        return plant
    }()
    static var previews: some View {
        PlantRow(plant: samplePlant)
    }
}
