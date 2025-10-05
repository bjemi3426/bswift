//
//  ImagePickerController.swift
//  ProductsDemo
//
//  Created by Bjem on 10/4/25.
//

import Foundation
import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
    @Binding var openImagePicker: Bool
    @Binding var picture: UIImage?
    
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
           let mediaPicker = UIImagePickerController()
           mediaPicker.delegate = context.coordinator
           mediaPicker.allowsEditing = false

           if UIImagePickerController.isSourceTypeAvailable(.camera) {
               mediaPicker.sourceType = .camera
               mediaPicker.cameraCaptureMode = .photo
               mediaPicker.mediaTypes = ["public.image"]
           } else if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
               mediaPicker.sourceType = .photoLibrary
               mediaPicker.mediaTypes = ["public.image"]
           }
           
           return mediaPicker
       }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        ImagePickerCoordinator(open: $openImagePicker, picture: $picture)
    }
    
    class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var openImagePicker: Binding<Bool>
        var picture: Binding<UIImage?>
        
        init(open: Binding<Bool>, picture: Binding<UIImage?>) {
            self.openImagePicker = open
            self.picture = picture
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let newPicture = info[.originalImage] as? UIImage {
                self.picture.wrappedValue = newPicture
            }
            self.openImagePicker.wrappedValue = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.openImagePicker.wrappedValue = false
        }
    }
}
