//
//  Juice.swift
//  JuiceMaker
//
//  Created by yun on 2022/01/27.
//

import Foundation

enum Juice: String {
    case strawberry = "딸기"
    case banana = "바나나"
    case kiwi = "키위"
    case pineapple = "파인애플"
    case strawberryBanana = "딸바"
    case mango = "망고"
    case mangokiwi = "망키"
    
    var recipe: FruitCount {
        switch self {
        case .strawberry:
            return [.strawberry: FruitInformation(count: 16)]
        case .banana:
            return [.banana: FruitInformation(count: 2)]
        case .kiwi:
            return [.kiwi: FruitInformation(count: 3)]
        case .pineapple:
            return [.pineapple: FruitInformation(count: 2)]
        case .strawberryBanana:
            return [.strawberry: FruitInformation(count: 10), .banana: FruitInformation(count: 1)]
        case .mango:
            return [.mango: FruitInformation(count: 3)]
        case .mangokiwi:
            return [.mango: FruitInformation(count: 2), .kiwi: FruitInformation(count: 1)]
        }
    }
}
