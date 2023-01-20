//
//  ImageSelectView.swift
//  VerseEditorBeta (iOS)
//
//  Created by Arun_Skyraan on 28/10/22.
//

import SwiftUI

struct ImageSelectView: View {
    
    @State var dummyImages: [String] = ["b1", "b2", "b3", "b4", "b5"]
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    
    @State private var showScreen: Bool = false
    @State private var image: UIImage? = nil
    @State var Navigate = false
    
    @StateObject var homeData = HomeViewModel() // ***
    
    @Binding var verse: String
    
    var body: some View {

        VStack(spacing: 30) {
            Image(systemName: "chevron.up")
                .foregroundColor(.white)
                .padding(.top)
            
            LazyVGrid(columns: columns, spacing: 6) {
                Button(action: {
                    homeData.imagePicker.toggle()
                }, label: {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 150)
                        .overlay(Image(systemName: "photo"))
                })

                ForEach(0..<dummyImages.count, id: \.self) { index in
                    
                    Button(action: {
                        image = UIImage(named: dummyImages[index])!
                    }, label: {
                        Image("\(dummyImages[index])")
                            .resizable()
                            .frame(height: 150)
                    })
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.black.ignoresSafeArea())
        .cornerRadius(30)
        .sheet(isPresented: $homeData.imagePicker) {
            ImagePicker(picker: $homeData.imagePicker, imageData: $homeData.imageData)
        }
        .onChange(of: homeData.imageData, perform: {
            _ in
            if homeData.imageData.count != 0{
                image = UIImage(data: homeData.imageData)
                    Navigate = true
                }else{
                    Navigate = false
                }
        })
        .background(
//            NavigationLink(destination: ContentView(image: $image, verse: $verse), isActive: $Navigate, label: {})
//            NavigationView{
            NavigationLink(destination: ContentView(image: $image, verse: $verse, data: $homeData.imageData), isActive: $Navigate, label: {})
//            }

        )
    }
}

struct ImageSelectView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSelectView(verse: .constant("tapped verse"))
    }
}


struct UIImagePickerControllerRepresentable: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    @Binding var showScreen: Bool
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let vc = UIImagePickerController()
        vc.allowsEditing = false
        vc.delegate = context.coordinator
        return vc
    }
    
    // from SwiftUI to UIKit
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    // from UIKit to SwiftUI
    func makeCoordinator() -> Coordinator {
        return Coordinator(image: $image, showScreen: $showScreen)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        @Binding var image: UIImage?
        @Binding var showScreen: Bool

        init(image: Binding<UIImage?>, showScreen: Binding<Bool>) {
            self._image = image
            self._showScreen = showScreen
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let newImage = info[.originalImage] as? UIImage else { return }
            image = newImage
            showScreen = false
        }
        
    }
    
}
