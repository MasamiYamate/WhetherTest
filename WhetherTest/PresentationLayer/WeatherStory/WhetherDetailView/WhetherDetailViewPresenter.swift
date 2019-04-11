//
//  WhetherDetailViewPresenter.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/10.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import UIKit

class WhetherDetailViewPresenter: NSObject , PresenterProtocol {    
    typealias VC = WhetherDetailViewController
    
    var viewController: WhetherDetailViewController?
    
    var whetherUseCase: WhetherUseCalse?
    
    var useCityId: String?
    
    // MARK: 初期化関連
    override init() {}
    
    func viewDidLoadTask(_ vc: WhetherDetailViewController) {
        viewController = vc
        guard let tmpCityId: String = useCityId else {
            return
        }
        whetherUseCase = WhetherUseCalse(tmpCityId)
    }
    
    func viewWillAppearTask() {
        //データのリクエスト
        whetherUseCase?.request({
            self.setupView()
            self.setupScrollView()
        })
    }
    
    // MARK: Viewの初期化
    /// Viewのセットアップ
    func setupView () {
        //地名の反映
        viewController?.areaNameLabel.text = whetherUseCase?.getTitle()
        //アイコンの反映
        viewController?.toDayWhetherIcon.image = whetherUseCase?.getForecastIconImage(.ToDay)
        //気温の反映
        let maxTemp: String = whetherUseCase?.getMaxTemp(.ToDay) ?? "-"
        let minTemp: String = whetherUseCase?.getMinTemp(.ToDay) ?? "-"
        viewController?.toDayTemperatureLabel.text = "\(maxTemp)℃/\(minTemp)℃"
    }
    
    /// 今日、明日以降の天気表示エリアのコンテンツをセットします
    func setupScrollView () {
        var addXPos: CGFloat = 0.0
        let setVH: CGFloat = 80.0
        var setVW: CGFloat = 100.0
        //画面サイズの横幅よりもトータルが小さい場合、各Viewの横幅を調整する
        let windowW = UIScreen.main.bounds.width
        if (setVW * CGFloat(whetherUseCase?.getForecastCount() ?? 0)) < windowW {
            setVW = windowW / CGFloat(whetherUseCase?.getForecastCount() ?? 0)
        }
        for i in 0..<(whetherUseCase?.getForecastCount() ?? 0) {
            let setRect: CGRect = CGRect(x: addXPos, y: 0, width: setVW, height: setVH)
            let dailyView = DailyWhetherView(frame: setRect)
            var setType: WhetherForecastModel.DateType = .ToDay
            switch i {
            case 0:
                setType = .ToDay
            case 1:
                setType = .Tomorrow
            case 2:
                setType = .DayAfterTomorrow
            default:
                continue;
            }
            dailyView.dateLabel.text = setType.rawValue
            dailyView.whetherIcon.image = whetherUseCase?.getForecastIconImage(setType)
            let maxTemp: String = whetherUseCase?.getMaxTemp(setType) ?? "-"
            let minTemp: String = whetherUseCase?.getMinTemp(setType) ?? "-"
            dailyView.tempertureLabel.text = "\(maxTemp)℃/\(minTemp)℃"
            viewController?.whetherScrollDataView.addSubview(dailyView)
            addXPos += setVW
        }
        let setContentsSize: CGSize = CGSize(width: addXPos, height: setVH)
        viewController?.whetherScrollDataView.contentSize = setContentsSize
    }
    

    
    
}
