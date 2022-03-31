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
    
    @IBOutlet private weak var orderStrawberryBananaJuiceButton: UIButton!
    @IBOutlet private weak var orderStrawberryJuiceButton: UIButton!
    @IBOutlet private weak var orderBananaJuiceButton: UIButton!
    @IBOutlet private weak var orderPineappleJuiceButton: UIButton!
    @IBOutlet private weak var orderMangoKiwiJuiceButton: UIButton!
    @IBOutlet private weak var orderKiwiJuiceButton: UIButton!
    @IBOutlet private weak var orderMangoJuiceButton: UIButton!
    
    // MARK: - Properties
    var viewModel: ViewModel!
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    // MARK: - @IBActions
    @IBAction private func moveStock(_ sender: Any) {
        guard let stockVC = self.storyboard?
                .instantiateViewController(identifier: "stockVC") as? StockManagementViewController else {
            return
        }
        
        stockVC.viewModel = self.viewModel
        self.present(stockVC, animated: false, completion: nil)
    }
    
    @IBAction private func orderJuice(_ sender: UIButton) {
        let alertController = OrderAlertController()
        
        switch sender {
        case orderStrawberryBananaJuiceButton:
            viewModel.makeJuice(juice: .strawberryBanana) {
                let alert = alertController.showAlert(isSuccess: $0, juice: .strawberryBanana)
                self.present(alert, animated: false)
            }
        case orderStrawberryJuiceButton:
            viewModel.makeJuice(juice: .strawberry) {
                let alert = alertController.showAlert(isSuccess: $0, juice: .strawberry)
                self.present(alert, animated: false)
            }
        case orderBananaJuiceButton:
            viewModel.makeJuice(juice: .banana) {
                let alert = alertController.showAlert(isSuccess: $0, juice: .banana)
                self.present(alert, animated: false)
            }
        case orderPineappleJuiceButton:
            viewModel.makeJuice(juice: .pineapple) {
                let alert = alertController.showAlert(isSuccess: $0, juice: .pineapple)
                self.present(alert, animated: false)
            }
        case orderMangoKiwiJuiceButton:
            viewModel.makeJuice(juice: .mangokiwi) {
                let alert = alertController.showAlert(isSuccess: $0, juice: .mangokiwi)
                self.present(alert, animated: false)
            }
        case orderKiwiJuiceButton:
            viewModel.makeJuice(juice: .kiwi) {
                let alert = alertController.showAlert(isSuccess: $0, juice: .kiwi)
                self.present(alert, animated: false)
            }
        case orderMangoJuiceButton:
            viewModel.makeJuice(juice: .mango) {
                let alert = alertController.showAlert(isSuccess: $0, juice: .mango)
                self.present(alert, animated: false)
            }
        default:
            break
        }
    }
    
    // MARK: - Methods
    private func bind() {
        viewModel.fruitStock.bind { fruitStock in
            self.strawberryLabel.text = String(fruitStock[Fruit.strawberry]!)
            self.bananaLabel.text = String(fruitStock[Fruit.banana]!)
            self.pineappleLabel.text = String(fruitStock[Fruit.pineapple]!)
            self.kiwiLabel.text = String(fruitStock[Fruit.kiwi]!)
            self.mangoLabel.text = String(fruitStock[Fruit.mango]!)
        }
    }
}
