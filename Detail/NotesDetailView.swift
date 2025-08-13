//
//  NotesDetailView.swift
//  SmartyPlants
//
//  Created by Bjem on 7/15/25.
//

import SwiftUI

struct NotesDetailView: View {
    @State var notes: String = ""
    @Binding var plant: Plant
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Plant Notes")) {
                    TextEditor(text: $notes)
                        .frame(minWidth: 300, minHeight: 200)
                }
            }
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        plant.notes = notes
                        try? viewContext.save()
                        dismiss()
                    }
                }
            }
        }
    }
}

struct NotesDetailView_Previews: PreviewProvider {
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
        NotesDetailView(plant: .constant(samplePlant))
    }
}
