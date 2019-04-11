//
//  CityTagUseCase.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/09.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import Foundation
import SwiftyXMLParser

class CityTagUseCase {
    
    // MARK: Presenterからアクセスするデータ群
    private var cityData: CityModels?
    
    // MARK: データリクエストに必要なリポジトリ
    private var cityTagRepository: CityTagRepository
    private var tmpDataRepository: TmpDataRepository
    
    // MARK: 初期化
    init() {
        cityTagRepository = CityTagRepository()
        tmpDataRepository = TmpDataRepository()
        //TmpDataがある場合は、初期化時に取得しておく
        cityData = tmpDataRepository.cityData
    }
    
    func request (_ callback: (() -> (Void))?) {
        cityTagRepository.request({ res in
            if let xml: XML.Accessor = res , let tmpCityData: CityModels = CityTagTranslater.translate(xml) {
                self.cityData = tmpCityData
                //CityTagは後からも使うため、アプリ内のTmpDataとして保持させる
                self.tmpDataRepository.cityData = tmpCityData
            }
            callback?()
        })
    }

    // MARK: データ取得関連
    
    /// 全国のエリア名を取得します
    ///
    /// - Returns: [道北 , 道東 , 道南 , ...]
    func getAreas () -> [String] {
        return cityData?.areas ?? []
    }
    
    /// エリア名称を元に所属する街のデータを取得します
    ///
    /// - Parameter areaName: 道北
    /// - Returns: [CityModel] ... 属する街のCityModelの配列
    func getCitys (_ areaName: String) -> [CityModel] {
        return cityData?.cityModels[areaName] ?? []
    }
    
    /// セクションの総数(エリア名の総数)を取得します
    ///
    /// - Returns: AreaTotalCount
    func getTotalSectionCount () -> Int {
        return getAreas().count
    }
    
    /// セクションに表示するエリア名を取得します
    ///
    /// - Parameter section: SectionNo
    /// - Returns: AreaName
    func getSectionTitle (_ section: Int) -> String {
        //エリア名称の抽出
        let areas = self.getAreas()
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
        let areas = getAreas()
        if section < areas.count {
            let name: String = areas[section]
            let citys = getCitys(name)
            return citys.count
        }
        return 0
    }
    
    /// 指定位置のCityModelを取得します
    ///
    /// - Parameter indexPath: 表示対象CellのIndexPath
    /// - Returns: 指定したCityModel
    func getCityModel (_ indexPath: IndexPath) -> CityModel? {
        let areas = getAreas()
        if indexPath.section < areas.count {
            let name: String = areas[indexPath.section]
            let citys = getCitys(name)
            return citys[indexPath.row]
        }
        return nil
    }
    
}
