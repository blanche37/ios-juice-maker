//
//  FruitStock.swift
//  JuiceMaker
//
//  Created by yun on 2022/01/27.
//

import Foundation

class FruitStock {
    private var remainedFruit: FruitCount
    static let shared = FruitStock(initialCount: 10)
    
    private init(initialCount: Int) {
        remainedFruit = [.strawberry: initialCount, .banana: initialCount, .kiwi: initialCount, .pineapple: initialCount, .mango: initialCount]
    }
    
    func addStock(of fruit: Fruit, count: Int) {
        if let storedFruit = remainedFruit[fruit] {
            remainedFruit[fruit] = storedFruit + count
        }
    }
    
    func subtractStock(of fruit: Fruit, count: Int) {
        if let storedFruit = remainedFruit[fruit] {
            remainedFruit[fruit] = storedFruit - count
        }
    }
    
    func readCount(of fruit: Fruit) -> Int {
        if let storedFruit = remainedFruit[fruit] {
            return storedFruit
        } else {
            return 0
        }
    }
}
