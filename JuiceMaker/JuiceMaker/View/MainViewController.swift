//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var orderStrawberryBananaJuiceButton: OrderJuiceButton!
    @IBOutlet weak var orderStrawberryJuiceButton: OrderJuiceButton!
    @IBOutlet weak var orderBananaJuiceButton: OrderJuiceButton!
    @IBOutlet weak var orderPineappleJuiceButton: OrderJuiceButton!
    @IBOutlet weak var orderMangoKiwiJuiceButton: OrderJuiceButton!
    @IBOutlet weak var orderKiwiJuiceButton: OrderJuiceButton!
    @IBOutlet weak var orderMangoJuiceButton: OrderJuiceButton!
    var juiceMaker = JuiceMaker()
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateFruitCount()
    }
    
    //MARK: - @IBActions
    @IBAction func moveStock(_ sender: Any) {
        guard let stockVC = self.storyboard?.instantiateViewController(identifier: "stockVC") as? StockManagementViewController else {
            return
        }
        
        stockVC.delegate = self
        self.present(stockVC, animated: false, completion: nil)
    }
    
    @IBAction func orderJuice(_ sender: OrderJuiceButton) {
        guard let juice = sender.juice else {
            return
        }
        
        let alert = sender.make(using: juice)
        self.present(alert, animated: true, completion: nil)
        updateFruitCount()
    }

    //MARK: - Methods
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

    //MARK: - SendDataProtocol
extension MainViewController: SendDataProtocol {
    func sendData(strawberry: Int, banana: Int, pineapple: Int, kiwi: Int, mango: Int) {
        FruitStock.shared.addStock(of: .strawberry, count: strawberry)
        FruitStock.shared.addStock(of: .banana, count: banana)
        FruitStock.shared.addStock(of: .pineapple, count: pineapple)
        FruitStock.shared.addStock(of: .kiwi, count: kiwi)
        FruitStock.shared.addStock(of: .mango, count: mango)
        updateFruitCount()
    }
    
    
}
