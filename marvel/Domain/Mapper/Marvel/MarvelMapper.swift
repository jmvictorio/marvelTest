//
//  MarvelMapper.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation

class MarvelMapper {
    
    static func convert(data: Data) -> ListHeroData {
        return Mapper<ListHeroData>.mapperElementObject(withJSONData: data) as! ListHeroData // get the objects from the data.
    }
    
    static func convert(model: ListHeroData) -> ListHeroEntity {
        return ListHeroEntity.init(model: model)
    }
}
