//
//  SingletonViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/10.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class SingletonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationItem.title = "单例";
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//写法一，类常量，建议使用  支持懒加载，线程安全
class Singleton {
	var name : String = "唐"
	var age : u_long = 24
	static let sharedInstance = Singleton();
	//限制初始化
	private init(){}
}

//第二种，嵌套结构体变量格式

class Singleton2{
	class var sharedInstance:Singleton2{
		struct Static {
			static let instance :Singleton2 = Singleton2()
		}
		
		return Static.instance
	}
}
