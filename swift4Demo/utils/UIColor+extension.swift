//
//  UIColor+extension.swift
//  swift4Demo
//
//  Created by 命运 on 9/21/18.
//  Copyright © 2018 com.org.shunshiwei. All rights reserved.
//

import UIKit

/// 样式  0x5B5B5B
///
/// - Parameters:
///   - color_vaule: 传入0x5B5B5B格式的字符串
///   - alpha: 传入透明度
/// - Returns: 颜色
func UIColorFromRGB(color_vaule : UInt64 , alpha : CGFloat = 1) -> UIColor {
	print(color_vaule)
	let redValue = CGFloat((color_vaule & 0xFF0000) >> 16)/255.0
	let greenValue = CGFloat((color_vaule & 0xFF00) >> 8)/255.0
	let blueValue = CGFloat(color_vaule & 0xFF)/255.0
	return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alpha)
}

/// 样式  0x5B5B5B
///
/// - Parameters:
///   - color_vaule: 传入0x5B5B5B格式的字符串
///   - alpha: 传入透明度
/// - Returns: 颜色
//func UIColorFromRGB(color_vaule : Int ) -> UIColor {
//	print(color_vaule)
//	let redValue = CGFloat((color_vaule & 0xFF0000) >> 16)/255.0
//	let greenValue = CGFloat((color_vaule & 0xFF00) >> 16)/255.0
//	let blueValue = CGFloat((color_vaule & 0xFF) >> 16)/255.0
//	return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
//}


/// 样式 #5B5B5B
///
/// - Parameters:
///   - color_vaule: 传入#5B5B5B格式的字符串
///   - alpha: 传入透明度
/// - Returns: 颜色
func UIColorFromRGB(color_vaule : String , alpha : CGFloat = 1) -> UIColor {
	
	if color_vaule.isEmpty {
		return UIColor.clear
	}
	
	var cString = color_vaule.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
	
	if cString.count == 0 {
		return UIColor.clear
	}
	
	if cString.hasPrefix("#") {
		cString.remove(at: cString.startIndex)
	}
	
	if cString.count < 6 && cString.count != 6 {
		
		return UIColor.clear
	}
	
	let value = "0x\(cString)"
	
	let scanner = Scanner(string:value)
	
	var hexValue : UInt64 = 0
	//查找16进制是否存在
	if scanner.scanHexInt64(&hexValue) {
		print(hexValue)
		return UIColorFromRGB(color_vaule: hexValue, alpha: alpha)
	}else{
		return UIColor.clear
	}
	
	
}
