
//
//  WhetherDetailViewController.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/10.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import UIKit

class WhetherDetailViewController: UIViewController {
    
    @IBOutlet weak var toDayDataView: UIView!
    @IBOutlet weak var areaNameLabel: UILabel!
    @IBOutlet weak var toDayWhetherIcon: UIImageView!
    @IBOutlet weak var toDayTemperatureLabel: UILabel!
    
    @IBOutlet weak var dailyDataView: UIView!
    @IBOutlet weak var whetherScrollDataView: UIScrollView!
    
    @IBOutlet weak var commentaryTableView: UITableView!

    var presenter = WhetherDetailViewPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoadTask(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppearTask()
        setupDelegate()
    }
    
    func setupDelegate () {
        commentaryTableView.delegate = self
        commentaryTableView.dataSource = self
    }
    
}

extension WhetherDetailViewController: UITableViewDelegate {
    
}

extension WhetherDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "予報"
        case 1:
            return "気象データ 配信元"
        case 2:
            return "Copyright"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 , 2:
            //予報とCopyrightのSectionは1件固定
            return 1
        case 1:
            //情報配信元セルの件数を返却します
            return presenter.getProviderCount()
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return createWeatherForecast(tableView, cellForRowAt: indexPath)
        case 1:
            return createProviderName(tableView, cellForRowAt: indexPath)
        case 2:
            return createCopyright(tableView, cellForRowAt: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    /// 天気予報の表示Cellを生成します
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - indexPath: IndexPath
    /// - Returns: UITableViewCell
    func createWeatherForecast (_ tableView: UITableView , cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = presenter.getGuideText()
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        return cell
    }
    
    /// プロバイダーの名称をセルに反映します
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - indexPath: IndexPath
    /// - Returns: UITableViewCell
    func createProviderName(_ tableView: UITableView , cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = presenter.getProviderName(indexPath.row)
        return cell
    }
    
    /// コピーライトのセルを生成します
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - indexPath: IndexPath
    /// - Returns: UITableViewCell
    func createCopyright(_ tableView: UITableView , cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = presenter.getCopyright()
        return cell
    }
    
    
}
