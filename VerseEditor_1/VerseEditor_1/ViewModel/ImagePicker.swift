//
//  ImagePicker.swift
//  FiltersCoreImage
//
//  Created by Ginger on 04/01/2021.
//

import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var picker: Bool
    @Binding var imageData: Data
    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        let picker = PHPickerViewController(configuration: PHPickerConfiguration())
        
        picker.delegate = context.coordinator
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        //
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            // Checking image is selected or cancelled
            if !results.isEmpty {
                // checking image can be loaded
                if results.first!.itemProvider.canLoadObject(ofClass: UIImage.self) {
                    results.first!.itemProvider.loadObject(ofClass: UIImage.self) { image, err in
                        DispatchQueue.main.async {
//                            print(type(of: image))
//                            print(image)
//                            if let Uiimg = UIImage(image),let data = Uiimg.pngData()!{
                                self.parent.imageData = (image as! UIImage).pngData()!
                                self.parent.picker.toggle()
//                            }else{
//                                self.parent.imageData = (UIImage(named: "b1")).pngData()!
//                                self.parent.picker.toggle()
//                            }
                        }
                    }
                }
            } else {
                self.parent.picker.toggle()
            }
        }
    }
}
