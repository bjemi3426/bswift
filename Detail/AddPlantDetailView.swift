import SwiftUI

struct AddPlantDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var plantDetailViewModel = PlantDetailViewModel()
    var onSave: ((Plant) -> Void)?
    
    var body: some View {
        NavigationStack {
            Group {
                
                Form {
                    TextField("Plant Name", text: $plantDetailViewModel.name)
                    Picker("Category", selection: $plantDetailViewModel.category) {
                        ForEach(PlantCategory.allCases)  { category in
                            Text(category.rawValue.capitalized).tag(category)
                        }
                    }
                    
                    DatePicker("Date Planted", selection: $plantDetailViewModel.datePlanted, displayedComponents: .date)
                        .onChange(of: plantDetailViewModel.datePlanted) { newDate in
                                updateSmartDates(for: newDate)
                            }
                    DatePicker("Next Watering", selection: $plantDetailViewModel.nextWaterDate, displayedComponents: .date)
                    DatePicker("Next Nutrients", selection: $plantDetailViewModel.nextNutrientDate, displayedComponents: .date)
                    DatePicker("Expected Veggie Date", selection: $plantDetailViewModel.expectedVeggieDate, displayedComponents: .date)
                    DatePicker("Expected Bloom Date", selection: $plantDetailViewModel.expectedBloomDate, displayedComponents: .date)
                    
                }
                .padding()
            }
            .navigationTitle("Add Plant")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    
                    Button("Add Plant") {
                        let newPlant = Plant(context: viewContext)
                        newPlant.name = plantDetailViewModel.name
                        newPlant.category = plantDetailViewModel.category.rawValue
                        newPlant.datePlanted = plantDetailViewModel.datePlanted
                        newPlant.nextWaterDate = Calendar.current.date(byAdding: .day, value: 3, to: plantDetailViewModel.datePlanted) ?? plantDetailViewModel.datePlanted
                        newPlant.nextNutrientDate = Calendar.current.date(byAdding: .day, value: 7, to: plantDetailViewModel.datePlanted) ?? plantDetailViewModel.datePlanted
                        newPlant.expectedVeggieDate = Calendar.current.date(byAdding: .day, value: 60, to: plantDetailViewModel.datePlanted) ?? plantDetailViewModel.datePlanted
                        newPlant.expectedBloomDate = Calendar.current.date(byAdding: .day, value: 90, to: plantDetailViewModel.datePlanted) ?? plantDetailViewModel.datePlanted
                        newPlant.notes = ""
                        newPlant.isUserPlant = true
                        
                        do {
                            updateSmartDates(for: plantDetailViewModel.datePlanted)
                            try viewContext.save()
                        } catch {
                            print("Error saving: \(error.localizedDescription)")
                        }
                        dismiss()
                    }
                    .disabled(plantDetailViewModel.name.isEmpty)
                }
            }
        }
    }
    
    func updateSmartDates(for newDate: Date) {
        plantDetailViewModel.nextWaterDate = Calendar.current.date(byAdding: .day, value: 3, to: newDate) ?? newDate
        plantDetailViewModel.nextNutrientDate = Calendar.current.date(byAdding: .day, value: 7, to: newDate) ?? newDate
        plantDetailViewModel.expectedVeggieDate = Calendar.current.date(byAdding: .day, value: 60, to: newDate) ?? newDate
        plantDetailViewModel.expectedBloomDate = Calendar.current.date(byAdding: .day, value: 90, to: newDate) ?? newDate
    }
}

struct AddPlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlantDetailView()
    }
}
