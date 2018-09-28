//
//  EnumConstant.swift
//  swift4Demo
//
//  Created by 命运 on 9/26/18.
//  Copyright © 2018 com.org.shunshiwei. All rights reserved.
//

import Foundation

enum LanguageType:Int{
	case cn
	case es
}

//时间

enum DateformatStr: String {
	case DATE_TIME_NO_SECOND = "yyyy-MM-dd HH:mm"
	case DATE_TIME = "yyyy-MM-dd HH:mm:ss"
	case DATE_NO_TIME = "yyyy-MM-dd"
	case DATE_TIME_NOTICE = "yyyyMMddHHmmss"
	case DATE_TIME_CHINA = "MM月dd日 HH:mm"
	case YEAR_DATE_TIME_CHINA = "yyyy年MM月dd日 HH:mm"
	case MONTH_DAY_CHINA  = "MM月dd日"
	case DATE_TIME_ONLY = "HH:mm"
	case YEAR_AND_MONTH = "yyyy-MM"
}
