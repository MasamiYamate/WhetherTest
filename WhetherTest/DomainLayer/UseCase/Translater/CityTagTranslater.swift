//
//  CityTagTranslater.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/09.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import Foundation
import SwiftyXMLParser

struct CityTagTranslater: TranslaterProtocol {
    typealias Input = XML.Accessor
    typealias Output = CityModels?
    
    static func translate(_ value: XML.Accessor) -> CityModels? {
        guard let rss: XML.Element = value.element?.childElements[0] else {
            print("\(self) rss not found")
            return nil
        }
        //index out of range対策で、念のためindexの個数確認を行う
        if rss.childElements.count == 0 {
            print("\(self) channel not found")
            return nil
        }
        let channel: XML.Element = rss.childElements[0]
        var allArea: XML.Element?
        for channelChild in channel.childElements {
            if channelChild.name == "ldWeather:source" {
                allArea = channelChild
                break
            }
        }
        //ldWeather:sourceがあった場合Modelの生成を行う
        if allArea != nil {
            return CityModels.init(value: allArea!)
        }else {
            print("\(self) ldWeather:source not found")
            return nil
        }
    }
    
}
