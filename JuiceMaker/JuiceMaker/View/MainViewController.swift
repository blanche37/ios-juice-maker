//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - @IBOutlets
    @IBOutlet private weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
    
    @IBOutlet private weak var orderStrawberryBananaJuiceButton: OrderJuiceButton!
    @IBOutlet private weak var orderStrawberryJuiceButton: OrderJuiceButton!
    @IBOutlet private weak var orderBananaJuiceButton: OrderJuiceButton!
    @IBOutlet private weak var orderPineappleJuiceButton: OrderJuiceButton!
    @IBOutlet private weak var orderMangoKiwiJuiceButton: OrderJuiceButton!
    @IBOutlet private weak var orderKiwiJuiceButton: OrderJuiceButton!
    @IBOutlet private weak var orderMangoJuiceButton: OrderJuiceButton!
    var juiceMaker: JuiceMakerBusinessLogic = JuiceMaker()
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateFruitCount()
    }
    
    // MARK: - @IBActions
    @IBAction private func moveStock(_ sender: Any) {
        guard let stockVC = self.storyboard?
                .instantiateViewController(identifier: "stockVC") as? StockManagementViewController else {
            return
        }
        
        stockVC.delegate = self
        self.present(stockVC, animated: false, completion: nil)
    }
    
    @IBAction private func orderJuice(_ sender: OrderJuiceButton) {
        guard let juice = sender.juice else {
            return
        }
        
        let alert = sender.make(using: juice)
        self.present(alert, animated: true, completion: nil)
        updateFruitCount()
    }

    // MARK: - Methods
    private func initializeButtons() {
        orderStrawberryJuiceButton.juice = .strawberry
        orderBananaJuiceButton.juice = .banana
        orderStrawberryBananaJuiceButton.juice = .strawberryBanana
        orderKiwiJuiceButton.juice = .kiwi
        orderMangoJuiceButton.juice = .mango
        orderMangoKiwiJuiceButton.juice = .mangokiwi
        orderPineappleJuiceButton.juice = .pineapple
    }
    
    private func updateFruitCount() {
        strawberryLabel.text = String(juiceMaker.readStock(of: .strawberry))
        bananaLabel.text = String(juiceMaker
                                    .readStock(of: .banana))
        kiwiLabel.text = String(juiceMaker.readStock(of: .kiwi))
        pineappleLabel.text = String(juiceMaker.readStock(of: .pineapple))
        mangoLabel.text = String(juiceMaker.readStock(of: .mango))
    }
}

    // MARK: - SendDataProtocol
extension MainViewController: SendDataProtocol {
    func sendData(strawberry: Int, banana: Int, pineapple: Int, kiwi: Int, mango: Int) {
        juiceMaker.addStock(of: .strawberry, count: strawberry)
        juiceMaker.addStock(of: .banana, count: banana)
        juiceMaker.addStock(of: .pineapple, count: pineapple)
        juiceMaker.addStock(of: .kiwi, count: kiwi)
        juiceMaker.addStock(of: .mango, count: mango)
        updateFruitCount()
    }
}
