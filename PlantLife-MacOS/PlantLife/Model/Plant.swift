

import Foundation

enum PlantCategory: String, Codable {
   case rootCrops = " Root Crops"
   case leafyCrops = "Leafy Crops"
   case seedAndFruits = "Seed and Fruit Crops"
   case stemAndFlower = "Stem and Flower Crops"
}

struct Plant: Codable, Identifiable, Comparable {
    static func < (lhs: Plant, rhs: Plant) -> Bool {
        lhs.name < rhs.name
    }
    
    var id = UUID()
    let name: String
    let age: Double
    let category: PlantCategory
    let datePlanted: Date
    let nextWaterDate: Date
    let nextNutrientDate: Date
    let expectedVeggieDate: Date
    let expectedBloomDate: Date
}
