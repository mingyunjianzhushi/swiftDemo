//
//  UtilsViewController.swift
//  swift4Demo
//
//  Created by 命运 on 9/26/18.
//  Copyright © 2018 com.org.shunshiwei. All rights reserved.
//

import UIKit

class UtilsViewController: UIViewController , DateSelectManagerDelegate{
	
	deinit {
		print("死啦")
	}

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
		
		//获取网络时间
		getInterDate { (date) in
			print(date!)
		}
		
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
		datePicker.backDateFormatStr = MONTH_DAY_CHINA
	}
	
	//时间选择器回调
	func getDateWithDateSelectManager(dataView: DateSelectManager, resultDateString: String) {
		print(resultDateString)
	}

}

//交换方法

extension UIViewController{
	public class func initializeMethod() {
		
		let originalSelector = #selector(UIViewController.viewDidAppear(_:))
		let swizzledSelector = #selector(UIViewController.myMethod(animated:))
		
		let originalMethod = class_getInstanceMethod(self, originalSelector)
		let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
		
		
		//在进行 Swizzling 的时候,需要用 class_addMethod 先进行判断一下原有类中是否有要替换方法的实现
		let didAddMethod: Bool = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!))
		//如果 class_addMethod 返回 yes,说明当前类中没有要替换方法的实现,所以需要在父类中查找,这时候就用到 method_getImplemetation 去获取 class_getInstanceMethod 里面的方法实现,然后再进行 class_replaceMethod 来实现 Swizzing
		
		if didAddMethod {
			class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
		} else {
			method_exchangeImplementations(originalMethod!, swizzledMethod!)
		}
		
		
	}
	
	@objc func myMethod(animated: Bool) {
		self.myMethod(animated: animated)
	}
}
