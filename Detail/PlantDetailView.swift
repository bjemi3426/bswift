
import SwiftUI

struct PlantDetailView: View {

    let plant: Plant?
    var body: some View {
        if let plant = plant {
            VStack {
                Text(plant.showName)
                    .font(.largeTitle)
                    .bold()
                    .italic()
                    .padding()
            }
            .foregroundColor(.secondary)
            Spacer()
            VStack {
                HStack(spacing: 20) {
                    VStack(spacing: 15) {
                        Text(StringHelper.sampleTitle1).bold().underline()
                        Text(StringHelper.sampleText)
                        VStack {
                            Text(StringHelper.sampleTitle2).bold().underline()
                            Text(StringHelper.sampleText)
                        }
                    }
                    .padding(.leading)
                    let imageExists = NSImage(named: plant.showName.lowercased()) != nil
                    let plantImage = plant.image.flatMap { NSImage(data: $0) }
                    if imageExists {
                        Image(plant.showName.lowercased())
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .frame(width: 300, height: 540)
                            .offset(y: -90)
                    } else if let image = plantImage {
                        Image(nsImage: image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .frame(width: 300, height: 540)
                            .offset(y: -90)
                    }
                                
                    
                    VStack(spacing: 15) {
                        Text(StringHelper.sampleTitle3).bold().underline()
                        Text(StringHelper.sampleText)
                        VStack {
                            Text(StringHelper.sampleTitle4).bold().underline()
                            Text(StringHelper.sampleText)
                        }
                    }
                    .padding(.trailing)
                }
            }
            .foregroundColor(.secondary)
            VStack(alignment: .leading) {
                HStack {
                    Text("Categories:").bold()
                    Text(plant.showCategory).foregroundColor(.secondary).padding()
                }
                
                HStack {
                    Text("Notes:").bold()
                    Text(plant.showNotes)
                }
                
                HStack {
                    Text("Date Planted: ").bold()
                    Text(plant.showDatePlanted, format: .dateTime)
                }
                
                HStack {
                    Text("Next Water: ").bold()
                    Text(plant.showNextWaterDate, format: .dateTime)
                       
                }
                HStack {
                    Text("Next Nutrient: ").bold()
                    Text(plant.showNextNutrientDate, format: .dateTime)
                }
                
                HStack {
                    Text("Expected veggie: ").bold()
                    Text(plant.showExpectedVeggie, format: .dateTime)
                }
                
                HStack {
                    Text("Expected Blooming: ").bold()
                    Text(plant.showExpectedBloomDate, format: .dateTime)
                }
               
            }
            .foregroundColor(.secondary)
            Spacer()
        }
       
    }
}

struct PlantDetailView_Previews: PreviewProvider {
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
        PlantDetailView(plant: samplePlant )
    }
}

