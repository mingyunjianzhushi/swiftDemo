//
//  UtilsViewController.swift
//  swift4Demo
//
//  Created by 命运 on 9/26/18.
//  Copyright © 2018 com.org.shunshiwei. All rights reserved.
//

import UIKit

class UtilsViewController: UIViewController , DateSelectManagerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
    self.navigationItem.title = "工具验证"
		labelExtension()
		
	 let btn = UIButton(type: .custom)
	 self.view.addSubview(btn)
		btn.setTitle("点击弹出", for: .normal)
		btn.backgroundColor = UIColor.gray
		btn.addTarget(self, action: #selector(dateDemo), for: .touchUpInside)
		btn.snp.makeConstraints { (make) in
			make.top.equalTo(self.view.snp.top).offset(80)
			make.size.equalTo(CGSize(width: 100, height: 30))
			make.centerX.equalTo(self.view.snp.centerX)
		}
		
		
        // Do any additional setup after loading the view.
    }
	
	//label验证器
	func labelExtension(){
		let label = UILabel(text: "在哪里", fontSize: 14, TextAlignment: .left, textColor: UIColorFromRGB(color_vaule: 0x2b2b2b))
		self.view.addSubview(label)
		label.snp.makeConstraints { (make) in
			make.top.equalTo(self.view.snp.top).offset(30)
			make.size.equalTo(CGSize(width: 100, height: 30))
			make.centerX.equalTo(self.view.snp.centerX)
		}
		
		//判断类型
//		for item in self.view.subviews{
//			if label is UILabel{
//				print("来了")
//			}
//		}
		
		
		
	}
	
	//验证UIAlertController文字的对齐方式
	@objc func UIAlertControllerDemo(){
		let alertVc = UIAlertController(title: "版本提示", message: "这是很长的提示哦\n这是第二句", preferredStyle: .alert)
		alertVc.TJL_messageLabel?.textAlignment = .left
//		alertVc.TJL_titleLabel?.textAlignment = .right
		let cancel = UIAlertAction(title: "稍后升级", style:.default) { (UIAlertAction) in
			
		}
		
		let done = UIAlertAction(title: "升级", style:.default) { (UIAlertAction) in
			
		}
		alertVc.addAction(cancel)
		alertVc.addAction(done)
		self.present(alertVc, animated: false, completion: nil)
		
	}
	
	@objc func dateDemo(){
		let datePicker = DateSelectManager.showDateView(delegate:self, identity: "time", tipStr: "", datePickerMode: .date)
		datePicker.backDateFormatStr = .DATE_TIME
	}
	
	func getDateWithDateSelectManager(dataView: DateSelectManager, resultDateString: String) {
		
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
