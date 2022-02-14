//
//  HomePresenter.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation
import RxSwift
import UIKit

class HomePresenter{
    weak var delegate: HomeViewDelegate?
    
    var useCase = MarvelUseCase()
    
    var dataSource: [HeroEntity] = []
    
    let disposeBag = DisposeBag()
    
    var nextOffset: Int = 0
    var hasNewPage: Bool = true
    
    func onViewDidLoad(delegate: HomeViewDelegate){
        self.delegate = delegate
        self.delegate?.setupView()
        self.getList(offset: self.nextOffset)
    }
    
    private func getList(offset: Int){
        self.useCase.getList(strategy: .Network, offset: offset).subscribe { list in
            self.processList(list: list)
        } onError: { error in
            self.delegate?.failure(error: error.localizedDescription)
        }.disposed(by: self.disposeBag)
    }
    
    private func processList(list: ListHeroEntity){
        self.hasNewPage = list.hasNewPage
        self.nextOffset = list.newOffset
        self.dataSource.append(contentsOf: list.list)
        self.delegate?.success()
    }
    
    func canCallNextPage(){
        if self.hasNewPage{
            self.delegate?.showLoading()
            self.getList(offset: self.nextOffset)
        }
    }
}
