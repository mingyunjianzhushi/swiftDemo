//
//  PropertyViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/16.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class PropertyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "属性"
        // Do any additional setup after loading the view.
		
		let manager = DataManager()
		manager.data.append("Some data")
		manager.data.append("Some more data")
		print(manager.importer.fileName)
		
		//只读demo
		let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
//		fourByFiveByTwo.volume = 12  只读的
		print(fourByFiveByTwo.volume)
		// 打印 "the volume of fourByFiveByTwo is 40.0"
		
		
		//重写set方法
		let stepCounter = StepCounter()
		stepCounter.totalSteps = 200
		// About to set totalSteps to 200
		// Added 200 steps
		stepCounter.totalSteps = 360
		// About to set totalSteps to 360
		// Added 160 steps
		stepCounter.totalSteps = 896
		// About to set totalSteps to 896
		// Added 536 steps
    }
	
	/*
	个存储属性就是存储在特定类或结构体实例里的一个常量或变量。存储属性可以是变量存储属
	性(用关键字 var 定义)，也可以是常量存储属性(用关键字 let 定义)
	*/
	
	//
	func demo1(){
		struct FixedLengthRang{
			var firstValue:Int
			let length:Int
		}
		
		var rangeOfThreeItems = FixedLengthRang(firstValue: 0, length: 3)
		//表示一个区间的数
		print(rangeOfThreeItems.firstValue)
		rangeOfThreeItems.firstValue = 6
//		rangeOfThreeItems.length = 4   不能修改
		//length 在创建实例的时候被初始化，因为它是一个常量存储属性，所以之后无法修改它 的值
		
		
//		如果创建了一个结构体的实例并将其赋值给一个常量，则无法修改该实例的任何属性，即使有属性被声明为变量也不行
		
		let rangeOfFourItems = FixedLengthRang(firstValue: 3, length: 3)
		//不能修改变量属性，会报错
//		rangeOfFourItems.firstValue = 4
		
		
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

class DataImporter{
	/*
	DataImporter 是一个负责将外部文件中的数据导入的类。 这个类的初始化会消耗不少时间。
	*/
	var fileName = "data.txt"
}

class DataManager{
	//懒加载
	lazy var importer = DataImporter()
	var data = [String]()
	//这里会提供数据管理功能
}

struct Point {
	var x = 0.0, y = 0.0
}
struct Size {
	var width = 0.0, height = 0.0
}
struct Rect {
	var origin = Point()
	var size = Size()
	var center: Point {
		get {
			let centerX = origin.x + (size.width / 2)
			let centerY = origin.y + (size.height / 2)
			return Point(x: centerX, y: centerY)
		}
		set(newCenter) {
			origin.x = newCenter.x - (size.width / 2)
			origin.y = newCenter.y - (size.height / 2)
		}
	} }

struct AlternativeRect {
	var origin = Point()
	var size = Size()
	var center: Point {
		get {
			let centerX = origin.x + (size.width / 2)
			let centerY = origin.y + (size.height / 2)
			return Point(x: centerX, y: centerY)
		}
		set {
			origin.x = newValue.x - (size.width / 2)
			origin.y = newValue.y - (size.height / 2)
		}
	}
}

//只读属性

/*
只有 getter 没有 setter 的计算属性就是只读计算属性。只读计算属性总是返回一个值，可以通过点运算符访 问，但不能设置新的值。
注意
必须使用 var 关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。let 关键字只用来声明 常量属性，表示初始化后再也无法修改的值。
只读计算属性的声明可以去掉 get 关键字和花括号
*/

struct Cuboid {
	var width = 0.0, height = 0.0, depth = 0.0
	//这是只读属性
	var volume: Double {
		return width * height * depth
	}
}

class StepCounter{
	var totalSteps:Int = 0 {
		willSet(newTotalSteps) {
			print("About to set totalSteps to \(newTotalSteps)")
		}
		didSet {
			if totalSteps > oldValue  {
				print("Added \(totalSteps - oldValue) steps")
			}
			
		}
	}
}

struct SomeStructure {
	static var storedTypeProperty = "Some value."
	static var computedTypeProperty: Int {
		return 1 }
}
enum SomeEnumeration {
	static var storedTypeProperty = "Some value."
	static var computedTypeProperty: Int {
		return 6 }
}
class SomeClass {
	static var storedTypeProperty = "Some value."
	static var computedTypeProperty: Int {
		return 27 }
	class var overrideableComputedTypeProperty: Int {
		return 107
	} }






















