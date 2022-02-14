//
//  ListHeroEntity.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation

class ListHeroEntity{
    var offset, limit, total, count: Int
    var list: [HeroEntity] = []
    
    var newOffset: Int = 0
    
    var hasNewPage: Bool{
        get{
            return self.proccessNewPage()
        }
    }
    
    init(model: ListHeroData){
        guard let data = model.data else {
            fatalError("NO DATA")
        }
        for hero in data.results ?? []{
            self.list.append(HeroEntity.init(model: hero))
        }
        
        self.offset = data.offset
        self.limit = data.limit
        self.total = data.total
        self.count = data.count
    }
    
    func proccessNewPage() -> Bool{
        if self.total > (self.offset+self.count){
            self.newOffset = self.offset+self.count
            return true
        }else{
            self.newOffset = 0
            return false
        }
    }
}
