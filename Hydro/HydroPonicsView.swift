//
//  HydroPonicsView.swift
//  SmartyPlants
//
//  Created by Bjem on 7/16/25.
//

import SwiftUI

struct HydroPonicsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    let plant: Plant
    let hydro: Hydroponics? = nil
   
    var body: some View {
        let imageExists = NSImage(named: plant.showName.lowercased()) != nil
        let plantImage = plant.image.flatMap { NSImage(data: $0) }
        if imageExists {
            Image(plant.showName.lowercased())
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .frame(width: 150, height: 270)
        } else if let image = plantImage {
            Image(nsImage: image)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .frame(width: 150, height: 270)
        }
        FeedingChartView(plant: plant)
        }
       
    }


