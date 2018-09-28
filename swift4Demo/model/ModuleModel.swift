//
//  ModuleModel.swift
//  swift 基础
//
//  Created by 命运 on 2018/8/8.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

//使用HandyJSON
class ModuleModel: NSObject,HandyJSON {
	//模块名字  带？可以赋值为nil
	var name:String?
	//控制器名字
	var controllerName:String?
	
	required override init(){}
	
	func getNames() ->[String]{
		let propertyNames = self.getPropertyNames();
		return propertyNames;
	}
	
	
	func getPropertyNames() -> ([String]){
		
		var outCount:UInt32
		
		outCount = 0
		
		let propers = class_copyPropertyList(self.classForCoder, &outCount)!
		
		
		
		let count:Int = Int(outCount);
		
		print("共有\(outCount)个")
		var propertyArray = [String]()
		for i in 0...(count-1) {
			
			let aPro: objc_property_t = propers[i]
			
			let proName:String! = String.init(utf8String: property_getName(aPro))
			
			propertyArray.append(proName)
		}
		return propertyArray
	}
	
//	override internal var description: String {
//		return "name: \(name) \n icon:\(controllerName) \n"
//	}
	

}

