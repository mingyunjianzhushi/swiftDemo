//
//  Time.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/15.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import Foundation

extension DispatchTime: ExpressibleByIntegerLiteral {
	public init(integerLiteral value: Int) {
		self = DispatchTime.now() + .seconds(value)
	}
}
extension DispatchTime: ExpressibleByFloatLiteral {
	public init(floatLiteral value: Double) {
		self = DispatchTime.now() + .milliseconds(Int(value * 1000))
	}
}
