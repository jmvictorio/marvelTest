//
//  Mapper.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation

class Mapper<Element : Codable> {

    /**
      Method responsible for parsing a json in swift manageable object.
     - Parameter json: The json data.
     
      ````
      Mapper<[classToParser]>.mapperElement([data json])
      ````
     */
    static func mapperElement(withJSONData json: Data) -> [Any] {
        
        do {
          let elements = try JSONDecoder()
              .decode(ElementCodable<Element>.self, from: json)
              .elements

          return elements
          
        } catch {
            NSLog("Error mapping element: \(error)")
        }
        
        return [Any]()
    }
    
    /**
      Method responsible for parsing a json in swift manageable object.
     - Parameter json: The json data.
     
      ````
      Mapper<[classToParser]>.mapperElement([data json])
      ````
     */
    static func mapperElementObject(withJSONData json: Data) -> Any {
        
        do{
            let decoder = JSONDecoder()
            let element = try decoder.decode(Element.self, from: json)
            return element
        }catch{
            return Element.self
        }
    }
}
