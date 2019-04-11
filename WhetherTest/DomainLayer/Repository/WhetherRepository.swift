//
//  WhetherRepository.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/11.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import Foundation
import SwiftyJSON

struct WhetherRepository: RepositoryProtocol {
    typealias Callback = JSON?
    
    private let dataStore: WhetherDataStore
    
    init(_ id: String) {
        dataStore = WhetherDataStore(id)
    }
    
    func request(_ callback: @escaping (JSON?) -> Void) {
        dataStore.request({ result in
            callback(result)
        })
    }
    
}
