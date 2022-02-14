//
//  BaseAPI.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation
import Alamofire
import RxSwift

class BaseAPI {
    
    @discardableResult
    static func performRequest<T:Decodable>(route:APIConfiguration, decoder: JSONDecoder = JSONDecoder()) -> Observable<T> {
        return Observable<T>.create { observer in
            
            let request = AF.request(route).responseDecodable(decoder: decoder, completionHandler: { (response: DataResponse<T, AFError>) in
                
                self.printResponseDescription(responseData: response.data, responseRequest: response.request, response: response.response, error: response.error)
                
                switch response.result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            })
            return Disposables.create {
                request.cancel()
            }
        }
    }

    
    static private func printResponseDescription(responseData: Data?, responseRequest: URLRequest?, response: HTTPURLResponse?, error: AFError?) {
        let message = "Request: \(String(describing: responseRequest))"
        print(message)
        
        if let data = responseData, let utf8Text = String(data: data, encoding: .utf8) {
            let responseMessage = "Response: \(utf8Text)"
            print(responseMessage)
        }
    }
}
