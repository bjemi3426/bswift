import Foundation
import AppKit
import CoreData



class PlantViewModel: ObservableObject {
    
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        preloadRootCropsIfNeeded()
    }
    
    private func preloadRootCropsIfNeeded() {
        let request: NSFetchRequest<Plant> = Plant.fetchRequest()
        request.predicate = NSPredicate(format: "category == %@", "Root Crops")
        request.fetchLimit = 1
        
        do {
            let existing = try context.fetch(request)
            if existing.isEmpty {
            }
        } catch {
            print("Failed to check existing plants: \(error)")
        }
    }
    
    private func addCrops(crops: [String], category: String) {
        
        for name in crops {
            let plant = Plant(context: context)
            plant.name = name
            plant.category = category
            plant.datePlanted = Date()
            plant.nextWaterDate = Date()
            plant.nextNutrientDate = Date()
            plant.expectedVeggieDate = Date()
            plant.expectedBloomDate = Date()
            plant.notes = ""
            plant.isFavorited = true
        }
        
        do {
            try context.save()
            print("Root crops saved to Core Data.")
        } catch {
            print("Error saving root crops: \(error)")
        }
    }

}

class AddPhoto {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
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
                
                try context.save()
                print("Saved image to plant: \(plant)")
            } catch {
                print("Failed to load or save image: \(error)")
            }
        }
    }
}

extension Plant {
    var plantImage: Data {
        return image ?? Data().base64EncodedData()
    }
}

