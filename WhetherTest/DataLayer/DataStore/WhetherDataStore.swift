//
//  WhetherDataStore.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/11.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import Foundation
import APIKit
import SwiftyJSON

struct WhetherDataStore: DataStoreProtocol  {
    typealias Output = JSON
    
    var searchId: String = ""
    
    init(_ id: String) {
        searchId = id
    }
    
    func request(_ callback: @escaping (JSON?) -> Void) {
        let whetherReq: WhetherRequest = WhetherRequest.init(searchId)
        Session.send(whetherReq) { result in
            switch result {
            case .success(let res):
                callback(res)
            case .failure(let err):
                print(err)
                callback(nil)
            }
        }
    }
    
}
