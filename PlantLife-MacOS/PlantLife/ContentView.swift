

import SwiftUI

struct ContentView: View {
    @ObservedObject var plantViewModel = PlantViewModel()
    @State var selectedPlant: Plant?
    @State var searchText = ""
    @State var sortButtonTapped = false
    var allCrops: [Plant] {
        let crops = plantViewModel.rootCrops + plantViewModel.leafyCrops + plantViewModel.seedAndFruitCrops + plantViewModel.stemAndFlowerCrops
        if searchText == "" {
            return crops
        } else {
            return crops.filter({$0.name.contains(searchText)})
        }
    }
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(allCrops.sorted()) { plant in
                    PlantRow(plant: plant)
                        .onTapGesture {
                            selectedPlant = plant
                        }
                    Divider()
                }
            }
            .frame(minWidth: 10)
            .confirmationDialog("Sort By", isPresented: $sortButtonTapped, actions: {
         
                    Button("A-Z") {
                        
                    }
                   
                    Button("Water date") {
                        
                    }
                    
                    Button("Nutrient date") {
                        
                    }
                
                
            })
            Button(action: {
                sortButtonTapped.toggle()
            }) {
                Image(systemName: "line.3.horizontal.circle.fill")
            }
            .padding()
            
        } detail: {
            if let selectedPlant = selectedPlant {
                PlantDetailView(plant: selectedPlant)
            }
        }
       
        .searchable(text: $searchText)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var plantVM = PlantViewModel()
    static var previews: some View {
        ContentView(selectedPlant: plantVM.rootCrops.first!)
    }
}
