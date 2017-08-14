//
//  Query.swift
//  kodesmell-ios
//
//  Created by JeongSeokWon on 14/08/2017.
//  Copyright © 2017 Kodesmell. All rights reserved.
//

import Foundation
import Alamofire

public func getKodeSmells() -> DataRequest{
    
    let parameters: Parameters = [
        "query": "{\n  kodes{\n    id,\n    message,\n    hash,\n    code,\n    fileName ,\n    lineNumber   }\n}"
    ]
    return Alamofire
        .request("http://192.168.35.167:8000/graphql",
                 method:.post,
                 parameters:parameters,
                 encoding: JSONEncoding.default)

}


