//
//  AreaSuggestViewController.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/09.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//
//  お天気情報のArea検索を行うView
//

import UIKit
import APIKit
import SwiftyXMLParser

class AreaSuggestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        CityTagRepository.init().request({_ in
            
        })
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
