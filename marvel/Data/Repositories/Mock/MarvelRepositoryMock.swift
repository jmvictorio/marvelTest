//
//  MarvelRepositoryMock.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation
import RxSwift
import UIKit

class MarvelRepositoryMock: MarvelRepository{
    
    func getList(offset: Int) -> Observable<ListHeroData> {
        return Observable.just(self.readListFromJson()!)
    }
    
    func getDetail(id: String) -> Observable<ListHeroData> {
        return Observable.just(self.readDetailFromJson()!)
    }
    
    private func readListFromJson() -> ListHeroData? {
        if let path = Bundle.main.path(forResource: "list", ofType: "txt") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) // recover file data.
                return MarvelMapper.convert(data: data) // get the objects from the data.
                
            } catch {
                 print("Error try parsing list.json: \(error)")
            }
        }
        
        return nil
    }
    
    private func readDetailFromJson() -> ListHeroData? {
        if let path = Bundle.main.path(forResource: "detail", ofType: "txt") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) // recover file data.
                return MarvelMapper.convert(data: data) // get the objects from the data.
                
            } catch {
                 print("Error try parsing detail.json: \(error)")
            }
        }
        
        return nil
    }
}
