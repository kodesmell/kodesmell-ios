//
//  ViewController.swift
//  kodesmell-ios
//
//  Created by JeongSeokWon on 13/08/2017.
//  Copyright © 2017 Kodesmell. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
            getKodeSmells()
                .responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result

                    
            if let result = response.result.value {
                 let json = result as! NSDictionary
                print("JSON: \(json)") // serialized json response
                
                if let data = json.object(forKey: "data"){
                    print(data)
                }
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

