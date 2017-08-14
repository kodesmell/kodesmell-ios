//
//  MainController.swift
//  kodesmell-ios
//
//  Created by 정석원 on 15/08/2017.
//  Copyright © 2017 Kodesmell. All rights reserved.
//

import UIKit
import Foundation
import Highlightr

class MainController: UITableViewController{
    
//    @IBOutlet weak var messageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getKodeSmells().responseJSON { response in
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
    }
    
    let titles = ["haaaaaaa", "Change", "Fxxx", "what"]

    
    // 테이블 행수 얻기 (tableView 구현 필수)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    // 셀 내용 변경하기 (tableView 구현 필수)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        let cell = tableView.dequeueReusableCell(withIdentifier:"Kodesmell" , for: indexPath) as! KodesmellCell
        cell.tvMessage?.text = titles[indexPath.row]

        let highlightr = Highlightr()
        highlightr?.setTheme(to: "paraiso-dark")
        let code = "let a = 1\nlet b = 1\n// ;) fix me!!!\n override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {\n  return titles.count\n}"

        // You can omit the second parameter to use automatic language detection.
        let highlightedCode = highlightr?.highlight(code, as: "javascript")
        
        cell.tvCode?.attributedText = highlightedCode
        
//        messageLabel.text = titles[indexPath.row]
        return cell
    }
    
}
