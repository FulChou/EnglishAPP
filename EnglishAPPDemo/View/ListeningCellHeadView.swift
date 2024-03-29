//
//  ListeningCellHeadView.swift
//  EnglishAPPDemo
//
//  Created by 周福 on 2019/9/27.
//  Copyright © 2019 org.csu. All rights reserved.
//

import UIKit

class ListeningCellHeadView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var enContent: UILabel!
    @IBOutlet weak var starView: StarView!
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        starView.canSelect = true
        starView.drawStar(level: 4, count: 5)
    }

}
