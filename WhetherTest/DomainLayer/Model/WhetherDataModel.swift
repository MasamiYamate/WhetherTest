//
//  WhetherDataModel.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/11.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import UIKit
import SwiftyJSON

final class WhetherDataModel: NSObject {

    // MARK: Location
    // 地方名
    var area: String = ""
    // 都道府県名
    var pref: String = ""
    // 1次細分区名
    var city: String = ""

    // 見出し
    var title: String = ""
    // リクエストされたデータの地域に該当するlivedoor 天気情報のURL
    var link: String = ""
    // 予報の発表日時
    var publicTime: Date?

    // MARK: description
    // 天気概況文
    var guideText: String = ""
    // 概況分発表時刻
    var guidePublicTime: Date?
    
    // MARK: forecasts
    var forecasts: [WhetherForecastModel] = []
    
    // MARK: Copyright
    var cpTitle: String = ""
    var cpLink: String = ""
    var cpImgUrl: String = ""
    
    // MARK: provider
    var providers: [[String:Any]] = []

    init(_ data: JSON) {
        if let location = data["location"].dictionary {
            area = location["area"]?.string ?? ""
            pref = location["pref"]?.string ?? ""
            city = location["city"]?.string ?? ""
        }
        title = data["title"].string ?? ""
        link = data["link"].string ?? ""
        if let strPublicTime: String = data["publicTime"].string {
            publicTime = Date.trans(strPublicTime, format: "yyyy-MM-dd")
        }
        if let description = data["description"].dictionary {
            guideText = description["text"]?.string ?? ""
            if let strPublicTime: String = description["publicTime"]?.string {
                guidePublicTime = Date.trans(strPublicTime, format: "yyyy-MM-dd")
            }
        }
        
        let tmpForecasts: [JSON] = data["forecasts"].arrayValue
        for forecast in tmpForecasts {
            let tmpModel = WhetherForecastModel(data: forecast)
            forecasts.append(tmpModel)
        }
        
        if let copyright = data["copyright"].dictionary {
            cpTitle = copyright["title"]?.string ?? ""
            cpLink = copyright["link"]?.string ?? ""
            if let tmpImage = copyright["image"]?.dictionary {
                cpImgUrl = tmpImage["url"]?.string ?? ""
            }
            if let tmpProviders = copyright["provider"]?.array {
                for provider in tmpProviders {
                    if let dic: [String:Any] = provider.dictionaryObject {
                        providers.append(dic)
                    }
                }
            }
        }
    }
}

final class WhetherForecastModel: NSObject {

    //予報日
    var date: Date?
    //予報日(今日 , 明日 , 明後日)
    var dateLabel: String = ""
    //天気の種別 (晴れ、曇り、雨など)
    var telop: String = ""
    //アイコンのURL
    var iconImgUrl: String = ""

    //最高気温
    var maxTemp: String = ""
    var minTemp: String = ""

    init(data: JSON) {
        if let strDate: String = data["date"].string {
            date = Date.trans(strDate, format: "yyyy-MM-dd")
        }
        dateLabel = data["dateLabel"].string ?? ""
        telop = data["telop"].string ?? ""
        if let image = data["image"].dictionary {
            iconImgUrl = image["url"]?.string ?? ""
        }
        if let tmperature = data["temperature"].dictionary {
            if let max = tmperature["max"]?.dictionary {
                maxTemp = max["celsius"]?.string ?? ""
            }
            if let min = tmperature["min"]?.dictionary {
                minTemp = min["celsius"]?.string ?? ""
            }
        }
    }

}
