//
//  TranslaterProtocol.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/09.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import Foundation

protocol TranslaterProtocol {
    associatedtype Input
    associatedtype Output
    
    static func translate(_ value: Input) -> Output
}
