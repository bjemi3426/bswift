
import SwiftUI

struct PlantFeedingEntry: Identifiable {
    let id = UUID()
    let plantName: String
    let feedings: [String] // Example: ["2025-08-01", "2025-08-08", ...]
}

struct FeedingChartView: View {
    let columns = ["2025-08-01", "2025-08-08", "2025-08-15", "2025-08-22"]
    let plant: Plant
    
    
    var body: some View {
        let data: [PlantFeedingEntry] = [
            PlantFeedingEntry(plantName: plant.name ?? "no name found", feedings: ["✓", "✓", "", "✓"]),
            PlantFeedingEntry(plantName: plant.name ?? "no name found", feedings: ["✓", "", "✓", "✓"]),
            PlantFeedingEntry(plantName: plant.name ?? "no name found", feedings: ["✓", "✓", "✓", "✓"]),
        ]
        ScrollView([.horizontal, .vertical]) {
            VStack(alignment: .leading, spacing: 1) {
                HStack(spacing: 1) {
                    Text("Plant")
                        .bold()
                        .frame(width: 100, height: 40)
                        .background(Color.gray.opacity(0.2))
                    
                    ForEach(columns, id: \.self) { date in
                        Text(date)
                            .bold()
                            .frame(width: 100, height: 40)
                            .background(Color.gray.opacity(0.2))
                    }
                }

                ForEach(data) { entry in
                    HStack(spacing: 1) {
                        Text(entry.plantName)
                            .frame(width: 100, height: 40)
                            .background(Color.secondary.opacity(0.1))

                        ForEach(entry.feedings.indices, id: \.self) { index in
                            Text(entry.feedings[index])
                                .frame(width: 100, height: 40)
                                .background(Color.blue.opacity(0.05))
                        }
                    }
                }
            }
        }
        .padding()
    }
}


