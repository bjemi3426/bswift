
import SwiftUI

struct PlantDetailView: View {
    let sampleText = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
"""
    let plant: Plant
    var body: some View {
        VStack {
            Text(plant.name)
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
                    Text("Where To Grow").bold().underline()
                    Text(sampleText)
                    VStack {
                        Text("In the kitchen").bold().underline()
                        Text(sampleText)
                    }
                }
                .padding(.leading)
                Image(plant.name.lowercased())
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .frame(width: 300, height: 540)
                    .offset(y: -90)
                
                VStack(spacing: 15) {
                    Text("Pests and diseases").bold().underline()
                    Text(sampleText)
                    VStack {
                        Text("In the garden").bold().underline()
                        Text(sampleText)
                    }
                    
                }
                .padding(.trailing)
            }
        }
        .foregroundColor(.secondary)
       
   
        VStack(alignment: .leading) {
            HStack {
                Text("Categories:").bold()
                Text(plant.category.rawValue).foregroundColor(.secondary).padding()
            }
            
            HStack {
                Text("Date Planted: ").bold()
                Text(plant.datePlanted, format: .dateTime)
            }
            HStack {
                Text("Expected veggie: ").bold()
                Text(plant.expectedVeggieDate, format: .dateTime)
            }
            HStack {
                Text("Expected Blooming: ").bold()
                Text(plant.expectedBloomDate, format: .dateTime)
            }
            HStack {
                Text("Next Water: ").bold()
                Text(plant.nextWaterDate, format: .dateTime)
                   
            }
            HStack {
                Text("Next Nutrient: ").bold()
                Text(plant.nextNutrientDate, format: .dateTime)
            }
        }
        .foregroundColor(.secondary)
        Spacer()
    }
}

struct PlantDetailView_Previews: PreviewProvider {
    static var plant = Plant(name: "Sweet potato", age: 4, category: .rootCrops, datePlanted: Date.now, nextWaterDate: Date.now, nextNutrientDate: Date.now, expectedVeggieDate: Date.now, expectedBloomDate: Date.now)
    static var previews: some View {
        PlantDetailView(plant: plant )
    }
}
