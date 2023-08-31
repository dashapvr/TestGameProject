//
//  ContentView.swift
//  TestGameProject
//
//  Created by Дарья Пивовар on 28.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        OnboardingView()
            .coordinateSpace(name: "Custom")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
