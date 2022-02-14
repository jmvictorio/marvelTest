//
//  HeroEntity.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation

class HeroEntity{
    
    var id: Int = 0
    var name: String = ""
    var picture: String = ""
    
    var comics: ComicEntity?
    var series: SerieEntity?
    var events: EventEntity?
    var stories: StoryEntity?
    
    init(model: ResultHero){
        self.id = model.id ?? 0
        self.name = model.name ?? ""
        if let thumbnail = model.thumbnail{
            self.picture = thumbnail.path!.replacingOccurrences(of: "http:", with: "https:")+"."+thumbnail.thumbnailExtension!
        }
        if let _comics = model.comics {
            self.comics = ComicEntity.init(model: _comics)
        }
        if let _series = model.series {
            self.series = SerieEntity.init(model: _series)
        }
        if let _stories = model.stories {
            self.stories = StoryEntity.init(model: _stories)
        }
        if let _events = model.events {
            self.events = EventEntity.init(model: _events)
        }
    }
}

class EventEntity{
    var number: Int
    var items: [ItemEntity] = []
    
    init(model: Item){
        self.number = model.returned ?? 0
        for item in model.items ?? []{
            self.items.append(ItemEntity.init(model: item))
        }
    }
}

class SerieEntity{
    var number: Int
    var items: [ItemEntity] = []
    
    init(model: Item){
        self.number = model.returned ?? 0
        for item in model.items ?? []{
            self.items.append(ItemEntity.init(model: item))
        }
    }
}
class StoryEntity{
    var number: Int
    var items: [ItemEntity] = []
    
    init(model: Item){
        self.number = model.returned ?? 0
        for item in model.items ?? []{
            self.items.append(ItemEntity.init(model: item))
        }
    }
}

class ComicEntity{
    var number: Int
    var items: [ItemEntity] = []
    
    init(model: Item){
        self.number = model.returned ?? 0
        for item in model.items ?? []{
            self.items.append(ItemEntity.init(model: item))
        }
    }
}

class ItemEntity{
    var url: String
    var name: String
    var type: String?
    
    init(model: SubItem){
        self.url = (model.resourceURI ?? "").replacingOccurrences(of: "http:", with: "https:")
        self.name = model.name ?? ""
        self.type = model.type
    }
}
