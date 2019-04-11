//
//  WhetherUseCase.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/11.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import Foundation
import SwiftyJSON

class WhetherUseCalse {
    
    // MARK: Presenterからアクセスするデータ群
    private var whetherData: WhetherDataModel?
    
    // MARK: データリクエストに必要なリポジトリ
    private var whetherRepository: WhetherRepository
    
    // MARK: 初期化
    init(_ id: String) {
        whetherRepository = WhetherRepository(id)
    }
    
    func request (_ callback: (() -> (Void))?) {
        whetherRepository.request({ res in
            if let resJson: JSON = res {
                let tmpWhetherData: WhetherDataModel = WhetherTranslater.translate(resJson)
                self.whetherData = tmpWhetherData
            }
            callback?()
        })
    }
    
    func getWhetherData () -> WhetherDataModel? {
        return whetherData
    }
    
}
