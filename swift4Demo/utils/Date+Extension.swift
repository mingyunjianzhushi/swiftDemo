//
//  Date+Extension.swift
//  swift4Demo
//
//  Created by 命运 on 9/28/18.
//  Copyright © 2018 com.org.shunshiwei. All rights reserved.
//

import Foundation
//时间格式
let DATE_TIME_NO_SECOND = "yyyy-MM-dd HH:mm"
let DATE_TIME = "yyyy-MM-dd HH:mm:ss"
let DATE_NO_TIME = "yyyy-MM-dd"
let DATE_TIME_NOTICE = "yyyyMMddHHmmss"
let DATE_TIME_CHINA = "MM月dd日 HH:mm"
let YEAR_DATE_TIME_CHINA = "yyyy年MM月dd日 HH:mm"
let MONTH_DAY_CHINA  = "MM月dd日"
let MONTH_DAY  = "MM-dd"
let DATE_TIME_ONLY = "HH:mm"
let YEAR_AND_MONTH = "yyyy-MM"
let week = "cccc"

extension Date {
	
	static func getDate(dateStr: String, format: String) -> Date? {
		
		let dateFormatter = DateFormatter()
		dateFormatter.locale = Locale.current
		dateFormatter.timeZone = TimeZone.current
		dateFormatter.dateFormat = format
		
		let date = dateFormatter.date(from: dateStr)
		return date
	}
	
	func getComponent(component: Calendar.Component) -> Int {
		let calendar = Calendar.current
		return calendar.component(component, from: self)
	}
	
	//按照格式转化时间
	func getString(format: String) -> String {
		
		let dateFormatter = DateFormatter()
		dateFormatter.locale = Locale.current
		dateFormatter.timeZone = TimeZone.current
		dateFormatter.dateFormat = format
		
		let dateString = dateFormatter.string(from: self)
		return dateString
	}
	
	/**
	*  是否为今天
	*/
	func isToday() -> Bool{
		let calendar = Calendar.current
		let unit: Set<Calendar.Component> = [.day,.month,.year]
		let nowComps = calendar.dateComponents(unit, from: Date())
		let selfCmps = calendar.dateComponents(unit, from: self)
		
		return (selfCmps.year == nowComps.year) &&
			(selfCmps.month == nowComps.month) &&
			(selfCmps.day == nowComps.day)
		
	}
	
	/**
	*  是否为昨天
	*/
	func isYesterday() -> Bool {
		let calendar = Calendar.current
		let unit: Set<Calendar.Component> = [.day,.month,.year]
		let nowComps = calendar.dateComponents(unit, from: Date())
		let selfCmps = calendar.dateComponents(unit, from: self)
		if selfCmps.day == nil || nowComps.day == nil {
			return false
		}
		let count = nowComps.day! - selfCmps.day!
		return (selfCmps.year == nowComps.year) &&
			(selfCmps.month == nowComps.month) &&
			(count == 1)
	}
	
	///只有年月日的字符串
	func dataWithYMD() -> String {
		let fmt = DateFormatter()
		fmt.dateFormat = "yyyy-MM-dd"
		let selfStr = fmt.string(from: self)
		let result = fmt.date(from: selfStr)!
		print(result)
		return selfStr
	}
	
	///获取当前年月日的时间戳
	func timeIntervalWithYMDDate() -> TimeInterval {
		let fmt = DateFormatter()
		fmt.dateFormat = "yyyy-MM-dd"
		let selfStr = fmt.string(from: self)
		let result = fmt.date(from: selfStr)!
		return result.timeIntervalSinceReferenceDate + 24 * 60 * 60
	}
	/**
	*  是否为今年
	*/
	func isThisYear() -> Bool {
		let calendar = Calendar.current
		let nowCmps = calendar.dateComponents([.year], from: Date())
		let selfCmps = calendar.dateComponents([.year], from: self)
		let result = nowCmps.year == selfCmps.year
		return result
	}
	/**
	*  获得与当前时间的差距
	*/
	func deltaWithNow() -> DateComponents{
		let calendar = Calendar.current
		let cmps = calendar.dateComponents([.hour,.minute,.second], from: self, to: Date())
		return cmps
	}

//含有上午和下午的时间格式化
	func shortTimeTextOfDate() -> String {
		let date = self
//		var interval = date.timeIntervalSince(Date())
//		interval = -interval
		if date.isToday() {
			let dateFormat = DateFormatter()
			dateFormat.dateFormat = "aHH:mm"
			dateFormat.amSymbol = "上午"
			dateFormat.pmSymbol = "下午"
			let dateString = dateFormat.string(from: date)
			return dateString
		}else if date.isYesterday(){
			return "昨天"
		}else{
			if date.isThisYear(){
				return date.getString(format: MONTH_DAY)
			}else{
				return date.getString(format: "yy-MM-dd")
			}
		}
	}
	
	
	//含有今天和昨天的时间格式化
	func shortTimeTextOfDateOfRemoveToday() -> String {
		let date = self
//		var interval = date.timeIntervalSince(Date())
//		interval = -interval
		if date.isToday() {
			return "今天"
		}else if date.isYesterday(){
			return "昨天"
		}else{
			if date.isThisYear(){
				return date.getString(format: MONTH_DAY)
			}else{
				return date.getString(format: "yy-MM-dd")
			}
		}
	}
	
}


/// 获取网络时间
///
/// - Parameter finished: 返回当前时间
func getInterDate(finished:@escaping (Date?) -> ()){
	var urlString = "http://web.babyscloud.com"
	urlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
	let url = URL(string: urlString)!
	var request = URLRequest(url: url)
	request.cachePolicy = .reloadIgnoringCacheData
	request.timeoutInterval = 10
	request.httpShouldHandleCookies = false
	request.httpMethod = "GET"
	
	let task1 = URLSession.shared.dataTask(with: request) { (data, res, err) in
		
	}
	
	task1.resume()
	
	let task = URLSession(configuration: URLSessionConfiguration.default).dataTask(with: url) { (data, response, error) in
		if let httpresponse = response as? HTTPURLResponse {
			
			let tempDateString = (httpresponse.allHeaderFields["Date"] as? String)!
			
			let index1 = tempDateString.index(tempDateString.startIndex, offsetBy: 5)   //获取索引
			let index2 = tempDateString.index(tempDateString.endIndex, offsetBy: -4)
			let dateStr = tempDateString[index1..<index2]
			
			let datefmt = DateFormatter()
			datefmt.locale = Locale(identifier: "en_US")
			datefmt.dateFormat = "dd MMM yyyy HH:mm:ss"
			
			let date = datefmt.date(from: String(dateStr))?.addingTimeInterval(60*60*8)
			let zone = NSTimeZone.system
			let inter = zone.secondsFromGMT(for: date!)
			let locadate = date?.addingTimeInterval(TimeInterval(inter))
			finished(locadate)
		}else{
			finished(nil)
		}
		
	}
	
	task.resume()
}
