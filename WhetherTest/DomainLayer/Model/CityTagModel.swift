//
//  CityTagModel.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/09.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import Foundation
import SwiftyXMLParser

//全国の地域名、エリア名を保持するオブジェクト
class CityModels: NSObject {
    //Dictionaryでは順番が担保されないため
    //Area表記は別の配列として保持する
    var areas: [String] = []
    
    //Area名をKeyにAreaに紐づくCityTagModelの配列保持させる
    var cityModels: [String:[CityModel]] = [:]
    
    init (value: XML.Element) {
        for child in value.childElements {
            //pref配下に各地域名などが含まれる
            if child.name == "pref" {
                guard let areaName: String = child.attributes["title"] else {
                    //エリア名称が取得できない場合は早期リターン
                    print("CityModels Not found area name")
                    return
                }
                
                areas.append(areaName)
                var tmpCityModels: [CityModel] = []

                //pref配下のchildElementsから各地域情報を取得する
                for prefChild in child.childElements {
                    //警報情報も含まれるので、cityの場合の時だけ処理を行う
                    if prefChild.name == "city" {
                        let tmpCityModel: CityModel = CityModel.init(value: prefChild)
                        tmpCityModels.append(tmpCityModel)
                    }
                }
                //地域名をKeyに各CityModelをディクショナリーにセット
                cityModels[areaName] = tmpCityModels
            }
        }
    }
}

/// 名称、エリアIDのオブジェクト
class CityModel: NSObject {
    var name: String
    var id: String
    
    init(value: XML.Element) {
        name = value.attributes["title"] ?? ""
        id = value.attributes["id"] ?? ""
    }
}
