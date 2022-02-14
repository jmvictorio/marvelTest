//
//  ListHeroData.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation


// MARK: - ListHeroData
struct ListHeroData: Codable {
    var code: Int?
    var status, copyright, attributionText, attributionHTML: String?
    var etag: String?
    var data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    var offset, limit, total, count: Int
    var results: [ResultHero]?
}

// MARK: - Result
struct ResultHero: Codable {
    var id: Int?
    var name, resultDescription: String?
    var modified: String?
    var thumbnail: Thumbnail?
    var resourceURI: String?
    var comics, events, stories, series: Item?
    var urls: [URLElement]?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case modified, thumbnail, resourceURI, comics, series, stories, events, urls
    }
}

// MARK: - Comics
struct Item: Codable {
    var available: Int?
    var collectionURI: String?
    var items: [SubItem]?
    var returned: Int?
}

// MARK: - ComicsItem
struct SubItem: Codable {
    var resourceURI: String?
    var name: String?
    var type: String?
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    var path: String?
    var thumbnailExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - URLElement
struct URLElement: Codable {
    var type: String?
    var url: String?
}
