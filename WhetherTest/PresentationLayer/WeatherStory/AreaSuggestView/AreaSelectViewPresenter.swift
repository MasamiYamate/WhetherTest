//
//  AreaSuggestViewPresenter.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/10.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import UIKit

class AreaSelectViewPresenter: NSObject , PresenterProtocol {

    typealias VC = AreaSelectViewController
    
    var viewController: AreaSelectViewController?
    
    var cityTagUseCase: CityTagUseCase
    
    // MARK: 初期化メソッド群
    override init() {
        cityTagUseCase = CityTagUseCase()
    }
    
}

extension AreaSelectViewPresenter: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}


