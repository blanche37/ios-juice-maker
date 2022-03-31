//
//  FruitStock.swift
//  JuiceMaker
//
//  Created by yun on 2022/01/27.
//

import Foundation

protocol ViewModel {
    var fruitStock: Observable<FruitCount> { get set }
    
    func makeJuice(juice: Juice, completion: @escaping (Bool) -> Void)
    func addStock(fruit: Fruit, count: Int)
}

class JuiceMakerViewModel: ViewModel {
    var businessLogic: BusinessLogic!
    var fruitStock: Observable<FruitCount> = Observable([:])
    
    var strawberry: Observable<Int> = Observable(10)
    var banana: Observable<Int> = Observable(10)
    var pineapple: Observable<Int> = Observable(10)
    var kiwi: Observable<Int> = Observable(10)
    var mango: Observable<Int> = Observable(10)
    
    func makeJuice(juice: Juice, completion: @escaping (Bool) -> Void) {
        if businessLogic.makeJuice(juice: juice, dict: &fruitStock) {
            completion(true)
        } else {
            completion(false)
        }
    }
    
    func addStock(fruit: Fruit, count: Int) {
        do {
            try businessLogic.addStock(dict: &fruitStock, fruit: fruit, count: count)
        } catch {
            print(error)
        }
    }
    
    private func setInitialStock() {
        businessLogic.setInitialStock(dict: &fruitStock)
    }
    
    init(businessLogic: BusinessLogic) {
        self.businessLogic = businessLogic
        setInitialStock()
    }
}
