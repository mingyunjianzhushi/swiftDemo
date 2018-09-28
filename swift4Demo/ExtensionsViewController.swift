//
//  ExtensionsViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/17.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class ExtensionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		let oneInch = 25.4.mm
		print("One inch is \(oneInch) meters")
		// 打印 “One inch is 0.0254 meters”
		let threeFeet = 3.ft
		print("Three feet is \(threeFeet) meters")
		// 打印 “Three feet is 0.914399970739201 meters”
		
		let aMarathon = 42.km + 195.m
		print("A marathon is \(aMarathon) meters long") // 打印 “A marathon is 42195.0 meters long”
		
		
		let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
							  size: Size(width: 3.0, height: 3.0))
		// centerRect 的原点是 (2.5, 2.5)，大小是 (3.0, 3.0)
		
		3.repetitions {
			print("Hello")
		}
		
		var someInt = 3
		print(someInt.square())
		//someInt 的值现在为9
		
		print(746381295[1])//查询指定位置的数字
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



class SomeType{
	
}

//可以通过扩展来扩展一个已有类型，使其采纳一个或多个协议。在这种情况下，无论是类还是结构体，协议名字
//的书写方式完全一样

extension SomeType{
	//为SomeType添加新功能在这里
	
}

extension Double {
	var km: Double { return self * 1_000.0 }
	var m : Double { return self }
	var cm: Double { return self / 100.0 }
	var mm: Double { return self / 1_000.0 }
	var ft: Double { return self / 3.28084 }
}

//你可以提供一个额外的接受指定中心点和大小的构造器来扩展 Rect 结构体
extension Rect {
	init(center: Point, size: Size) {
		let originX = center.x - (size.width / 2)
		let originY = center.y - (size.height / 2)
		self.init(origin: Point(x: originX, y: originY), size: size)
	}
	
}

///扩展可以为已有类型添加新的实例方法和类型方法。下面的例子为 Int 类型添加了一个名为 repetitions 的 实例方法
extension Int {
	func repetitions(task: () -> Void) {
		for _ in 0..<self {
			task()
		} }
}

extension Int{
	mutating func square(){
		self = self * self
	}
}

//扩展可以为已有类型添加新下标。这个例子为 Swift 内建类型 Int 添加了一个整型下标。该下标 [n] 返回
//十进制数字从右向左数的第 n 个数字

extension Int{
	subscript(digitIndex:Int) ->Int{
		var decimalBase = 1
		for _ in 0..<digitIndex{
			decimalBase *= 10
		}
		
		return (self/decimalBase) % 10
	}
}




