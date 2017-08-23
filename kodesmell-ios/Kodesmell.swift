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
    var message: String
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
        let index = getShortCodeRange(lines: lines, lineNumber: lineNumber)
        for index in index.startIndex...index.lastIndex {
            resultString += lines[index] + "\n"
        }
        return resultString
    }

func getShortCodeRange(lines:[String], lineNumber:Int) -> (startIndex:Int, lastIndex:Int){

    if lines.count < 8 {
        return (0, lines.endIndex)
    }
    
    var startIndex = lineNumber - 4
    var endIndex = lineNumber + 3
    
    while !(startIndex >= 0 &&
        endIndex <= lines.endIndex) {
            if (startIndex < 0) {
                startIndex += 1
                endIndex += 1
            } else if (endIndex > lines.endIndex) {
                startIndex -= 1
                endIndex -= 1
            }
    }
    return (startIndex, endIndex)
}





