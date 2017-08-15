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
import SwiftyJSON

class MainController: UITableViewController{
    
//    @IBOutlet weak var messageLabel: UILabel!
    var kodesmells : [Kodesmell] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getKodeSmells().responseJSON { response in
            if let result = response.result.value {
                let json = result as! NSDictionary
            
                if let data = json.object(forKey: "data"){
                    let kodes = JSON(data)
                   
                    kodes["kodes"].array?.forEach({ (jsonObject) in

                        if let kodesmell = Kodesmell.kodesmellFromJSONObject(jsonObject: jsonObject){
                            self.kodesmells.append(kodesmell)
                        }
                    })
                    
                }
            }
            self.tableView.reloadData()
        }
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    
    // 테이블 행수 얻기 (tableView 구현 필수)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kodesmells.count
    }
    
    // 셀 내용 변경하기 (tableView 구현 필수)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        let cell = tableView.dequeueReusableCell(withIdentifier:"Kodesmell" , for: indexPath) as! KodesmellCell
        cell.tvMessage?.text = kodesmells[indexPath.row].message

        let highlightr = Highlightr()
        highlightr?.setTheme(to: "paraiso-dark")
        let code = kodesmells[indexPath.row].shortCode

        // You can omit the second parameter to use automatic language detection.
        let highlightedCode = highlightr?.highlight(code, as: "Java")
    
        cell.tvCode?.attributedText = highlightedCode
        
//        messageLabel.text = titles[indexPath.row]
        return cell
    }
    
}
