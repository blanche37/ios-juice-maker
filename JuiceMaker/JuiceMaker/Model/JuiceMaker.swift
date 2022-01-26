//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class JuiceMaker {
    private var stock: FruitStock = FruitStock(initialCount: 10)
    static let shared = JuiceMaker()
    
    private init() { }
    
    func makeJuice(using juice: Juice) throws {
        for (ingredient, information) in juice.recipe {
            guard stock.readCount(of: ingredient) >=  information.count else {
                throw JuiceMakerError.outOfStock
            }
            
            stock.subtractStock(of: ingredient, count: information.count)
        }
    }
    
    func readStock(of fruit: Fruit) -> UInt {
        return stock.readCount(of: fruit)
    }
}
