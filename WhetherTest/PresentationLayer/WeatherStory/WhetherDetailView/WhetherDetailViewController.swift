
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "1"
        return cell
    }
    
    
}
