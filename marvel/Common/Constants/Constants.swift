//
//  Constants.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation

struct Constants {
    
    struct httpURL {
        
        enum HTTPHeaderField: String {
            case contentType = "Content-Type"
        }
        
        static let scheme: String = "https"
        
        static var baseURL: String {
            return "gateway.marvel.com"
        }
        
        enum ContentType: String {
            case json = "application/json"
        }
        
        enum params: String{
            case hash = "hash"
            case apikey = "apikey"
            case ts = "ts"
            case limit = "limit"
            case offset = "offset"
        }
    }
    
    struct keys {
        static let publicKey = "e9b552aa7049184c299c94d35c538d35"
        static let privateKey = "f8e13b42d3497150de8ba57228cd63b3d24f5c16"
    }
    
    struct cells{
        static let homeCell = "homeListIdentifier"
        static let DetailCell = "detailIdentifier"
    }
    
    struct controllers{
        static let detail = "detailController"
    }
}
