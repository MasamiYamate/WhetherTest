//
//  AreaNameHeaderView.swift
//  WhetherTest
//
//  Created by MasamiYamate on 2019/04/10.
//  Copyright © 2019 MasamiYamate. All rights reserved.
//

import UIKit

class AreaNameHeaderView: UIView {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var sectionOpenCloseBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    private func loadNib(){
        let view = Bundle.main.loadNibNamed("AreaNameHeaderView", owner: self, options: nil)?.first as! AreaNameHeaderView
        view.frame = self.bounds
        nameLabel = view.nameLabel
        sectionOpenCloseBtn = view.sectionOpenCloseBtn
        sectionOpenCloseBtn.imageView?.contentMode = .scaleAspectFit
        self.addSubview(view)
    }

}
