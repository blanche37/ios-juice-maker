//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 이영우 on 2021/03/19.
//

import UIKit

class StockManagementViewController: UIViewController {
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    weak var delegate: SendDataProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStepper()
    }
    
    @IBAction func touchUpClosedButton(_ sender: Any) {
        guard let strawberry = strawberryLabel.text.flatMap({ Int($0)} ),
              let banana = bananaLabel.text.flatMap({ Int($0)} ),
              let pineapple = pineappleLabel.text.flatMap({ Int($0)} ),
              let kiwi = kiwiLabel.text.flatMap({ Int($0)} ),
              let mango = mangoLabel.text.flatMap({ Int($0)} ) else {
                  return
              }
        self.delegate?.sendData(strawberry: strawberry, banana: banana, pineapple: pineapple, kiwi: kiwi, mango: mango)
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
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
    
    
    @IBAction func touchUpStepper(_ sender: UIStepper) {
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
    
}
