//
//  TmpDataRepository.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/10.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import Foundation

struct TmpDataRepository {
    
    var cityData: CityModels? {
        get {
            return TmpDataStore.shared.cityData
        }
        set (value) {
            TmpDataStore.shared.cityData = value
        }
    }
    
}
