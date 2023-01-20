//
//  ContentView.swift
//  LinkedInTabBar
//
//  Created by Arun_Skyraan  on 07/11/22.
//

import SwiftUI
import Photos

struct ContentView: View {
    
    let tabs: [TabBarItem] = [TabBarTab(title: "Home",
                                        image: Image(systemName: "t.square"),
                                        selectedImage: Image(systemName: "t.square.fill"),
                                        view: AnyView(EmptyView())),
                              TabBarTab(title: "My Network",
                                        image: Image(systemName: "textformat"),
                                        selectedImage: Image(systemName: "textformat"),
                                        view: AnyView(EmptyView())),
                              TabBarTab(title: "Notifications",
                                        image: Image(systemName: "rectangle.on.rectangle"),
                                        selectedImage: Image(systemName: "rectangle.fill.on.rectangle.fill"),
                                        view: AnyView(EmptyView())),
                              TabBarTab(title: "Jobs",
                                        image: Image(systemName: "drop"),
                                        selectedImage: Image(systemName: "drop.fill"),
                                        view: AnyView(EmptyView())),
                              TabBarTab(title: "boook",
                                        image: Image(systemName: "slider.horizontal.below.rectangle"),
                                        selectedImage: Image(systemName: "slider.horizontal.below.square.filled.and.square"),
                                        view: AnyView(EmptyView())),
                              TabBarTab(title: "Effect",
                                        image: Image(systemName: "photo"),
                                        selectedImage: Image(systemName: "photo.fill"),
                                        view: AnyView(EmptyView()))
    ]
    
    @Binding var image: UIImage?
    @Binding var verse: String
    @Binding var data: Data
    
    //Text
    @State var Font : String = "Georgia" //font state -> by changing binding value(from TextEditor view)
    @State var alignment: TextAlignment = .center //alignment state -> by getting binding value (from fontEditiorView)
    @State var size: CGFloat = 18 // size state -> by changing binding value  (from fontEditiorView)
    @State var letterSpace: CGFloat = 0 //letter space state -> by changing binding value  (from fontEditiorView)
    @State var lineSpacing: CGFloat = 0 //letter space state -> by changing binding value  (from fontEditiorView)
    @State var ImgFrame: CGFloat = 1 //image frame state -> by changing binding value(from frameEditor view)
    @State var textColor: Color = .white //text color state -> by changing binding value(from blurEditor)
    @State var imgBrightness: Double = 0 //image brightness -> by changing binding value(from brightnessEditor)
    @State var imgSaturarion: Double = 0.8 //
    @State var imgContrast: Double = 0.8
    
    func RetImg() -> UIImage?{
        if let image = image {
            return Image(uiImage: image)
                .resizable()
                .aspectRatio(self.ImgFrame ,contentMode: .fit)
                .brightness(imgBrightness)
                .saturation(imgSaturarion)
                .contrast(imgContrast)
                .padding()
                .overlay(Text(verse)
                    .foregroundColor(textColor)
                    .kerning(letterSpace)
                    .lineSpacing(lineSpacing)
                    .font(.custom(Font, size: size))
                    .multilineTextAlignment(alignment)
                )
                .asUIImage()
        } else {
            return Image("b1")
                .resizable()
                .aspectRatio(self.ImgFrame ,contentMode: .fit)
                .brightness(imgBrightness)
                .saturation(imgSaturarion)
                .contrast(imgContrast)
                .padding()
                .overlay(Text(verse)
                    .foregroundColor(textColor)
                    .kerning(letterSpace)
                    .lineSpacing(lineSpacing)
                    .font(.custom(Font, size: size))
                    .multilineTextAlignment(alignment)
                )
                .asUIImage()
        }
        
    }
    @State var currentTab: TabBarTab = TabBarTab(title: "Home",
                                                 image: Image(systemName: "t.square"),
                                                 selectedImage: Image(systemName: "t.square.fill"),
                                                 view: AnyView(EmptyView()))
    @State var isButtonTapped: Bool = false
    @Namespace var namespace
//    let backgroundColor = Color(uiColor: UIColor.secondarySystemBackground)
    let selectedColor: Color = .black
    let unselectedColor: Color = .secondary
    @State var viewState = CGSize.zero
    @State var height : CGFloat = 0
    @State var width : CGFloat = 0
    
    var body: some View {
        VStack {
            VStack {
                if let image = image {
//                    if #available(iOS 16.0, *) {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(self.ImgFrame ,contentMode: .fit)
                            .frame(width:UIScreen.main.bounds.width - 20)
                            .brightness(imgBrightness)
                            .saturation(imgSaturarion)
                            .contrast(imgContrast)
                            .overlay(
                                GeometryReader{
                                    geo in
                                    Color.red
                                        .onAppear(
                                            perform:{
                                                
                                                print(geo.size)
                                                height = geo.size.height
                                                width = geo.size.width
                                            }
                                        )
                                        .opacity(0)
                                }
                            )
                            .overlay(
                                Text(verse)
                                    .padding(50)
                                    .foregroundColor(textColor)
//                                    .kerning(letterSpace)
                                    .lineSpacing(lineSpacing)
                                    .font(.custom(Font, size: size))
                                    .minimumScaleFactor(0.2)
                                    .multilineTextAlignment(alignment)
                                    .offset(x: viewState.width, y: viewState.height)
//                                    .gesture(
//                                        DragGesture()
//                                            .onChanged { value in
//
//                                                    viewState = value.translation
//
//                                            }
//                                    )
                            )
//                    }
//                    else {
//                    }
                }
            }
            Spacer()
            VStack {
                if currentTab.title == "Home"{
                    TextEditorView(Font: $Font)
                } else if currentTab.title == "My Network"{
                    FontEditorView(alignment: $alignment, fontSize: $size, letterSpace: $letterSpace, lineSpacing: $lineSpacing)
                }else if currentTab.title == "Notifications"{
                    FrameEditorView(ImgFrame: $ImgFrame)
                }else if currentTab.title == "Jobs"{
                    BlurEditorView(selectedColor: $textColor)
                }else if currentTab.title == "boook"{
                    BrightnessEditorView(brightness: $imgBrightness, saturation: $imgSaturarion, constrast: $imgContrast)
                }else if currentTab.title == "Effect"{
                    ImageEffectView(image:$image)
                } else {
                    AnyView(EmptyView())
                }
                Spacer()
                HStack {
                    ForEach(tabs) { tab in
                        if let safeTab = tab as? TabBarTab {
                            
                            Button {
                                
                                currentTab = safeTab
                            } label: {
                                VStack(alignment: .center, spacing: 4) {
                                    if currentTab == safeTab {
                                        selectedColor
                                            .frame(height: 2)
                                            .matchedGeometryEffect(id: "line",
                                                                   in: namespace,
                                                                   properties: .frame)
                                        
                                    } else {
                                        Color.clear.frame(height: 2)
                                    }
                                    currentTab == safeTab ? safeTab.selectedImage
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 22, height: 22)
                                        .foregroundColor(currentTab == safeTab ? selectedColor : unselectedColor)
                                        .padding(.top, 4)
                                    : safeTab.image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 22, height: 22)
                                        .foregroundColor(currentTab == safeTab ? selectedColor : unselectedColor)
                                        .padding(.top, 4)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
//                .background(backgroundColor)
            }
                        .ignoresSafeArea(.keyboard, edges: .bottom)
            
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    if let Uiimage = RetImg(){
                        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
                            
                            
                            DispatchQueue.main.async {
                                
                                UIImageWriteToSavedPhotosAlbum(Uiimage, nil, nil, nil)
                            }
                            
                            
                        }
                        else {
                            PHPhotoLibrary.requestAuthorization(requestAuthorizationHandler)
                        }
                    }
                }, label: {
                    Text("save")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.blue)
                        .padding(5)
                        .padding(.horizontal, 5)
                        .background(
                            Capsule()
                                .stroke(Color.blue, lineWidth: 2.0)
                        )
                })
            }
        }
    }
    func DownloadImage(Uiimage:UIImage){
        
    }
    
    func requestAuthorizationHandler(status: PHAuthorizationStatus) {
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
            
        }
        else {
            alertToEncouragePhotoLibraryAccessWhenApplicationStarts()
        }
    }
    
    func alertToEncouragePhotoLibraryAccessWhenApplicationStarts() {
        DispatchQueue.main.async {
            //Photo Library not available - Alert
            let cameraUnavailableAlertController = UIAlertController (title: "Photo Library Unavailable", message: "Please check to see if device settings doesn't allow photo library access", preferredStyle: .alert)
            //        if let vc = UIApplication.shared.windows.first?.rootViewController {
            let settingsAction = UIAlertAction(title: "Settings", style: .destructive) { (_) -> Void in
                let settingsUrl = NSURL(string:UIApplication.openSettingsURLString)
                if let url = settingsUrl {
                    UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                }
            }
            
            let cancelAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
            cameraUnavailableAlertController .addAction(settingsAction)
            cameraUnavailableAlertController .addAction(cancelAction)
            
            UIApplication.shared.windows.first?.rootViewController?.present(cameraUnavailableAlertController, animated: true)
            
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(image: .constant(UIImage(named: "b1")), verse: .constant("Arun how are you doing today?"))
//            .preferredColorScheme(.dark)
//    }
//}

extension View {
    // This function changes our View to UIView, then calls another function
    // to convert the newly-made UIView to a UIImage.
    public func asUIImage() -> UIImage {
        let controller = UIHostingController(rootView: self)
        
        controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 0)
        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)
        
        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        controller.view.sizeToFit()
        //        controller.view.backgroundColor = UIColor.clear
        // here is the call to the function that converts UIView to UIImage: `.asUIImage()`
        let image = controller.view.asUIImage()
        controller.view.removeFromSuperview()
        return image
    }
}

extension UIView {
    // This is the function to convert UIView to UIImage
    public func asUIImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

extension View {
    func snapshot() -> UIImage? {
        
        
        
        
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        
        
        let targetSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        view?.sizeToFit()
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
extension View {
    func snapShots() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .white
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

//                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
