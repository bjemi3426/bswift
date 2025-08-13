

import SwiftUI

struct ContentView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Plant.name, ascending: true)],
        animation: .default)
    private var plants: FetchedResults<Plant>
    @State var selectedPlant: Plant?
    @State var searchText = ""
    @State var sortButtonTapped = false
    @State var addNewPlantButtonTapped = false
    @State var hydroButtonTapped = false
    @State private var filter: PlantFilter = .all
    
    var uniquePlants: [Plant] {
        var seen = Set<String>()
        return plants.filter { plant in
            
            guard let name = plant.name else { return false }
            
            return seen.insert(name).inserted
        }
    }
    
    var filteredPlants: [Plant] {
        uniquePlants.filter { plant in
            switch filter {
            case .all:
                return true
            case .mine:
                return plant.isUserPlant
            case .favorites:
                return plant.isFavorited
            }
        }
    }
    
    var body: some View {
        NavigationSplitView {
            HStack {
                ForEach(PlantFilter.allCases, id: \.self) { tab in
                    Button(action: {
                        filter = tab
                    }) {
                        Text(tab.rawValue)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(filter == tab ? Color.green.opacity(0.2) : Color.clear)
                            .cornerRadius(8)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
            
            List {
                ForEach(filteredPlants, id: \.id) { plant in
                    PlantRow(plant: plant)
                        .background(
                            selectedPlant == plant
                            ? Color.secondary.opacity(0.3)
                            : Color.clear
                        )
                        .onTapGesture {
                            selectedPlant = plant
                            print(plant.isFavorited)
                        }
                    Divider()
                }
            }
            
            .frame(minWidth: 80)
            .confirmationDialog("Sort By", isPresented: $sortButtonTapped, actions: {
                
                Button("A-Z") {
                    
                }
                
                Button("Water date") {
                    
                }
                
                Button("Nutrient date") {
                    
                }
            })
            .sheet(isPresented: $addNewPlantButtonTapped, content: {
                AddPlantDetailView()
            })
            HStack {
                Button(action: {
                    addNewPlantButtonTapped.toggle()
                }) {
                    Image(systemName: "plus.circle.fill")
                }
                .padding()
                
                Spacer()
                Button(action: {
                    sortButtonTapped.toggle()
                }) {
                    Image(systemName: "line.3.horizontal.circle.fill")
                }
                .padding()
                
            }
            
        } detail: {
            if hydroButtonTapped {
                if let selectedPlant = selectedPlant {
                    HydroPonicsView(plant: selectedPlant)
                }
                
            } else {
                if let selectedPlant = selectedPlant {
                    ScrollView {
                        PlantDetailView(plant: selectedPlant)
                    }
                    
                }
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button(action: {
                    hydroButtonTapped.toggle()
                }) {
                    
                    Image(systemName: "drop.circle")
                    Text("Hydro")
                }
                .help("Switch to Hydro")
            }
        }
        .navigationViewStyle(.automatic)
        .searchable(text: $searchText)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

