//
//  RepositoryProtocol.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/09.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//
//  各Repositoryの共通Protocol
//

import Foundation

protocol RepositoryProtocol {
    associatedtype Callback
    
    func request(_ callback: @escaping (Callback) -> Void)
}
