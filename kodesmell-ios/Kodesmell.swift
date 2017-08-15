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
    var shortCode:String
    
    static func kodesmellFromJSONObject(jsonObject: JSON) -> Kodesmell? {
        guard let id = jsonObject["id"].string,
                        let message = jsonObject["message"].string,
                        let hash = jsonObject["hash"].string,
                        let code = jsonObject["code"].string,
                        let fileName = jsonObject["fileName"].string,
                        let lineNumber = jsonObject["lineNumber"].int
        else {
            return nil
        }
                
        return Kodesmell(id: id,
                             message: message,
                             hash:hash,
                             code:code,
                             fileName:fileName,
                             lineNumber:lineNumber,
                             shortCode:getShortCode(lines: code.lines, lineNumber: lineNumber))
        }
    }

    func getShortCode(lines:[String], lineNumber:Int) -> String {
        var resultString = ""
        for index in (lineNumber-4)...(lineNumber+3) {
            resultString += lines[index] + "\n"
        }
        return resultString
    }




    

