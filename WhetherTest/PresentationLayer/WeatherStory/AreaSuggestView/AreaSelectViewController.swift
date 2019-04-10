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

class AreaSelectViewController: UIViewController {
    
    
    
    var presenter = AreaSelectViewPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoadTask(self)
    }
    
}
