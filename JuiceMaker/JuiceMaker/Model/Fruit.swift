//
//  Fruit.swift
//  JuiceMaker
//
//  Created by yun on 2022/01/27.
//

import Foundation

typealias FruitCount = [Fruit: FruitInformation]

struct FruitInformation {
    var count: UInt
}

enum Fruit {
    case strawberry, banana, pineapple, kiwi, mango
}
