//
//  DetailPresenter.swift
//  marvel
//
//  Created by jvictorio on 14/2/22.
//

import Foundation
import RxSwift
import Alamofire
import UIKit

public typealias ImageCompletion = (_ imageData: Data) -> Void

class DetailPresenter{
    weak var delegate: DetailViewDelegate?
    
    var useCase = MarvelUseCase()
    
    var hero: HeroEntity?
    
    let disposeBag = DisposeBag()
    
    func onViewDidLoad(delegate: DetailViewDelegate, id: String){
        self.delegate = delegate
        self.delegate?.setupView()
        self.getDetail(id: id)
    }
    
    private func getDetail(id: String){
        self.useCase.getDetail(strategy: .Network, id: id).subscribe { hero in
            self.processHero(hero: hero)
        } onError: { error in
            self.delegate?.failure(error: error.localizedDescription)
        }.disposed(by: self.disposeBag)

    }
    
    private func processHero(hero: HeroEntity){
        self.hero = hero
        self.getImage(imageURL: hero.picture) { imageData in
            self.delegate?.showData(name: hero.name, image: UIImage(data: imageData) ?? UIImage(named: "img_marvel")!)
        }
        self.delegate?.success()
    }
    
    private func getImage(imageURL: String, completion: @escaping ImageCompletion){
        AF.request(imageURL).responseData { (response) in
            if response.error == nil {
                if let data = response.data {
                    completion(data)
                }
            }
        }
    }
    
    func getNameSection(section: Int) -> String?{
        switch section{
        case 0:
            return (self.hero?.comics?.number ?? 0) > 0 ? "COMICS" : nil
        case 1:
            return (self.hero?.series?.number ?? 0) > 0 ? "SERIES" : nil
        case 2:
            return (self.hero?.events?.number ?? 0) > 0 ? "EVENTS" : nil
        case 3:
            return (self.hero?.stories?.number ?? 0) > 0 ? "STORIES" : nil
        default:
            return nil
        }
    }
    
    func getSeries() -> [ItemEntity]{
        return self.hero?.series?.items ?? []
    }
    
    func getNumberOfSeries() -> Int{
        return self.hero?.series?.number ?? 0
    }
    
    func getComics() -> [ItemEntity]{
        return self.hero?.comics?.items ?? []
    }
    
    func getNumberOfComics() -> Int{
        return self.hero?.comics?.number ?? 0
    }
    
    func getEvents() -> [ItemEntity]{
        return self.hero?.events?.items ?? []
    }
    
    func getNumberOfEvents() -> Int{
        return self.hero?.events?.number ?? 0
    }
    
    func getStories() -> [ItemEntity]{
        return self.hero?.stories?.items ?? []
    }
    
    func getNumberOfStories() -> Int{
        return self.hero?.stories?.number ?? 0
    }
}
