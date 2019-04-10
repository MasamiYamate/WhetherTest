//
//  DataStoreProtocol.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/09.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import Foundation

protocol DataStoreProtocol {
    associatedtype Output

    func request (_ callback: @escaping (Output?) -> Void)
}
