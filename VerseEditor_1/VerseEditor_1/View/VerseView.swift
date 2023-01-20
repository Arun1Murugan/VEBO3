//
//  VerseView.swift
//  VerseEditorBeta (iOS)
//
//  Created by Arun_Skyraan on 28/10/22.
//

import SwiftUI
//sczxc

struct VerseView: View {
    
    @State var verses: [String] = ["Do not be anxious about anything, but in every situation, by prayer and petition, with thanksgiving, present your requests to God. And the peace of God, which transcends all understanding, will guard your hearts and your minds in Christ Jesus.", "I sought the LORD, and He answered me and delivered me from all my fears. Those who look to Him are radiant, and their faces shall never be ashamed. Oh, taste and see that the LORD is good! Blessed is the man who takes refuge in Him!", "And we know that for those who love God all things work together for good, for those who are called according to His purpose.", "Have I not commanded you? Be strong and courageous. Do not be frightened, and do not be dismayed, for the LORD your God is with you wherever you go", "Trust in the LORD with all your heart, and do not lean on your own understanding. In all your ways acknowledge Him, and He will make straight your paths", "Then were the king's scribes called at that time in the third month, that is, the month Sivan, on the three and twentieth day thereof; and it was written according to all that Mordecai commanded unto the Jews, and to the lieutenants, and the deputies and rulers of the provinces which are from India unto Ethiopia, an hundred twenty and seven provinces, unto every province according to the writing thereof, and unto every people after their language, and to the Jews according to their writing, and according to their language.-Esther 8:9"]
    @State var tappedVerse: String = ""
    @State var istapped: Bool = false
    
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(0..<verses.count, id: \.self) { index in
                        
                        let verse = verses[index]
                        
                        Text(verse)
                            .multilineTextAlignment(.leading)
                            .onTapGesture {
                                tappedVerse = verse
                                istapped = true
                                print(tappedVerse)
                                
                            }
                    }
                }
            }
            if istapped {
                ImageSelectView(verse: $tappedVerse)
                    .offset(y: startingOffsetY)
                    .offset(y: currentDragOffsetY)
                    .offset(y: endingOffsetY)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.spring()) {
                                    currentDragOffsetY = value.translation.height
                                }
                            }
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    if currentDragOffsetY < -150 {
                                        endingOffsetY = -startingOffsetY
                                    } else if endingOffsetY != 0 && currentDragOffsetY > 150 {
                                        endingOffsetY = 0
                                    }
                                    currentDragOffsetY = 0
                                }
                            }
                    )
            }
        }
        .navigationBarHidden(true)
        .navigationTitle("Verse")
    }
}

struct VerseView_Previews: PreviewProvider {
    static var previews: some View {
        VerseView()
    }
}
