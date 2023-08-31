//
//  Onboarding.swift
//  TestGameProject
//
//  Created by Дарья Пивовар on 28.08.2023.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Game is about touching an aim 10 times as fast as you can. Game screen contains a start button. Button disappears after pressing it and the aim appears in a random position. After touching the aim it moves to another random position. Game finishes when you press the aim 10 times. You win if you do it faster than 7 seconds. You lose if you are slower.")
                    .font(.subheadline)
                    .padding(10)
                
                Spacer()
                
                NavigationLink(destination: StartGameView()) {
                    Text("Click")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.pink)
                }
            }
            .padding()
            .navigationBarTitle("Rules", displayMode: .inline)
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
