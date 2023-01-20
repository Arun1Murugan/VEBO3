//
//  FontEditorView.swift
//  VerseEditorBeta (iOS)
//
//  Created by Arun_Skyraan on 29/10/22.
//

import SwiftUI

struct FontEditorView: View {
    
    @Binding var alignment: TextAlignment // alignment binding variable
    @Binding var fontSize : CGFloat //Font size binding variable
    @Binding var letterSpace: CGFloat //Letter spacing binding variable
    @Binding var lineSpacing: CGFloat //line spacing binding variable
    
    @State var selectedAlignment: Int = 1 //alignment
    
    
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Button(action: {
                    withAnimation(Animation.easeInOut) {
                        self.selectedAlignment = 0
                        self.alignment = .leading
                    }

                }, label: {
                    Image(systemName: "text.alignleft")
                        .font(.headline)
                        .foregroundColor(alignment == .leading ? Color.primary : Color.gray)
                })
                Spacer()
                Button(action: {
                    withAnimation(Animation.easeInOut) {
                        self.alignment = .center
                        self.selectedAlignment = 1
                    }

                }, label: {
                    Image(systemName: "text.aligncenter")
                        .font(.headline)
                        .foregroundColor(alignment == .center ? Color.primary : Color.gray)
                })
                Spacer()
                Button(action: {
                    withAnimation(Animation.easeInOut) {
                        self.selectedAlignment = 2
                        self.alignment = .trailing

                    }
                }, label: {
                    Image(systemName: "text.alignright")
                        .font(.headline)
                        .foregroundColor(alignment == .trailing ? Color.primary : Color.gray)
                
                })
                Spacer()
            }
            
            HStack {
                Spacer()
                VStack {
                    Slider(value: $lineSpacing,
                           in: 0...5,
                           step: 1.0,
                           onEditingChanged: { (_) in
                    },
                           minimumValueLabel: Text("Line")
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
                Spacer()
                VStack {
                    Slider(value: $letterSpace,
                           in: 1...5,
                           step: 1.0,
                           onEditingChanged: { (_) in
                    },
                           minimumValueLabel: Text("Space")
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
                Spacer()
            }
            
            Slider(value: $fontSize,
                   in: 18...25,
                   step: 1.0,
                   onEditingChanged: { (_) in
            },
                   minimumValueLabel: Text("Size")
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

struct FontEditorView_Previews: PreviewProvider {
    static var previews: some View {
        FontEditorView(alignment: .constant(.center), fontSize: .constant(20), letterSpace: .constant(10), lineSpacing: .constant(5))
//            .previewInterfaceOrientation(.portrait)
    }
}
