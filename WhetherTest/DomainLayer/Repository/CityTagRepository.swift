//
//  CityTagRepository.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/09.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import Foundation
import SwiftyXMLParser

struct CityTagRepository: RepositoryProtocol {
    typealias Callback = XML.Accessor?
    
    private let dataStore = CityTagDataStore()
    
    func request(_ callback: @escaping (XML.Accessor?) -> Void) {
        dataStore.request({ result in
            callback(result)
        })
    }
}
