//
//  ImageEffectView.swift
//  LinkedInTabBar
//
//  Created by Arun Skyraan  on 10/11/22.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ImageEffectView: View {
    
    @Binding var image: UIImage?
    
    @StateObject var homeData = HomeViewModel()
    
    var body: some View {
        VStack {
            if !homeData.allImages.isEmpty && homeData.mainView != nil {
                Spacer(minLength: 0)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(homeData.allImages) { filtered in
                            Image(uiImage: filtered.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)

                                .onTapGesture {
                                    homeData.value = 1.0
                                    homeData.mainView = filtered
                                    image = filtered.image
                                }
                        }
                    }
                    .padding()
                }
            } else {
 
                ProgressView()
                    .onAppear {
                        let ciImage = CIImage(image: image!)
                        homeData.updateEffect(filter: CIFilter.sepiaTone())
                        homeData.allImages.removeAll()
                        homeData.mainView = nil
                        homeData.loadFilter(ciimage: ciImage!)
                    }
                    .onChange(of: homeData.value, perform: { (_) in
                        homeData.updateEffect(filter: CIFilter.sepiaTone())
                    })
                    .onChange(of: homeData.imageData, perform: { (_) in
                        // Whenever image is changed firing loadImage
                        // clearing existing data
                        let ciImage = CIImage(image: image!)
                        homeData.allImages.removeAll()
                        homeData.mainView = nil
                        homeData.loadFilter(ciimage: ciImage!)
                    })
            }
        }

        
    }
  
    
}

//struct ImageEffectView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageEffectView()
//    }
//}











