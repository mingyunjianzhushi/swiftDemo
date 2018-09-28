//
//  MethodViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/16.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class MethodViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       let counter = Counter()
		counter.increment()
		print(counter.count)
		counter.increment(by: 2)
		print(counter.count)
		
		
		var somePoint = Point2(x: 4.0, y: 5.0)
		if somePoint.isToTheRightOfX(x: 1.0) {
			print("This point is to the right of the line where x == 1.0")
		}
		// 打印 "This point is to the right of the line where x == 1.0"
		
		
		somePoint.moveByX(deltaX: 2.0, y: 3.0)
		print("The point is now at (\(somePoint.x), \(somePoint.y))") // 打印 "The point is now at (3.0, 4.0)"
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

struct Point2 {
	var x = 0.0,y = 0.0
	func isToTheRightOfX(x: Double) -> Bool {
//		self.x += x  不能修改
		return self.x > x
	}
	
	// mutating 关键字用来标记一个会修改结构体的方法  实现协议中的 mutating 方法时，若是类类型，则不用写 mutating 关键字。而对于结构体和枚举，则必须写
//	mutating 关键字
	mutating func moveByX(deltaX:Double,y deltaY:Double){
		x += deltaX
		y += deltaY
	}
}

class Counter{
	var count = 0
	func increment(){
		count += 1
	}
	
	func increment(by amount:Int){
		count += amount
	}
	
	func rest(){
		count = 0
	}
}
