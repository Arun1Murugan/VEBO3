//
//  OpacityEditorView.swift
//  VerseEditorBeta (iOS)
//
//  Created by Arun_Skyraan on 29/10/22.
//

import SwiftUI

struct BrightnessEditorView: View {
    
    @Binding var brightness: Double
    @Binding var saturation: Double
    @Binding var constrast: Double
    
    var body: some View {
        VStack {
            Slider(value: $brightness,
                   in: 0.0...0.9,
                   step: 0.1,
                   onEditingChanged: { (_) in
            },
                   minimumValueLabel: Text("Blur")
                .font(.caption)
                .foregroundColor(.black),
                   maximumValueLabel: Text("")
                .bold()
                .foregroundColor(.black),
                   label: {
                Text("")
                
            })
            .accentColor(.primary.opacity(0.6))
            .padding(.vertical, 5)
            .padding(.horizontal, 5)
            .background(
                Color.white
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.2),
                            radius: 10)
            )
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            Slider(value: $saturation,
                   in: 0.0...0.9,
                   step: 0.1,
                   onEditingChanged: { (_) in
            },
                   minimumValueLabel: Text("Bright")
                .font(.caption)
                .foregroundColor(.black),
                   maximumValueLabel: Text("")
                .bold()
                .foregroundColor(.black),
                   label: {
                Text("")
                
            })
            .accentColor(.primary.opacity(0.6))
            .padding(.vertical, 5)
            .padding(.horizontal, 5)
            .background(
                Color.white
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.2),
                            radius: 10)
            )
            .padding(.horizontal, 20)
            .padding(.top, 10)
        }
    }
}

struct BrightnessEditorView_Previews: PreviewProvider {
    static var previews: some View {
        BrightnessEditorView(brightness: .constant(1.0), saturation: .constant(0.1), constrast: .constant(1.0))
    }
}
