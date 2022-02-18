//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

protocol JuiceMakerBusinessLogic {
    func makeJuice(using juice: Juice) throws
    func readStock(of fruit: Fruit) -> Int
    func addStock(of fruit: Fruit, count: Int)
}

struct JuiceMaker: JuiceMakerBusinessLogic {
    func makeJuice(using juice: Juice) throws {
        for (ingredient, information) in juice.recipe {
            guard let stock = FruitStock.shared.remainedFruit[ingredient],
                  stock >= information else {
                      throw JuiceMakerError.outOfStock
                  }
            
            FruitStock.shared.remainedFruit[ingredient] = stock - information
        }
    }
    
    func readStock(of fruit: Fruit) -> Int {
        if let storedFruit = FruitStock.shared.remainedFruit[fruit] {
            return storedFruit
        } else {
            return 0
        }
    }
    
    func addStock(of fruit: Fruit, count: Int) {
        if let storedFruit = FruitStock.shared.remainedFruit[fruit] {
            FruitStock.shared.remainedFruit[fruit] = storedFruit + count
        }
    }
}
