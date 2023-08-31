//
//  TestGameProjectApp.swift
//  TestGameProject
//
//  Created by Дарья Пивовар on 28.08.2023.
//

import SwiftUI

@main
struct TouchTenApp: App {
    @ObservedObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}

