//
//  ElementCodable.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation

/**
 * Support structure that parses an item list.
 */
struct ElementCodable<Element : Codable> : Codable {

    var elements: [Element]

    init(from decoder: Decoder) throws {

        var container = try decoder.unkeyedContainer()

        var elements = [Element]()
        if let count = container.count {
            elements.reserveCapacity(count)
        }

        while !container.isAtEnd {
            if let element = try container
                .decode(ElementDecodable<Element>.self).base {

                elements.append(element)
            }
        }

        self.elements = elements
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(elements)
    }
}
