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
    private var _areas: [String] = []
    var areas: [String] {
        get {
            return _areas
        }
    }
    
    //Area名をKeyにAreaに紐づくCityTagModelの配列保持させる
    private var _cityModels: [String:[CityModel]] = [:]
    var cityModels: [String:[CityModel]] {
        get {
            return _cityModels
        }
    }
    
    init (value: XML.Element) {
        for child in value.childElements {
            //pref配下に各地域名などが含まれる
            if child.name == "pref" {
                guard let areaName: String = child.attributes["title"] else {
                    //エリア名称が取得できない場合は早期リターン
                    print("CityModels Not found area name")
                    return
                }
                
                _areas.append(areaName)
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
                _cityModels[areaName] = tmpCityModels
            }
        }
    }
}

/// 名称、エリアIDのオブジェクト
class CityModel: NSObject {
    private var _name: String
    var name: String {
        get {
            return _name
        }
    }
    
    private var _id: String
    var id: String {
        get {
            return _id
        }
    }
    
    init(value: XML.Element) {
        _name = value.attributes["title"] ?? ""
        _id = value.attributes["id"] ?? ""
    }
}
