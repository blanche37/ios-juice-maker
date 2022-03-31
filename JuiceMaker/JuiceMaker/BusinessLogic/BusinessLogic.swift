//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

typealias FruitCount = [Fruit: Int]

protocol BusinessLogic {
    func makeJuice(juice: Juice, dict: inout Observable<FruitCount>) -> Bool
    func addStock(dict: inout Observable<FruitCount>, fruit: Fruit, count: Int) throws
    func setInitialStock(dict: inout Observable<FruitCount>)
}

class JuiceMakerBusinessLogic: BusinessLogic {
    func makeJuice(juice: Juice, dict: inout Observable<FruitCount>) -> Bool {
        if readcount(juice: juice, dict: &dict) {
            substractStock(juice: juice, dict: &dict)
            return true
        } else {
            return false
        }
    }
    
    private func readcount(juice: Juice, dict: inout Observable<FruitCount>) -> Bool {
        for (fruit, count) in juice.recipe {
            do {
                let stock = try self.readStock(dict: dict, fruit: fruit)
                
                if stock < count {
                    return false
                }
            } catch {
                print(error)
            }
        }
            return true
    }
    
    private func substractStock(juice: Juice, dict: inout Observable<FruitCount>) {
        for (fruit, count) in juice.recipe {
            do {
                let stock = try self.readStock(dict: dict, fruit: fruit)
                
                if stock >= count {
                    dict.value.updateValue(stock - count, forKey: fruit)
                }
            } catch {
                print(error)
            }
        }
    }
    
    private func readStock(dict: Observable<FruitCount>, fruit: Fruit) throws -> Int {
        guard let stock = dict.value[fruit] else {
            throw JuiceMakerError.notFoundFruit
        }
        
        return stock
    }
    
    func addStock(dict: inout Observable<FruitCount>, fruit: Fruit, count: Int) throws {
        guard let stock = dict.value[fruit] else {
            throw JuiceMakerError.notFoundFruit
        }
        dict.value.updateValue(stock + count, forKey: fruit)
    }
    
    func setInitialStock(dict: inout Observable<FruitCount>) {
        Fruit.allCases.forEach {
            dict.value.updateValue(10, forKey: $0)
        }
    }
}
