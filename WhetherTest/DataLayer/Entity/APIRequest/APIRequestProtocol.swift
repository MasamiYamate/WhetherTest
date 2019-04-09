//
//  APIRequestProtocol.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/09.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import Foundation
import APIKit
import SwiftyJSON
import SwiftyXMLParser

protocol APIRequest: Request {
    var prms: [String:Any] {get set}
    var reqURL: String {get set}
    var reqMethod: HTTPMethod {get set}
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response
}

extension APIRequest {
    var baseURL: URL {
        return URL(string: self.reqURL)!
    }
    
    var parameters: Any? {
        return self.prms
    }

    var method: HTTPMethod {
        return self.reqMethod
    }
}
