//
//  FruitStock.swift
//  JuiceMaker
//
//  Created by yun on 2022/01/27.
//

import Foundation

struct FruitStock {
    private var remainedFruit: FruitCount
    
    init(initialCount: UInt) {
        remainedFruit = [.strawberry: initialCount, .banana: initialCount, .kiwi: initialCount, .pineapple: initialCount, .mango: initialCount]
    }
    
    mutating func addStock(of fruit: Fruit, count: UInt) {
        if let storedFruit = remainedFruit[fruit] {
            remainedFruit[fruit] = storedFruit + count
        }
    }
    
    mutating func subtractStock(of fruit: Fruit, count: UInt) {
        if let storedFruit = remainedFruit[fruit] {
            remainedFruit[fruit] = storedFruit - count
        }
    }
    
    func readCount(of fruit: Fruit) -> UInt {
        if let storedFruit = remainedFruit[fruit] {
            return storedFruit
        } else {
            return 0
        }
    }
}
