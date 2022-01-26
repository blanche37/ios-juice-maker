//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 이영우 on 2021/03/19.
//

import UIKit

class StockViewController: UIViewController {
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    @IBOutlet weak var strawberryCount: UILabel!
    @IBOutlet weak var bananaCount: UILabel!
    @IBOutlet weak var pineappleCount: UILabel!
    @IBOutlet weak var kiwiCount: UILabel!
    @IBOutlet weak var mangoCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStepper()
    }
    
    @IBAction func touchUpClosedButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    func setUpStepper() {
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
            strawberryCount.text = String(Int(sender.value))
        case bananaStepper:
            bananaCount.text = String(Int(sender.value))
        case pineappleStepper:
            pineappleCount.text = String(Int(sender.value))
        case kiwiStepper:
            kiwiCount.text = String(Int(sender.value))
        case mangoStepper:
            mangoCount.text = String(Int(sender.value))
        default:
            break
        }
    }
    
}
