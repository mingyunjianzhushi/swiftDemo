//
//  String+extension.swift
//  swift4Demo
//
//  Created by 命运 on 9/21/18.
//  Copyright © 2018 com.org.shunshiwei. All rights reserved.
//

import UIKit

extension String{

	
	/*
	*去掉首尾空格
	*/
	var removeHeadAndTailSpace:String{
		let whitespace = NSCharacterSet.whitespaces
		return self.trimmingCharacters(in: whitespace)
	}
	
	/*
	*去掉首尾空格 包括后面的换行 \n
	*/
	var removeHeadAndTailSpacePro:String {
		let whitespace = NSCharacterSet.whitespacesAndNewlines
		return self.trimmingCharacters(in: whitespace)
	}
	/*
	*去掉所有空格
	*/
	var removeAllSapce: String {
		return self.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
	}
	/*
	*去掉首尾空格 后 指定开头空格数
	*/
	func beginSpaceNum(num: Int) -> String {
		var beginSpace = ""
		for _ in 0..<num {
			beginSpace += " "
		}
		return beginSpace + self.removeHeadAndTailSpacePro
	}
	
	/*
	*url编码
	*/
	
	
	var  URLCoding : String{
		return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
	}
	
	func getHeight(width:CGFloat,font:UIFont)->CGFloat{
		let size = CGSize(width: width, height: CGFloat(MAXFLOAT))
		let rect = NSString(string: self).boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font : font], context: nil)
		return rect.size.height
	}
	func getWidth(height:CGFloat,font:UIFont)->CGFloat{
		let size = CGSize(width: CGFloat(MAXFLOAT), height: height)
		let rect = NSString(string: self).boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font : font], context: nil)
		return rect.size.width
	}
	func mutableAttributedString(attrs:[[String:Any]])->NSMutableAttributedString{
		let attrStr = NSMutableAttributedString(string: self)
		
		for attr in attrs {
			guard let range = attr["range"] as? NSRange  else{
				continue
			}
			if range.lowerBound < 0 && range.upperBound > count{
				continue
			}
			
			if let color = attr["color"]{
				attrStr.addAttributes([NSAttributedStringKey.foregroundColor : color], range: range)
			}
			if let font = attr["font"]{
				attrStr.addAttributes([NSAttributedStringKey.font : font], range: range)
			}
		}
		return attrStr
	}
	///加删除线
	func strikethroughStr(font:UIFont,textColor:UIColor,strikethroughColor:UIColor) -> NSMutableAttributedString {
		let attr = NSMutableAttributedString(string: self)
		attr.addAttributes([NSAttributedStringKey.font : font,NSAttributedStringKey.foregroundColor:textColor,NSAttributedStringKey.strikethroughColor:strikethroughColor,NSAttributedStringKey.strikethroughStyle:1], range: NSMakeRange(0, self.count))
		return attr
	}
	///MD5加密
//	func MD5()->String?{
//		guard let data = self.data(using: String.Encoding.utf8) else {
//			return nil
//		}
////		let str = data.md5().toHexString()
//		return str
//	}
	///是否是邮箱
	func isEmail()->Bool{
		let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
		let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
		return emailTest.evaluate(with: self, substitutionVariables: nil)
	}
	///获取时间差,如果大于当前时间返回true
	func compareTwoTime() -> Bool {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
		let startTime = dateFormatter.date(from: self)!
		let date1 = Date(timeInterval: 14*24*60*60, since: startTime)
		let date2 = Date()
		return date2.compare(date1) == .orderedAscending
	}
	
//	func subStr(fromIndex:Int)->String{
//		let start = self.index(self.startIndex, offsetBy: fromIndex)
//		return String(self.suffix(from: start))
//	}
//	func subStr(toIndex:Int)->String{
//		let end = self.index(self.startIndex, offsetBy: toIndex)
//		return String(self.prefix(upTo: end))
//	}
}
