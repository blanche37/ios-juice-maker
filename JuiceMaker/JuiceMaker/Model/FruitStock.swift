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
        remainedFruit = [.strawberry: FruitInformation(count: initialCount), .banana: FruitInformation(count: initialCount), .kiwi: FruitInformation(count: initialCount), .pineapple: FruitInformation(count: initialCount), .mango: FruitInformation(count: initialCount)]
    }
    
    mutating func addStock(of fruit: Fruit, count: UInt) {
        if let storedFruit = remainedFruit[fruit] {
            remainedFruit[fruit]?.count = storedFruit.count + count
        }
    }
    
    mutating func subtractStock(of fruit: Fruit, count: UInt) {
        if let storedFruit = remainedFruit[fruit] {
            remainedFruit[fruit]?.count = storedFruit.count - count
        }
    }
    
    func readCount(of fruit: Fruit) -> UInt {
        if let storedFruit = remainedFruit[fruit] {
            return storedFruit.count
        } else {
            return 0
        }
    }
}
