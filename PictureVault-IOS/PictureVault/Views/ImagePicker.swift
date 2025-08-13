//
//  ImagePicker.swift
//  PictureVault
//
//  Created by Bjem on 8/13/25.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var openImagePicker: Bool
    @Binding var picture: UIImage?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let mediaPicker = UIImagePickerController()
        mediaPicker.delegate = context.coordinator
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            mediaPicker.sourceType = .photoLibrary
            mediaPicker.mediaTypes = ["public.image"]
            mediaPicker.allowsEditing = false
            mediaPicker.cameraCaptureMode = .photo
        } else {
            print("The media is not available")
        }
        return mediaPicker
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        ImagePickerCoordinator(open: $openImagePicker, picture: $picture)
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
     var openImagePicker: Binding<Bool>
     var picture:  Binding<UIImage?>
    
    init(open: Binding<Bool>, picture: Binding<UIImage?>) {
        self.openImagePicker = open
        self.picture = picture
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let newPicture = info[.originalImage] as?  UIImage {
            self.picture.wrappedValue = newPicture
        }
        self.openImagePicker.wrappedValue = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.openImagePicker.wrappedValue = false
    }
    
    
}
