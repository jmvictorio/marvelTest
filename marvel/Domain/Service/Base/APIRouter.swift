//
//  APIRouter.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation
import Alamofire
import CryptoKit

enum APIRouter: APIConfiguration{
    case list(offset: Int)
    case detail(id: String)
    
    var method: HTTPMethod{
        switch self {
        case .list, .detail:
            return .get
        }
    }
    
    var path: String{
        switch self{
        case .list:
            return "/v1/public/characters"
        case .detail(let id):
            return "/v1/public/characters/"+id
        }
    }
    
    var parameters: Parameters?{
        switch self{
        default:
            return nil
        }
    }
    
    var queryParameters: [URLQueryItem]?{
        switch self{
        case .list(let offset):
            return self.generateQueryList(offset: offset)
        default:
            return self.generateQueryDetail()
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: self.createURL())
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(Constants.httpURL.ContentType.json.rawValue, forHTTPHeaderField: Constants.httpURL.HTTPHeaderField.contentType.rawValue)
        
        return urlRequest
    }
    
    func createURL() -> URL {
        let urlComponents = NSURLComponents()
        
        urlComponents.scheme = Constants.httpURL.scheme
        urlComponents.percentEncodedQueryItems = self.queryParameters
        urlComponents.host = Constants.httpURL.baseURL
        urlComponents.path = self.path
        
        guard let url = urlComponents.url else { return URL(string: "")! }
        
        return url
    }
}

extension APIRouter{
    func generateTS() -> String{
        return "1000"
    }
    
    func getHASH() -> String{
        return MD5(string: self.generateTS()+Constants.keys.privateKey+Constants.keys.publicKey)
    }
    
    func MD5(string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
        
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
    
    func generateQueryList(offset: Int? = 0) -> [URLQueryItem]{
        return [URLQueryItem(name: Constants.httpURL.params.ts.rawValue, value: self.generateTS()),
                URLQueryItem(name: Constants.httpURL.params.apikey.rawValue, value: Constants.keys.publicKey),
                URLQueryItem(name: Constants.httpURL.params.hash.rawValue, value: self.getHASH()),
                URLQueryItem(name: Constants.httpURL.params.limit.rawValue, value: "20"),
                URLQueryItem(name: Constants.httpURL.params.offset.rawValue, value: offset!.description)]
    }
    
    func generateQueryDetail(offset: Int? = 0) -> [URLQueryItem]{
        return [URLQueryItem(name: Constants.httpURL.params.ts.rawValue, value: self.generateTS()),
                URLQueryItem(name: Constants.httpURL.params.apikey.rawValue, value: Constants.keys.publicKey),
                URLQueryItem(name: Constants.httpURL.params.hash.rawValue, value: self.getHASH())]
    }
}
