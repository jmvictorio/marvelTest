//
//  MarvelRepositoryFactory.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation

class MarvelRepositoryFactory: BaseRepositoryFactory<MarvelRepository> {
    
    override func create(strategy: Strategy = .Mock) -> MarvelRepository? {
        switch strategy {
        case .Mock:
            return MarvelRepositoryMock()
        case .Network:
            return MarvelRepositoryNetwork()
        }
    }
}
