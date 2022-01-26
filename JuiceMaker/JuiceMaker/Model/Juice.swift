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
