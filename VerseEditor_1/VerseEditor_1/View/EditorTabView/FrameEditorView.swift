//
//  FrameEditorView.swift
//  VerseEditorBeta (iOS)
//
//  Created by Arun_Skyraan on 29/10/22.
//

import SwiftUI

struct FrameEditorView: View {
    
    @Binding var ImgFrame: CGFloat
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                withAnimation(){
                    self.ImgFrame = 1
                }
            }, label: {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(ImgFrame == 1 ? Color.primary.opacity(0.7) : .gray, lineWidth: 3.0)
                    .frame(width: 50, height: 50)
                    .overlay(
                        Text("1:1")
                        .font(.headline)
                        .foregroundColor(ImgFrame == 1 ? Color.primary.opacity(0.7) : .gray))
                    
            })
            Spacer()
            Button(action: {
                withAnimation(.easeInOut){
                    self.ImgFrame = 3/4
                }
                
            }, label: {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(ImgFrame == 3/4 ? Color.primary.opacity(0.7) : .gray, lineWidth: 3.0)
                    .frame(width: 50, height: 70)
                    .overlay(Text("3:4")
                        .font(.headline)
                        .foregroundColor(ImgFrame == 3/4 ? Color.primary.opacity(0.7) : .gray))
                    
            })
            Spacer()
        }
    }
}

struct FrameEditorView_Previews: PreviewProvider {
    static var previews: some View {
        FrameEditorView(ImgFrame: .constant(1))
    }
}
