//
//  VerseEditorView.swift
//  VerseEditorBeta (iOS)
//
//  Created by Arun_Skyraan on 28/10/22.
//

import SwiftUI

struct VerseEditorView: View {
    
//    @State private var tabSelection: TabBarItem = .textStyle
    
    @Binding var image: UIImage?
    @Binding var verse: String
    //Text
    @Binding var Font : String  //font state -> by changing binding value(from TextEditor view)
    @State var alignment: TextAlignment = .center //alignment state -> by getting binding value (from fontEditiorView)
    @State var size: CGFloat = 18 // size state -> by changing binding value  (from fontEditiorView)
    @State var letterSpace: CGFloat = 0 //letter space state -> by changing binding value  (from fontEditiorView)
    @State var lineSpacing: CGFloat = 0 //letter space state -> by changing binding value  (from fontEditiorView)
    @State var ImgFrame: CGFloat = 1 //image frame state -> by changing binding value(from frameEditor view)
    @State var textColor: Color = .white //text color state -> by changing binding value(from blurEditor)
    @State var imgBrightness: Double = 0 //image brightness -> by changing binding value(from brightnessEditor)
    @State var imgSaturarion: Double = 0.8
    
    @State var imgContrast: Double = 0.8
    
    @StateObject var homeData = HomeViewModel() //****
    
    var body: some View {
        VStack {
//            ZStack {
                if !homeData.allImages.isEmpty && homeData.mainView != nil {
                    Image(uiImage: homeData.mainView.image)
                        .resizable()
                        .aspectRatio(self.ImgFrame ,contentMode: .fit)
                        .brightness(imgBrightness)
                        .saturation(imgSaturarion)
                        .contrast(imgContrast)
                        .padding()
                        .overlay(
                            Text(verse)
                                .foregroundColor(textColor)
                                .kerning(letterSpace)
                                .lineSpacing(lineSpacing)
                                .font(.custom(Font, size: size))
                                .multilineTextAlignment(alignment)
                                .padding())
                }
//            }
//            .padding(.bottom)
            Spacer()
        }
    }
}

struct VerseEditorView_Previews: PreviewProvider {
    static var previews: some View {
        VerseEditorView(image: .constant(UIImage(named: "b1")), verse: .constant("hello arun "), Font: .constant("Georgia"))
    }
}

