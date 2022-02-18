//
//  FruitStock.swift
//  JuiceMaker
//
//  Created by yun on 2022/01/27.
//

import Foundation

class FruitStock {
    var remainedFruit: FruitCount = [:]
    static let shared = FruitStock(initialCount: 10)
    
    private init(initialCount: Int) {
        for fruit in Fruit.allCases {
            remainedFruit.updateValue(initialCount, forKey: fruit)
        }
    }
}
