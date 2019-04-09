//
//  Parameters.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/09.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import Foundation

class WTApi {
    //APIのエンドポイント群
    enum EndPoint: String {
        //livedoorのお天気APIの親エンドポイント
        case LIVEDOOR_WEATHER = "http://weather.livedoor.com/"
    }

    enum WhetherPath: String {
        case CITY_TAGS_PATH = "forecast/rss/primary_area.xml"
    }
    
}
