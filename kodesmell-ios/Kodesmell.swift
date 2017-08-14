//
//  Kodesmell.swift
//  kodesmell-ios
//
//  Created by JeongSeokWon on 14/08/2017.
//  Copyright © 2017 Kodesmell. All rights reserved.
//

import Foundation
import SwiftyJSON


struct Kodesmell {
    var id: String
    var message: String? = nil
    var hash: String
    var code:String
    var fileName:String
    var lineNumber:Int
    var project:Project? = nil
    
//    static func kodesmellsFromJSONArray(jsonArray: [JSON]) -> [Kodesmell]? {
//        return jsonArray.flatMap{ jsonItem -> Kodesmell in
//            guard let id = jsonItem["id"].string,
//                let message = jsonItem["message"].string,
//                let hash = jsonItem["message"].string,
//                let code = jsonItem["message"].string,
//                let fileName = jsonItem["message"].string,
//                let lineNumber = jsonItem["message"].int
//                else { return nil }
//            
//            return Kodesmell(id: id,
//                             message: message,
//                             hash:hash,
//                             code:code,
//                             fileName:fileName,
//                             lineNumber:lineNumber,
//                             project:nil)
//        }
//    }
}
