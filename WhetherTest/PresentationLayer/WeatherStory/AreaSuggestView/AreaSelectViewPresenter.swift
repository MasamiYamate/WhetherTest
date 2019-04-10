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
    
    func viewWillAppearTask() {
        setupTableview()
    }
    
    // MARK: delegate setup
    func setupTableview () {
        viewController?.AreaSelectTableView.delegate = self
        viewController?.AreaSelectTableView.dataSource = self
    }
    
    // MARK: UIイベントなど
    func jumpToWhetherDetailView (_ cityId: String) {
        viewController?.performSegue(withIdentifier: "AreaSelectViewToWhetherDetailView", sender: cityId)
    }

}

extension AreaSelectViewPresenter: UITableViewDelegate , UITableViewDataSource {
    
    /// セクションの総数を返却する
    ///
    /// - Parameter tableView: UITableView
    /// - Returns: Int ... セクションの総数
    func numberOfSections(in tableView: UITableView) -> Int {
        return cityTagUseCase.getAreas().count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //HeaderViewの生成
        let deviceW: CGFloat = UIScreen.main.bounds.size.width
        let frame: CGRect = CGRect(x: 0, y: 0, width: deviceW, height: 40.0)
        let areaNameHeader: AreaNameHeaderView = AreaNameHeaderView(frame: frame)
        //エリア名称の抽出
        let areas = cityTagUseCase.getAreas()
        var setName: String?
        if section < areas.count {
            setName = areas[section]
        }
        areaNameHeader.areaNameLabel.text = setName ?? ""
        return areaNameHeader
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //各Areaに属する都市名の数を返却します
        let areas = cityTagUseCase.getAreas()
        if section < areas.count {
            let name: String = areas[section]
            let citys = cityTagUseCase.getCitys(name)
            return citys.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = .disclosureIndicator
        
        let areas = cityTagUseCase.getAreas()
        if indexPath.section < areas.count {
            let name: String = areas[indexPath.section]
            let citys = cityTagUseCase.getCitys(name)
            let setCity = citys[indexPath.row]
            cell.textLabel?.text = setCity.name
        }else{
            cell.textLabel?.text = ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let areas = cityTagUseCase.getAreas()
        if indexPath.section < areas.count {
            let name: String = areas[indexPath.section]
            let citys = cityTagUseCase.getCitys(name)
            let setCity = citys[indexPath.row]
            let cityId = setCity.id
            self.jumpToWhetherDetailView(cityId)
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}


