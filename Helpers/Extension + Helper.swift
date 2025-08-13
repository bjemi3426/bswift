//
//  Extension + Helper.swift
//  SmartyPlants
//
//  Created by Bjem on 7/15/25.
//

import Foundation

extension Plant {
    var showName: String {
        return name ?? "N/A"
    }
    
    var showCategory: String {
        return category ?? "N/A"
    }
    
    var showDatePlanted: Date {
        return datePlanted ?? Date.now
    }
    
    var showNextWaterDate: Date {
        return nextWaterDate ?? Date.now
    }
    
    var showNextNutrientDate: Date {
        return nextNutrientDate ?? Date.now
    }
    
    var showExpectedVeggie: Date {
        return expectedVeggieDate ?? Date.now
    }
    
    var showExpectedBloomDate: Date {
        return expectedBloomDate ?? Date.now
    }
    
    var showNotes: String {
        return notes ?? "N/A"
    }
}

enum PlantCategory: String, Codable, CaseIterable, Identifiable {
   case rootCrops = " Root Crops"
   case leafyCrops = "Leafy Crops"
   case seedAndFruits = "Seed and Fruit Crops"
   case stemAndFlower = "Stem and Flower Crops"
    
    var id: String { self.rawValue }
}

enum PlantFilter: String, CaseIterable {
    case all = "All Plants"
    case mine = "My Plants"
    case favorites = "Favorites"
}
