//
//  MarvelRepositoryNetwork.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation
import RxSwift

class MarvelRepositoryNetwork: MarvelRepository{
    func getList(offset: Int) -> Observable<ListHeroData> {
        return MarvelService.getList(offset: offset)
    }
    
    func getDetail(id: String) -> Observable<ListHeroData> {
        return MarvelService.getDetail(id: id)
    }
}
