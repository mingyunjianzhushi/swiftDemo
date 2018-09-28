//
//  BaseClassViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/17.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class BaseClassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationItem.title = "继承"
		let someVehicle = Vehicle()
		someVehicle.currentSpeed = 12.0
		print(someVehicle.description)
		
		//新建一辆自行车
		let bicyle = Bicyle()
		bicyle.hasBasket = true
		bicyle.currentSpeed = 15.0
		print("bicyle:\(bicyle.description)")
		
		//创建一辆双人自行车
		let tandem = Tandem()
		tandem.hasBasket = true
		tandem.currentNumberOfPassengers = 2
		tandem.currentSpeed = 22
		print("tandem:\(tandem.description)")
		
		
		
		let car = Car()
		car.currentSpeed = 25.0
		car.gear = 3
		print("Car: \(car.description)")
		// 打印 "Car: traveling at 25.0 miles per hour in gear 3"
		
		
		let automatic = AutomaticCar()
		automatic.currentSpeed = 35.0
		print("AutomaticCar: \(automatic.description)")
		// 打印 "AutomaticCar: traveling at 35.0 miles per hour in gear 4"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
		
		func demo(){
			
		}
        // Dispose of any resources that can be recreated.
    }

}

class Vehicle{
	var numberOfWheels = 0
	 var currentSpeed = 0.0 //final如果加final，则不能被重写
	var name:String?
	
	//这种是计算属性
	var description: String {
		return "traveling at \(currentSpeed) miles per hour"
	}
	func makeNoise() {
		// 什么也不做-因为车辆不一定会有噪音
	}
}

//子类继承与Vehicle
class Bicyle : Vehicle{
	//是否有篮子，默认没有
	var hasBasket = false
	
	override init() {
		super.init()
		numberOfWheels = 2
	}
}
//这是双人自行车
class Tandem: Bicyle {
	//乘坐人数
	var currentNumberOfPassengers = 0
}

//重写父类
class train: Vehicle {
	
	override func makeNoise() {
		print("Choo Choo")
	}
}

//重写父类的属性
class Car: Vehicle {
	var gear = 1
	override var name: String?{
		didSet{
			
		}
	}
	
	override var description: String{
		return super.description + "in gear \(gear)"
	}
}

class AutomaticCar:Car{
	override var currentSpeed: Double{
		didSet{
			gear = Int(currentSpeed / 10.0) + 1
		}
	}
}






