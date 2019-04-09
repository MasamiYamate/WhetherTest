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
    
    /// MARK: Presenterからアクセスするデータ群
    private var cityData: CityModels?
    
    /// MARK: データリクエストに必要なリポジトリ
    private var cityTagRepository: CityTagRepository
    
    /// MARK: 初期化
    
    init() {
        cityTagRepository = CityTagRepository()
    }
    
    func request (_ callback: (() -> (Void))?) {
        cityTagRepository.request({ res in
            if let xml: XML.Accessor = res , let tmpCityData: CityModels = CityTagTranslater.translate(xml) {
                self.cityData = tmpCityData
            }
            callback?()
        })
    }

    /// MARK: データ取得関連
    
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
    
}
