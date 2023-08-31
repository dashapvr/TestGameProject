//
//  AimView.swift
//  TestGameProject
//
//  Created by Дарья Пивовар on 28.08.2023.
//

import WebKit
import SwiftUI

extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}

struct AimView: View {
    @EnvironmentObject var model: Model
    
    @State private var animationAmount: CGFloat = 1
    
    var geo: GeometryProxy
    let webView = WKWebView()


    var body: some View {
        VStack {
            Button(action: {
                if model.game.countOfTouch < 9 {
                    self.animationAmount = CGFloat(0.8)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.animationAmount = CGFloat(1)
                    }
                    model.game.countOfTouch += 1
                    model.game.touchAimArray.append(model.game.countOfTouch)
                    model.aim.aimX = CGFloat.random(in: 64.0...geo.frame(in: .global).maxX - 80.0)
                    model.aim.aimY = CGFloat.random(in: 64.0...geo.frame(in: .global).maxY - 110.0)
                } else {
                    if model.game.timerCount < 7 {
                        model.game.url = "https://www.youtube.com/"
                    } else {
                        model.game.url = "https://www.google.com.ua/"
                    }
                    
                    model.game.isShowingWebView = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        model.game.isGameStarted = false
                        model.game.countOfTouch = 0
                        model.game.touchAimArray = [Int()]
                        model.game.timerCount = Int()
                    }
                }
            }) {
                Circle()
                    .fill(model.aim.colorsArray[model.game.countOfTouch])
                    .frame(width: 64, height: 64, alignment: .center)
                    .clipShape(Circle())
                    .scaleEffect(animationAmount)
                    .animation(Animation.easeInOut(duration: 0.2))
                    
            }
            .onAppear(perform: {
                model.aim.aimX = CGFloat.random(in: 20.0...geo.frame(in: .global).maxX - 100.0)
                model.aim.aimY = CGFloat.random(in: 20.0...geo.frame(in: .global).maxY - 100.0)
            })
            .offset(x: model.aim.aimX, y: model.aim.aimY)
        }
    }
}


