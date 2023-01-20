//
//  VerseEditor_1App.swift
//  VerseEditor_1
//
//  Created by Arun Skyraan  on 14/11/22.
//

import SwiftUI

@main
struct VerseEditor_1App: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                VerseView()
//                Home()
            }
            .navigationViewStyle(.stack)

        }
    }
}
