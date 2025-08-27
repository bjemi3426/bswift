//
//  SettingsView.swift
//  ScannerBot
//
//  Created by Bjem on 8/25/25.
//

import SwiftUI

struct SettingsView: View {
    @State var isWePrefixing: Bool = false
    var body: some View {
        Form(content: {
            
            Text("Setting")
            HStack {
                Toggle("", isOn: $isWePrefixing)
                    .labelsHidden()
                Text(isWePrefixing ? "on" : "off")
                    .padding()
                    .background(Color(isWePrefixing ? .green : .gray))
            }
           
            Button(action: {
                
            }) {
                Text("Camera settings")
                Image(systemName: "camera")
            }
            
            Button(action: {
                
            }) {
                Text("Scanning settings")
                Image(systemName: "scanner")
            }

            
            Button(action: {
                
            }) {
                Text("Display settings")
                Image(systemName: "plus")
            }

        })
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
