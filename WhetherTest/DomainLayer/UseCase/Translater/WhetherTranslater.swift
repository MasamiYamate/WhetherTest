//
//  WhetherTranslater.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/11.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import Foundation
import SwiftyJSON

struct WhetherTranslater: TranslaterProtocol {
    typealias Input = JSON
    typealias Output = WhetherDataModel
    
    static func translate(_ value: JSON) -> WhetherDataModel {
        return WhetherDataModel(value)
    }
}
