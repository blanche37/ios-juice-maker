//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

typealias FruitCount = [Fruit: Int]

enum Fruit {
    case strawberry, banana, pineapple, kiwi, mango
}

enum Juice {
    case strawberry, banana, kiwi, pineapple, strawberryBanana, mango, mangokiwi

    var recipe: FruitCount {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .pineapple:
            return [.pineapple: 2]
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mango:
            return [.mango: 3]
        case .mangokiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}

enum JuiceMakerError: Error {
    case outOfStock
}

struct FruitStock: CustomStringConvertible {
    private(set) var remainedFruit: FruitCount
    var description: String {
        return "\(remainedFruit)"
    }
    
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
    
    func checkCount(of fruit: Fruit) -> Int {
        if let storedFruit = remainedFruit[fruit] {
            return storedFruit
        } else {
            return 0
        }
    }
}

class JuiceMaker {
    var stock: FruitStock = FruitStock(initialCount: 10)
    
    func makeJuice(using juice: Juice) throws {
        for (ingredient, amount) in juice.recipe {
            guard stock.checkCount(of: ingredient) > amount else {
                throw JuiceMakerError.outOfStock
            }
            
            stock.subtractStock(of: ingredient, count: amount)
        }
    }
}
