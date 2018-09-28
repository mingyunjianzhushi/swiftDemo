//
//  UILabel+extension.swift
//  swift4Demo
//
//  Created by 命运 on 9/25/18.
//  Copyright © 2018 com.org.shunshiwei. All rights reserved.
//

import UIKit

extension UILabel{
	 /// 创建便利初始化方法
	convenience init(text: String,fontSize : CGFloat,TextAlignment:NSTextAlignment,textColor:UIColor){
		self.init()
		self.text = text
		self.font = UIFont.systemFont(ofSize: fontSize)
		self.textAlignment = TextAlignment
		self.textColor = textColor
	}
}
