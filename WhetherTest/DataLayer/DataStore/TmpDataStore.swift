//
//  TmpDataStore.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/10.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//
//  アプリ内で起動中利用するデータを保持する
//  同一データを用いるため、Singletoneとした
//

import Foundation

class TmpDataStore {
    
    static let shared: TmpDataStore = TmpDataStore()
    
    var cityData: CityModels?
    
}
