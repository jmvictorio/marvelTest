//
//  BaseRepositoryFactory.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation

class BaseRepositoryFactory<T> {

    func create(strategy: Strategy = .Mock) -> T? {
        fatalError("create method must override")
    }
}
