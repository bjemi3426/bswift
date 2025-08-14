

import SwiftUI

struct PlantRow: View {
    let plant: Plant
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
        Text(plant.name)
            .font(.title2)
            .bold()
            .italic()
        Text("Categories: \(plant.category.rawValue)")
        Text(plant.datePlanted, format: .dateTime)
        }
    }
}

struct PlantRow_Previews: PreviewProvider {
    static var plant = Plant(name: "Sweet potato", age: 4, category: .rootCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now)
    static var previews: some View {
        PlantRow(plant: plant)
    }
}
