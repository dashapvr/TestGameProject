//
//  GameModel.swift
//  TestGameProject
//
//  Created by Дарья Пивовар on 28.08.2023.
//

import Foundation

struct Game {
    var isGameStarted = false
    var isShowingWebView = false
    var isShowingOnboarding = false
    var countOfTouch = 0
    var touchAimArray = [Int()]
    var timerCount = Int()
    var url = String()
    
    var isLoading = false
    var canGoBack = false
    var shouldGoBack = false
    var title: String = ""
}
