//
//  TopUpCreditController.swift
//  EnglishAPPDemo
//
//  Created by 周福 on 2019/9/21.
//  Copyright © 2019 org.csu. All rights reserved.
//

import UIKit

class TopUpCreditController: UIViewController {
    
    @IBOutlet weak var lineImageViewRight: UIImageView!
    @IBOutlet weak var lineImageViewLeft: UIImageView!
    
    @IBOutlet weak var wxpayBtn: UIButton!
    @IBOutlet var cornorBounds: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(hexString: "fafafa")
        let bg_HeadView = UIImageView()
        bg_HeadView.frame = CGRect(x: 0, y: 0, width:SCREEn_WIDTH, height: 75*Y_)
        bg_HeadView.image = UIImage(named: "background_head")
        //头部标签。
        let head = UILabel(frame: CGRect(x: 47.5,y: 40, width: 280, height: 30))
        // 应该在这里写一个函数，动态的修改这个 text 的显示的value
        head.text = "学分充值"
        head.textColor = UIColor.white
        head.font = UIFont(name: "Helvetica Neue", size: 17)
        head.textAlignment = NSTextAlignment.center
        bg_HeadView.addSubview(head)
        
        let backButton = UIButton(frame: CGRect(x: 22.5, y: 45, width: 10, height: 20))
        backButton.setBackgroundImage(UIImage(named: "bt_back"), for: UIControl.State.normal)
        bg_HeadView.addSubview(backButton)
        
        let editBtn = UIButton(frame: CGRect(x: 330, y: 44.5, width: 40, height: 21))
        
        editBtn.isEnabled = true;
        editBtn.setTitle("帮助", for: UIControl.State.normal)
        editBtn.titleLabel?.textColor = UIColor.white

        self.view.addSubview(bg_HeadView)
        self.view.addSubview(editBtn)
        
        // 画虚线：
        UIGraphicsBeginImageContext(lineImageViewLeft.frame.size) // 位图上下文绘制区域
        lineImageViewLeft.image?.draw(in: lineImageViewLeft.bounds)
        let context:CGContext = UIGraphicsGetCurrentContext()!
        context.setLineCap(CGLineCap.square)
        
        let lengths:[CGFloat] = [5,8]
        context.setStrokeColor(UIColor(hexString: "#AEAEAE").cgColor)
        context.setLineWidth(1)
        context.setLineDash(phase: 0, lengths: lengths)
        context.move(to: CGPoint(x: 0, y: 10))
        context.addLine(to: CGPoint(x: self.view.frame.width, y: 10))
        context.strokePath()
        lineImageViewLeft.image = UIGraphicsGetImageFromCurrentImageContext()
        
        // 画右边的虚线；
        UIGraphicsBeginImageContext(lineImageViewRight.frame.size) // 位图上下文绘制区域
        lineImageViewRight.image?.draw(in: lineImageViewRight.bounds)
        let context2:CGContext = UIGraphicsGetCurrentContext()!
        context2.setLineCap(CGLineCap.square)
        
        let lengths2:[CGFloat] = [5,8]
        context2.setStrokeColor(UIColor(hexString: "#AEAEAE").cgColor)
        context2.setLineWidth(1)
        context2.setLineDash(phase: 0, lengths: lengths2)
        context2.move(to: CGPoint(x: 0, y: 10))
        context2.addLine(to: CGPoint(x: self.view.frame.width, y: 10))
        context2.strokePath()
        lineImageViewRight.image = UIGraphicsGetImageFromCurrentImageContext()
        
        for btn in cornorBounds{
            btn.layer.masksToBounds = true
            btn.layer.cornerRadius = 23
            btn.layer.borderColor = UIColor(hexString: "#979797").cgColor
            btn.layer.borderWidth = 1
        }
        wxpayBtn.layer.borderColor = UIColor.clear.cgColor
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
