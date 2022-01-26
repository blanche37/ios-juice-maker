//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct JuiceMaker {
    func makeJuice(using juice: Juice) throws {
        for (ingredient, information) in juice.recipe {
            guard FruitStock.shared.readCount(of: ingredient) >=  information else {
                throw JuiceMakerError.outOfStock
            }
            
            FruitStock.shared.subtractStock(of: ingredient, count: information)
        }
    }
    
    func readStock(of fruit: Fruit) -> Int {
        return FruitStock.shared.readCount(of: fruit)
    }
}
