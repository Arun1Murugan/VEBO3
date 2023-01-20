//
//  ContentView.swift
//  VerseEditor_2
//
//  Created by Arun Skyraan  on 15/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var homeData = HomeViewModel()
//    @Binding var image: 
    
    var body: some View {
        if !homeData.allImages.isEmpty && homeData.mainView != nil {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(homeData.allImages) { filtered in
                        Image(uiImage: filtered.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                        // Updating MainView
                        // whenever button toppaed
                            .onTapGesture {
                                // clearing old data
                                homeData.value = 1.0
                                homeData.mainView = filtered
                            }
                    }
                }
                .padding()
                
            }
        } else {
            ProgressView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
