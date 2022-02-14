//
//  ElementDecodable.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation

/**
 * Support structure that parses each element of a list.
 */
struct ElementDecodable<Base : Decodable> : Decodable {

    let base: Base?

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.base = try? container.decode(Base.self)
    }
}
