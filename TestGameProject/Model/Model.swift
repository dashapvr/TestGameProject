//
//  Model.swift
//  TestGameProject
//
//  Created by Дарья Пивовар on 28.08.2023.
//

import Foundation

class Model: ObservableObject {
    @Published var game = Game()
    @Published var aim = Aim()
}
