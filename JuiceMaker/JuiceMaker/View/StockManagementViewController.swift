//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 이영우 on 2021/03/19.
//

import UIKit

class StockManagementViewController: UIViewController {
    // MARK: - @IBOutlets
    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!
    
    @IBOutlet private weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: ViewModel?
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStepper()
    }
    
    // MARK: - @IBActions
    @IBAction private func touchUpClosedButton(_ sender: Any) {
        guard let addStrawberry = strawberryLabel.text.flatMap({ Int($0) }),
              let addBanana = bananaLabel.text.flatMap({ Int($0) }),
              let addPineapple = pineappleLabel.text.flatMap({ Int($0) }),
              let addKiwi = kiwiLabel.text.flatMap({ Int($0) }),
              let addMango = mangoLabel.text.flatMap({ Int($0) }) else {
                  return
              }
        
        guard let strawberry = viewModel?.fruitStock.value[.strawberry],
              let banana = viewModel?.fruitStock.value[.banana],
              let pineapple = viewModel?.fruitStock.value[.pineapple],
              let kiwi = viewModel?.fruitStock.value[.kiwi],
              let mango = viewModel?.fruitStock.value[.mango] else {
            return
        }
        
        viewModel?.fruitStock.value[.strawberry] = strawberry + addStrawberry
        viewModel?.fruitStock.value[.banana] = banana + addBanana
        viewModel?.fruitStock.value[.pineapple] = pineapple + addPineapple
        viewModel?.fruitStock.value[.kiwi] = kiwi + addKiwi
        viewModel?.fruitStock.value[.mango] = mango + addMango
        
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    @IBAction private func touchUpStepper(_ sender: UIStepper) {
        switch sender {
        case strawberryStepper:
            strawberryLabel.text = String(Int(sender.value))
        case bananaStepper:
            bananaLabel.text = String(Int(sender.value))
        case pineappleStepper:
            pineappleLabel.text = String(Int(sender.value))
        case kiwiStepper:
            kiwiLabel.text = String(Int(sender.value))
        case mangoStepper:
            mangoLabel.text = String(Int(sender.value))
        default:
            break
        }
    }
    
    // MARK: - Methods
    private func setUpStepper() {
        let arr = [strawberryStepper, bananaStepper, pineappleStepper, kiwiStepper, mangoStepper]
        for stepper in arr {
            guard let stepper = stepper else {
                return
            }
            stepper.wraps = true
            stepper.autorepeat = true
            stepper.maximumValue = 100
        }
    }
}
