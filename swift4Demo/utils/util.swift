//
//  util.swift
//  swift4Demo
//
//  Created by 命运 on 9/28/18.
//  Copyright © 2018 com.org.shunshiwei. All rights reserved.
//

import Foundation


/// 获取当前的语言版本
///
/// - Returns: 语言字符串 "zh-Hans-CN"
func getPreferredLanguage() -> String {
	let def = UserDefaults.standard
	let languages = def.object(forKey: "AppleLanguages") as! Array<Any>
	let preferredLang = languages[0]
	return preferredLang as! String
}
