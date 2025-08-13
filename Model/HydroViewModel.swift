
import Foundation
import CoreData

class HydroponicsViewModel: ObservableObject {
    @Published var type: String = ""
    @Published var growMedium: String = ""
    @Published var tankSize: String = ""
    @Published var phLevel: Int = 0
    @Published var ppm: Int = 0
    @Published var waterTemp: Int = 0

    var hydroponics: Hydroponics?
    var context: NSManagedObjectContext

    init(context: NSManagedObjectContext, hydroponics: Hydroponics? = nil) {
        self.context = context
        self.hydroponics = hydroponics
        
        if let hydroponics = hydroponics {
            self.type = hydroponics.type ?? ""
            self.growMedium = hydroponics.growMedium ?? ""
            self.tankSize = hydroponics.tankSize ?? ""
            self.phLevel = Int(hydroponics.phLevel)
            self.ppm = Int(hydroponics.ppm)
            self.waterTemp = Int(hydroponics.waterTemp)
        }
        addSampleEntryIfNeeded()
    }

    func save() {
        let hydro = hydroponics ?? Hydroponics(context: context)
        hydro.type = type
        hydro.growMedium = growMedium
        hydro.tankSize = tankSize
        hydro.phLevel = Int64(phLevel)
        hydro.ppm = Int64(ppm)
        hydro.waterTemp = Int64(waterTemp)

        do {
            try context.save()
        } catch {
            print("Failed to save Hydroponics: \(error.localizedDescription)")
        }
    }
    
    func addSampleEntry() {
        let newHydroponic = Hydroponics(context: context)
        newHydroponic.type = "NFT" 
        newHydroponic.growMedium = "Coco Coir"
        newHydroponic.tankSize = "20 Liters"
        newHydroponic.phLevel = 6
        newHydroponic.ppm = 850
        newHydroponic.waterTemp = 22

        do {
            try context.save()
            print("Sample hydroponic entry saved.")
        } catch {
            print("Failed to save sample entry: \(error.localizedDescription)")
        }
    }

    
    func addSampleEntryIfNeeded() {
        let request: NSFetchRequest<Hydroponics> = Hydroponics.fetchRequest()
        request.fetchLimit = 1

        if let result = try? context.fetch(request), result.isEmpty {
            addSampleEntry()
        }
    }

}

extension Hydroponics {
    var showType: String {
        type ?? "N/A"
    }
    var showGrowMedium: String {
        growMedium ?? "N/A"
    }
    
    var showTankSize: String {
        tankSize ?? "N/A"
    }
    var showPHLevel: Int64 {
        phLevel
    }
    
    var showPPM: Int64 {
        ppm
    }
    var showWaterTemp: Int64 {
        waterTemp
    }
}

