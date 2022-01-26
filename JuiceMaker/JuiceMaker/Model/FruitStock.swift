//
//  FruitStock.swift
//  JuiceMaker
//
//  Created by yun on 2022/01/27.
//

import Foundation

struct FruitStock {
    private var remainedFruit: FruitCount
    
    init(initialCount: Int) {
        remainedFruit = [.strawberry: initialCount, .banana: initialCount, .kiwi: initialCount, .pineapple: initialCount, .mango: initialCount]
    }
    
    mutating func addStock(of fruit: Fruit, count: Int) {
        if let storedFruit = remainedFruit[fruit] {
            remainedFruit[fruit] = storedFruit + count
        }
    }
    
    mutating func subtractStock(of fruit: Fruit, count: Int) {
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
