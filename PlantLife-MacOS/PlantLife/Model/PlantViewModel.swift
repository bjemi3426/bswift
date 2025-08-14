

import Foundation


class PlantViewModel: ObservableObject {

  @Published var rootCrops = [
    Plant(name: "Potato", age: 4, category: .rootCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
    Plant(name: "Sweet potato", age: 4, category: .rootCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
    Plant(name: "Carrot", age: 4, category: .rootCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
    Plant(name: "Radish", age: 4, category: .rootCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
    Plant(name: "Parsnip", age: 4, category: .rootCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
    Plant(name: "Beet", age: 4, category: .rootCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
    Plant(name: "Turnip", age: 4, category: .rootCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
    Plant(name: "Rutabaga", age: 4, category: .rootCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
    Plant(name: "Onion", age: 4, category: .rootCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
    Plant(name: "Shallot", age: 4, category: .rootCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
    Plant(name: "Garlic", age: 4, category: .rootCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
    Plant(name: "Celeriac", age: 4, category: .rootCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now)
  ]
    
    @Published var leafyCrops = [
        Plant(name: "Cabbage", age: 4, category: .leafyCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Brussel Sprouts", age: 4, category: .leafyCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Kale", age: 4, category: .leafyCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Mizuna", age: 4, category: .leafyCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Spinach", age: 4, category: .leafyCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Lettuce", age: 4, category: .leafyCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Arugula", age: 4, category: .leafyCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
       
    ]
    
    @Published var seedAndFruitCrops = [
    
        Plant(name: "Peas", age: 4, category: .seedAndFruits, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Snap Peas", age: 4, category: .seedAndFruits, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Zucchini", age: 4, category: .seedAndFruits, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Sqaush", age: 4, category: .seedAndFruits, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Cucumber", age: 4, category: .seedAndFruits, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Corn", age: 4, category: .seedAndFruits, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Eggplant", age: 4, category: .seedAndFruits, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Sweet Pepper", age: 4, category: .seedAndFruits, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Chili Peppers", age: 4, category: .seedAndFruits, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Tomato", age: 4, category: .seedAndFruits, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
    ]
    
    @Published var stemAndFlowerCrops = [
        Plant(name: "Brocoli", age: 4, category: .stemAndFlower, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Cauliflower", age: 4, category: .stemAndFlower, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Leek", age: 4, category: .stemAndFlower, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Spring Onion", age: 4, category: .stemAndFlower, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Celery", age: 4, category: .stemAndFlower, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now),
        Plant(name: "Asparagus", age: 4, category: .stemAndFlower, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now)
    ]

}
