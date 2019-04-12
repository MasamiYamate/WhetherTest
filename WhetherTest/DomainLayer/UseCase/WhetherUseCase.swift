//
//  WhetherUseCase.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/11.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import Foundation
import SwiftyJSON

class WhetherUseCase {
    
    // MARK: Presenterからアクセスするデータ群
    private var whetherData: WhetherDataModel?
    
    // MARK: データリクエストに必要なリポジトリ
    private var whetherRepository: WhetherRepository
    
    // MARK: 初期化
    init(_ id: String) {
        whetherRepository = WhetherRepository(id)
    }
    
    func request (_ callback: (() -> (Void))?) {
        whetherRepository.request({ res in
            if let resJson: JSON = res {
                let tmpWhetherData: WhetherDataModel = WhetherTranslater.translate(resJson)
                self.whetherData = tmpWhetherData
            }
            callback?()
        })
    }
    
    // MARK: 各種天気情報の取得
    /// お天気情報のデータの有無を返却します
    ///
    /// - Returns: Bool
    func isDataGeted () -> Bool {
        if self.whetherData != nil {
            return true
        }else{
            return false
        }
    }
    
    /// Titleの取得
    ///
    /// - Returns: Title
    func getTitle () -> String {
        return whetherData?.title ?? ""
    }
    
    /// 地方名の取得
    ///
    /// - Returns: Area
    func getAreaName () -> String {
        return whetherData?.area ?? ""
    }
    
    /// 都道府県名の取得
    ///
    /// - Returns: Pref
    func getPrefName () -> String {
        return whetherData?.pref ?? ""
    }
    
    /// 1次細分区名(都市名)を取得します
    ///
    /// - Returns: String
    func getCityName () -> String {
        return whetherData?.city ?? ""
    }
    
    /// 予報文を取得します
    ///
    /// - Returns: 予報文
    func getGuide () -> String {
        let result = whetherData?.guideText ?? ""
        //APIから返却される予報文には、変な位置で改行コード(¥n)が入るため全て取り除く
        return result.replacingOccurrences(of: "\n", with: "")
    }
    
    /// コピーライトを取得します
    ///
    /// - Returns: Copyright
    func getCopyright () -> String{
        return whetherData?.cpTitle ?? ""
    }
    
    /// プロバイダーの件数を取得します
    ///
    /// - Returns: Provider件数
    func getProviderCount () -> Int {
        return whetherData?.providers.count ?? 0
    }
    
    /// プロバイダーのデータを取得します
    ///
    /// - Parameter index: 配列のindex
    /// - Returns: プロバイダーデータ
    func getProvider (_ idx: Int) -> [String:Any]? {
        if idx < getProviderCount() {
            return whetherData?.providers[idx]
        }
        return nil
    }
    
    /// プロバイダーの名称を取得します
    ///
    /// - Parameter idx: 配列のindex
    /// - Returns: プロバイダー名称
    func getProviderName (_ idx: Int) -> String {
        if let provider: [String:Any] = getProvider(idx) {
            let name = provider["name"] as? String
            return name ?? ""
        }
        return ""
    }
    
    /// 予報の件数を取得します
    ///
    /// - Returns: Int
    func getForecastCount () -> Int {
        return whetherData?.forecasts.count ?? 0
    }
    
    /// 予報アイコンの画像URLを取得します
    ///
    /// - Parameter type: 予報種別(今日、明日、明後日)
    /// - Returns: Icon image url
    func getForecastIcon (_ type: WhetherForecastModel.DateType) -> String? {
        guard let tmpForecast: WhetherForecastModel = searchForecast(type) else {
            return nil
        }
        return tmpForecast.iconImgUrl
    }
    
    /// 予報アイコンのUIImageを取得します
    ///
    /// - Parameter type: 予報種別(今日、明日、明後日)
    /// - Returns: Icon image
    func getForecastIconImage (_ type: WhetherForecastModel.DateType) -> UIImage? {
        guard let tmpForecast: WhetherForecastModel = searchForecast(type) else {
            return nil
        }
        guard let imgUrl: URL = URL(string: tmpForecast.iconImgUrl) else {
            return nil
        }
        guard let imgData: Data = try? Data(contentsOf: imgUrl) else {
            return nil
        }
        return UIImage(data: imgData)
    }
    
    /// 予報の天気の種別名を取得します
    ///
    /// - Parameter type: 予報種別(今日、明日、明後日)
    /// - Returns: 晴れ、曇り、雨など
    func getForecastTelop (_ type: WhetherForecastModel.DateType) -> String? {
        guard let tmpForecast: WhetherForecastModel = searchForecast(type) else {
            return nil
        }
        return tmpForecast.telop
    }
    
    /// 最高気温を取得します
    ///
    /// - Parameter type: 予報種別(今日、明日、明後日)
    /// - Returns: 該当日の最高気温
    func getMaxTemp (_ type: WhetherForecastModel.DateType) -> String {
        guard let tmpForecast: WhetherForecastModel = searchForecast(type) else {
            return "-℃"
        }
        return tmpForecast.maxTemp
    }
    
    /// 最低気温を取得します
    ///
    /// - Parameter type: 予報種別(今日、明日、明後日)
    /// - Returns: 該当日の最低気温
    func getMinTemp (_ type: WhetherForecastModel.DateType) -> String {
        guard let tmpForecast: WhetherForecastModel = searchForecast(type) else {
            return "-"
        }
        return tmpForecast.minTemp
    }
    
    private func searchForecast (_ type: WhetherForecastModel.DateType) -> WhetherForecastModel? {
        guard let forecasts = whetherData?.forecasts else {
            return nil
        }
        for tmpForecast in forecasts {
            if tmpForecast.dateType == type {
                return tmpForecast
            }
        }
        return nil
    }
    
}
