//
//  ProtocolViewController.swift
//  swift4Demo
//
//  Created by 命运 on 9/10/18.
//  Copyright © 2018 com.org.shunshiwei. All rights reserved.
//

import UIKit

protocol btnClickDelegate {
	func changeString(newString:String)
}

class ProtocolViewController: UIViewController {
	var str : String?
	var delegate:btnClickDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
		print(str)
		let btn = UIButton(type: .custom);
		btn.backgroundColor = UIColor.gray;
		btn.setTitle("点击回调", for: .normal);
		btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside);
		self.view.addSubview(btn);
		btn.snp.makeConstraints { (make) in
			make.top.equalTo(self.view.snp.top).offset(40);
			make.left.equalTo(self.view.snp.left).offset(40);
			make.width.equalTo(200);
			make.height.equalTo(50);
		}
		
		
		let btn2 = UIButton(type: .custom);
		btn2.backgroundColor = UIColor.gray;
		btn2.setTitle("点击通知回调", for: .normal);
		btn2.addTarget(self, action: #selector(btnClick2), for: .touchUpInside);
		self.view.addSubview(btn2);
		btn2.snp.makeConstraints { (make) in
			make.top.equalTo(btn.snp.bottom).offset(40);
			make.left.equalTo(self.view.snp.left).offset(40);
			make.width.equalTo(200);
			make.height.equalTo(50);
		}

		self.title = "通知和协议回调"
    }
	
	@objc func btnClick(){
		if self.delegate != nil  {
			self.delegate?.changeString(newString: "这是回传的值")
		}
	}
	
	@objc func btnClick2(){
		NotificationCenter.default.post(name: NSNotification.Name(rawValue: "changeItem"), object: nil, userInfo: ["data":"这是什么呀"])
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

//class someTwoClass:SomeProtocol  {
//	required init(someParameter: Int) {
//		//这是构造器的实现部分
//	}
//}

protocol SomeProtocol {
//	init(someParameter : Int)
	init()
}

class SomeSuperClass {
	init() {
		// 这里是构造器的实现部分
	}
}

class SomeSubClass: SomeSuperClass, SomeProtocol { // 因为遵循协议，需要加上 required
		// 因为继承自父类，需要加上 override
		required override init() {
			// 这里是构造器的实现部分
	}
}
