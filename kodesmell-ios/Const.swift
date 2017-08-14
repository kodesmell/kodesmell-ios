//
//  Const.swift
//  kodesmell-ios
//
//  Created by JeongSeokWon on 14/08/2017.
//  Copyright © 2017 Kodesmell. All rights reserved.
//

import Foundation
import Alamofire

struct Const {
    static let PARAM_KODE_SMELL: Parameters = [
        "query": "{\n  kodes{\n    id,\n    fileName\n  }\n}"
    ]
}
