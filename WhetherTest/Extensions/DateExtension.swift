//
//  DateExtension.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/11.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import Foundation

extension Date {
    
    /// 指定フォーマットの文字列の日付からDateを生成する
    ///
    /// - Parameters:
    ///   - strDate: 任意の文字列の日付
    ///   - fmt: 任意の日付フォーマット
    /// - Returns: Date
    static func trans(_ strDate: String , format fmt: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = fmt
        return formatter.date(from: strDate)
    }
    
    /// 指定フォーマットを元にDateからStringを出力する
    ///
    /// - Parameters:
    ///   - date: Date
    ///   - fmt: 任意の日付フォーマット
    /// - Returns: 日付フォーマットを反映した文字列の日付
    static func trans(_ date: Date , format fmt: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = fmt
        return formatter.string(from: date)
    }
    
}
