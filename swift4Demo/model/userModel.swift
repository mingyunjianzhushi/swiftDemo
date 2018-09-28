//
//  userModel.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/13.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class userModel: NSObject {
	var name:String?
	var age:Int?
	
	//定义类方法
	class func	UserInfo(name:String,age:Int) ->userModel{
		let user = userModel();
		user.name = name
		user.age = age
		
		return user;
	}
}
