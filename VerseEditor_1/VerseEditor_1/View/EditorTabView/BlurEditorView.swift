//
//  BlurEditorView.swift
//  VerseEditorBeta (iOS)
//
//  Created by Arun_Skyraan on 29/10/22.
//

import SwiftUI

struct BlurEditorView: View {
    
    @Binding var selectedColor: Color
    
    let pickerOption: [String] = [
        "White", "Black", "More"
    ]

    var body: some View {
        VStack {
            
            HStack {
                Button(action: {
                    selectedColor = .white
                }, label: {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 2)
                        .foregroundColor(Color.white)
                        .frame(width: 50, height: 45)
                        .overlay(Image(systemName: "checkmark")
                            .foregroundColor(selectedColor == .white ? Color.black : Color.white))
                })
                
                Button(action: {
                    selectedColor = .black
                }, label: {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color.black)
                        .frame(width: 50, height: 45)
                        .overlay(Image(systemName: "checkmark")
                        .foregroundColor(selectedColor == .black ? Color.white : Color.black))
                })
            }
            
            MyColorPicker(selectedColor: $selectedColor)
        }
    }
}

struct BlurEditorView_Previews: PreviewProvider {
    static var previews: some View {
        BlurEditorView(selectedColor: .constant(.white))
//        MyColorPicker(selectedColor: .constant(.primary))
    }
}

struct MyColorPicker: View {
    @Binding var selectedColor: Color
    private let colors:[Color] = [.red, .yellow, .orange, .purple, .blue, .gray]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(colors, id: \.self) { color in
                    Circle()
                        .foregroundColor(color)
                        .frame(width: 45, height: 45)
                        .opacity(color == selectedColor ? 0.5 : 1.0)
                        .scaleEffect(color == selectedColor ? 1.3 : 1.0)
                        .onTapGesture {
                            withAnimation(Animation.easeInOut) {
                                selectedColor = color
                            }
                        }
                }

                    ColorPicker("", selection: $selectedColor, supportsOpacity: false)
                    .scaleEffect(CGSize(width: 1.5, height: 1.5))
            }
            .padding()
//            .background(.thinMaterial)
            .cornerRadius(20)
            .padding(.horizontal)

        }
    }
}
