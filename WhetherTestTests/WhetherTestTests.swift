//
//  WhetherTestTests.swift
//  WhetherTestTests
//
//  Created by MasamiYamate on 2019/04/09.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import XCTest
import SwiftyXMLParser
@testable import WhetherTest

class WhetherTestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // MARK: 非同期通信周りのテストコード
    /// 1次細分句定義表XMLの取得テスト
    func testCityTagRequest () {
        let repository = CityTagRepository()
        repository.request({data in
            XCTAssertNil(data, "XML.Accessor not found error")
            let cityModels = CityTagTranslater.translate(data!)
            XCTAssertNil(cityModels, "CityModels not found error")
            let areaCount: Int = cityModels!.areas.count
            let citysKeyCount: Int = cityModels!.cityModels.keys.count
            //Area名称の件数とCitysのKeyの件数が合致している場合success
            XCTAssertEqual(areaCount, citysKeyCount)
        })
    }
    
    

}
