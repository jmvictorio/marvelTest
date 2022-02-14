//
//  APIConfiguration.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var queryParameters: [URLQueryItem]? { get }
    
}
