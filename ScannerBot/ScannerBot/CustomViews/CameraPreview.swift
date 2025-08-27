//
//  CameraPreview.swift
//  ScannerBot
//
//  Created by Bjem on 8/26/25.
//

import Foundation
import AVFoundation
import SwiftUI

struct CameraPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CameraViewController {
        return CameraViewController()
    }
    
    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {
     
    }
    
    class CameraViewController: UIViewController {
        private let captureSession = AVCaptureSession()
        private var previewLayer: AVCaptureVideoPreviewLayer!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            
            if status == .notDetermined {
                AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
                    if granted {
                        self.setupCamera()
                    }
                })
            }
            print("Camera setup")
        }
        
        private func setupCamera() {
            guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
            guard let videoInput = try? AVCaptureDeviceInput(device: videoCaptureDevice) else { return }
            
            
            if captureSession.canAddInput(videoInput) {
                captureSession.addInput(videoInput)
            }
            
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            previewLayer.frame = view.layer.bounds
            previewLayer.videoGravity = .resizeAspectFill
            view.layer.addSublayer(previewLayer)
            
            captureSession.startRunning()
        }
    }
}
