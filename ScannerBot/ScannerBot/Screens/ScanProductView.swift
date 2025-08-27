//
//  AddProductView.swift
//  ScannerBot
//
//  Created by Bjem on 8/25/25.
//

import SwiftUI

import AVFoundation

struct ScanProductView: View {
    @State private var scannedCode: String = "No code scanned yet"
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Scan Product Code")
                .font(.title)
                .padding()

            CameraPreview()
                .frame(height: 300)
                .cornerRadius(12)
                .padding()

            Text("Scanned Code: \(scannedCode)")
                .padding()
                .foregroundColor(.gray)

            Spacer()

            Button("Cancel") {
                dismiss()
            }
            .foregroundColor(.red)
            .padding()
        }
        .navigationBarHidden(true)
    }
}

