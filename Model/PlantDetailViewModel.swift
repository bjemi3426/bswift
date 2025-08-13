//
//  PlantDetailViewModel.swift
//  SmartyPlants
//
//  Created by Bjem on 7/15/25.
//

import Foundation

class PlantDetailViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var age: Int = 0
    @Published var category: PlantCategory = .rootCrops
    @Published var datePlanted: Date = Date()
    @Published var nextWaterDate: Date = Date()
    @Published var nextNutrientDate: Date = Date()
    @Published var expectedVeggieDate: Date = Date()
    @Published var expectedBloomDate: Date = Date()

}
