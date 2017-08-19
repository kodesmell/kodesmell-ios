//
//  DetailController.swift
//  kodesmell-ios
//
//  Created by JeongSeokWon on 19/08/2017.
//  Copyright © 2017 Kodesmell. All rights reserved.
//

import Foundation
import UIKit
import Highlightr

class DetailController: UIViewController {
    
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lbCode: UILabel!
    @IBOutlet weak var svCode: UIScrollView!
    
    var kodesmell :Kodesmell? = nil
    override func viewDidLoad() {
        if let kodesmell = kodesmell{
            setView(kodesmell: kodesmell)
        }
    }
    
    private func setView(kodesmell:Kodesmell){
        setCode(code: kodesmell.code)
        setMessage(message: kodesmell.message)
    }
    
    private func setCode(code:String){
        let highlightr = Highlightr()
        highlightr?.setTheme(to: "paraiso-dark")
        
        // You can omit the second parameter to use automatic language detection.
        let highlightedCode = highlightr?.highlight(code, as: "Java")
        
        if let count =  highlightedCode?.string.lines.count{
            lbCode.numberOfLines = count + 1
        }
        
        
        guard let height = highlightedCode?.size().height ,
            let width = highlightedCode?.size().width
            else {
                return
        }
        
        svCode.contentSize.width = width + 10
        svCode.contentSize.height = height + 10
        
        
        lbCode.frame = CGRect(x: (lbCode?.frame.origin.x)!,
                                    y: (lbCode?.frame.origin.y)!,
                                    width: width + 10,
                                    height: height + 10)
        lbCode.attributedText = highlightedCode
        lbCode.sizeToFit()
    }
    
    private func setMessage(message:String){
        lblMessage.text = message
    }
}
