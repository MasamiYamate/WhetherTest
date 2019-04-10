//
//  LoadingViewPresenter.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/10.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import Foundation

class LoadingViewPresenter: PresenterProtocol {
    typealias VC = LoadingViewController
    
    var viewController: LoadingViewController?
    
    var cityTagUseCase: CityTagUseCase
    
    // MARK: 初期化メソッド群
    init() {
        cityTagUseCase = CityTagUseCase()
    }
    
    func viewWillAppearTask() {
        startLoading()
    }
    
    func viewDidAppearTask() {
        //View描画後、データ取得開始
        getCityData()
    }
    
    // MARK: データのリクエストなど
    /// Cityデータを取得する
    func getCityData () {
        cityTagUseCase.request({
            //データ取得後、画面遷移させる
            self.jumpAreaSuggestView()
        })
    }
    
    // MARK: UIイベントなど
    /// Loadingの開始
    func startLoading () {
        DispatchQueue.main.async {
            self.viewController?.loadingCircle.startAnimating()
        }
    }
    
    /// Loadingの終了
    func stopLoading () {
        DispatchQueue.main.async {
            self.viewController?.loadingCircle.stopAnimating()
        }
    }
    
    /// AreaSuggestViewに遷移します
    func jumpAreaSuggestView () {
        stopLoading()
        viewController?.performSegue(withIdentifier: "LoadingViewToWhetherStory", sender: nil)
    }

}
