//
//  OrderJuiceButton.swift
//  JuiceMaker
//
//  Created by 이영우 on 2021/03/19.
//

import UIKit

class OrderJuiceButton: UIButton {
    var juice: Juice?
    private let juiceMaker = JuiceMaker()
    
    func make(using juice: Juice) -> UIAlertController {
        let alert = OrderAlertController()
        
        do {
            try juiceMaker.makeJuice(using: juice)
            
            return alert.alertOfSuccess(juice: juice)
        } catch {
            return alert.alertOfFail()
        }
    }
}
