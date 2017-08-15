//
//  extension.swift
//  kodesmell-ios
//
//  Created by JeongSeokWon on 14/08/2017.
//  Copyright © 2017 Kodesmell. All rights reserved.
//

import Foundation
import Alamofire

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
            debugPrint(self)
        #endif
        return self
    }
}

extension String {
    var lines: [String] {
        var result: [String] = []
        enumerateLines { line, _ in result.append(line) }
        return result
    }
}
