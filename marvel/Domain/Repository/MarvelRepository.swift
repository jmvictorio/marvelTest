//
//  MarvelRepository.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation
import RxSwift

protocol MarvelRepository{
    func getList(offset: Int) -> Observable<ListHeroData>
    func getDetail(id: String) -> Observable<ListHeroData>
}
