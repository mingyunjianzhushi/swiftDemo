//
//  TuplesViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/14.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class TuplesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationItem.title = "元组";
		
		let http404Error = (404,"Not Found")
		
		//通过下标访问
		print(http404Error.0);
		
		//这样使用
		let (statusCode,statusMessage) = http404Error
		
		print("The status code is \(statusCode)")
		// 输出 "The status code is 404"
		print("The status message is \(statusMessage)") // 输出 "The status message is Not Found"
		
		//如果你只需要一部分元组值，分解的时候可以把要忽略的部分用下划线( _ )标记:
		let (justTheStatusCode, _) = http404Error
		print("The status code is \(justTheStatusCode)") // 输出 "The status code is 404"
		
		
		
//		你可以在定义元组的时候给单个元素命名:
		let http200Status = (statusCode: 200, description: "OK")
//		给元组中的元素命名后，你可以通过名字来获取这些元素的值:
		print("The status code is \(http200Status.statusCode)")
		// 输出 "The status code is 200"
		print("The status message is \(http200Status.description)") // 输出 "The status message is OK"
    }

}
