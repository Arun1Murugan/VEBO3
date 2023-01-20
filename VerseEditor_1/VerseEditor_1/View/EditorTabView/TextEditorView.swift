//
//  TextEditorView.swift
//  VerseEditorBeta (iOS)
//
//  Created by Arun_Skyraan on 29/10/22.
//

import SwiftUI

struct TextEditorView: View {
    
    @Binding var Font : String

    struct fontStyle : Identifiable {
        let id = UUID().uuidString
        let names: String
    }
    
    @State var fontNames = [fontStyle(names: "Georgia"),
                            fontStyle(names: "GillSans-Light"),
                            fontStyle(names: "KohinoorTelugu-Regular"),
                            fontStyle(names: "AppleSDGothicNeo-Regular"),
                            fontStyle(names: "AvenirNextCondensed-Regular"),
                            fontStyle(names: "KohinoorDevanagari-Regular"),
                            fontStyle(names: "Kailasa"),
                            fontStyle(names: "EuphemiaUCAS"),
                            fontStyle(names: "Avenir-Medium"),
                            fontStyle(names: "Charter-Roman"),
                            fontStyle(names: "HelveticaNeue-LightItalic"),
                            fontStyle(names: "KohinoorTelugu-Medium"),
                            fontStyle(names: "Optima-Bold"),
                            fontStyle(names: "Avenir-Light"),
                            fontStyle(names: "Verdana"),
                            fontStyle(names: "MalayalamSangamMN"),
                            fontStyle(names: "Damascus"),
                            fontStyle(names: "TimesNewRomanPS-BoldMT"),
                            fontStyle(names: "Thonburi"),
                            fontStyle(names: "IowanOldStyle-Roman"),
                            fontStyle(names: "Palatino-Roman"),
                            fontStyle(names: "Courier")
    ]
    
    var body: some View {
        VStack {
            fontview
            Spacer()
        }
    }
    var fontview: some View {
        VStack {
            List {
                
                ForEach(0..<fontNames.count, id: \.self) { n in
                    let name : fontStyle = fontNames[n]
                    
                    Button(action: {
                        withAnimation(.easeIn) {
                            Font = name.names
                            
                        }
                        
                    }, label: {
                        HStack {
                            Text("\(name.names)")
                                .font(.custom("\(name.names)", size: 18))
                            
                            Spacer()
                            
                            if Font == name.names {
                                Image(systemName: "checkmark.rectangle.fill")
                                    .foregroundColor(.black)
                            }
                        }
                    })
                }
            }
            .cornerRadius(10)
            .listStyle(.plain)
            
        }
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(radius: 5, x: 1.0, y: 1.5)
        )
        .cornerRadius(10)
        .shadow(radius: 5, x: 1.0, y: 1.5)
        .padding(.horizontal, 20)
    }
}

//struct TextEditorView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextEditorView(Font: .constant("Georgia"))
//    }
//}
