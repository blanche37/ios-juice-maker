//
//  Observable.swift
//  JuiceMaker
//
//  Created by yun on 2022/03/30.
//

import Foundation

class Observable<T> {
    var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: ((T) -> Void)?) {
        self.listener = listener
        listener?(value)
    }
}
