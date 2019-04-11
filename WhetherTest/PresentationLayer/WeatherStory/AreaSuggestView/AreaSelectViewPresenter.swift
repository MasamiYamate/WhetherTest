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

    // MARK: TableView生成に必要なデータを生成するメソッド群
    /// セクションの総数(エリア名の総数)を取得します
    ///
    /// - Returns: AreaTotalCount
    func getTotalSectionCount () -> Int {
        return cityTagUseCase.getAreas().count
    }
    
    /// セクションに表示するエリア名を取得します
    ///
    /// - Parameter section: SectionNo
    /// - Returns: AreaName
    func getSectionTitle (_ section: Int) -> String {
        //エリア名称の抽出
        let areas = cityTagUseCase.getAreas()
        var setName: String?
        if section < areas.count {
            setName = areas[section]
        }
        return setName ?? ""
    }
    
    /// 各Areaに属する都市名の総数を取得します
    ///
    /// - Parameter section: SectionNo
    /// - Returns: CityCount
    func getTotalCityCount (_ section: Int) -> Int {
        let areas = cityTagUseCase.getAreas()
        if section < areas.count {
            let name: String = areas[section]
            let citys = cityTagUseCase.getCitys(name)
            return citys.count
        }
        return 0
    }
    
    /// 指定位置のCityModelを取得します
    ///
    /// - Parameter indexPath: 表示対象CellのIndexPath
    /// - Returns: 指定したCityModel
    func getCityModel (_ indexPath: IndexPath) -> CityModel? {
        let areas = cityTagUseCase.getAreas()
        if indexPath.section < areas.count {
            let name: String = areas[indexPath.section]
            let citys = cityTagUseCase.getCitys(name)
            return citys[indexPath.row]
        }
        return nil
    }

}
