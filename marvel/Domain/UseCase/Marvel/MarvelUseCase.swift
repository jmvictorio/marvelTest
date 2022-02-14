//
//  MarvelUseCase.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation
import RxSwift

class MarvelUseCase{
    func getList(strategy: Strategy, offset: Int) -> Observable<ListHeroEntity>{
        return MarvelRepositoryFactory().create(strategy: strategy)!.getList(offset: offset).map { MarvelMapper.convert(model: $0) }
    }
    
    func getDetail(strategy: Strategy, id: String) -> Observable<HeroEntity>{
        return MarvelRepositoryFactory().create(strategy: strategy)!.getDetail(id: id).map { MarvelMapper.convert(model: $0).list.first!}
    }
}
