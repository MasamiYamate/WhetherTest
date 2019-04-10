//
//  LoadingViewController.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/10.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    @IBOutlet weak var loadingCircle: UIActivityIndicatorView!
    
    var presenter = LoadingViewPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //PresenterにViewControllerを渡す
        presenter.viewDidLoadTask(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppearTask()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppearTask()
    }
    
}
