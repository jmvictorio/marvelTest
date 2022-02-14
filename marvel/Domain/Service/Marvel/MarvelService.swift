//
//  MarvelService.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation
import RxSwift

class MarvelService: BaseAPI{
    static func getList(offset: Int) -> Observable<ListHeroData>{
        return self.performRequest(route: APIRouter.list(offset: offset))
    }
    
    static func getDetail(id: String) -> Observable<ListHeroData>{
        return self.performRequest(route: APIRouter.detail(id: id))
    }
}
