//
//  NetworkManager.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 28/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit
import Alamofire

protocol NetworkManager {
    typealias Parameters = [String: Any]
    typealias Headers = [String: String]
    typealias Method = Alamofire.HTTPMethod
    typealias CompletionHandler = (DataResponse<Any>) -> Void
    
    static func requestJson(method: Method, url: String, parameters: Parameters?, header: Headers?, completion: @escaping CompletionHandler)
    
    static func requestURL(method: Method, url: String, parameters: Parameters?, header: Headers?, completion: @escaping CompletionHandler)
    
}

extension NetworkManager {
    
    static func requestJson(method: Method, url: String, parameters: Parameters? = nil, header: Headers? = nil, completion: @escaping CompletionHandler) {
        Alamofire.request(
            url,
            method: method,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: header)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON(completionHandler: completion)
    }
    
    static func requestURL(method: Method, url: String, parameters: Parameters? = nil, header: Headers? = nil, completion: @escaping CompletionHandler) {
        Alamofire.request(
            url,
            method: method,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: header)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON(completionHandler: completion)
    }
    
}


