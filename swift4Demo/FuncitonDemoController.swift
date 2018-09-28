//
//  FuncitonDemoController.swift
//  swift 基础
//
//  Created by 命运 on 2018/8/8.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class FuncitonDemoController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "函数";
		funcdemo();
		//函数类型
		funcTypeDemo();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	//MARK: ========函数demo ===========
	func funcdemo(){
		
		let number = getSumofNumbers(appleNmuber: 1, orangNumber: 3, pearNumber: 5);
		print(number);
		
		print(sumOf(numbers: 1,2,3,4));
		
		print(sumOf());
		
		let numbers = [20,40,12,16];
		
		print(hasAnyMatchs(list: numbers, condition: lessThanTen));
		
		//因为元组的成员值已被命名，因此可以通过 . 语法来检索找到的最小值与最大值
		//使用！来解包
		let bounds = minMax(array: [8,-6,2,109,3,71]);
		if (bounds != nil) {
			print("最大值\(bounds!.max),最小值为\(bounds!.min)");
		}
		
		//调用 带标签的函数
		let backStr = someFunction(argumentLabel: "唐", hometoen: "成都");
		print(backStr);
		
		//调用忽略参数的情况
		someFunction(1, secondParameterName: 3);
		
		
		someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault = 6
		someFunction(parameterWithoutDefault: 4) // parameterWithDefault = 12
		
	}
	
	
	//带多参数和返回值的函数
	func getSumofNumbers(appleNmuber:Int,orangNumber:Int,pearNumber:Int) -> Int{
		return appleNmuber + orangNumber + pearNumber;
	}
	
	//带参数，多重返回值  获取最大值和最小值  用元组(tuple)类型让多个值作为一个复合值从函数中返回
	//为了安全地处理这个“空数组”问题，将 minMax(array:) 函数改写为使用可选元组返回类型，并且当数组为空 时返回 nil  返回值为一个推断类型
	func minMax (array:[Int]) ->(min:Int,max:Int)?{
		
		//判断数组是否为空
		if array.isEmpty {
			return nil;
		}
		
		var currentMin = array[0];
		var currentMax = array[0];
		for value in array[1..<array.count]{
			if value < currentMin{
				currentMin = value;
			}else if value > currentMax{
				currentMax = value;
			}
		}
		
		return (currentMin,currentMax);
	}
	
	//可变参数和返回值的函数
	
	func sumOf(numbers:Int...) -> Int{
		
		var num = 0;
		
		for number in numbers{
			num += number;
		}
		
		return num;
	}
	
	//函数嵌套
	func sumOf() -> Int{
		let firstNumber = 3;
		let secondNumber = 6;
		var sum = 0;
		
		func add(){
			sum = firstNumber + secondNumber;
		}
		
		add();
		return sum;
	}
	
	//函数作为参数传入一个函数中
	
	func hasAnyMatchs(list:[Int],condition:(Int) ->Bool) ->Bool{
		
		for item in list{
			if condition(item){
				return true;
			}
		}
		return false;
	}
	
	//检查是否有小于10的值
	func lessThanTen(number:Int) -> Bool{
		return number < 10;
	}
	
	//指定带参数标签
	func someFunction(argumentLabel parameterName:String,hometoen:String) -> String{
		//在函数体内，parameterName代表地参数值
		return "hello \(parameterName)! glad you visit from\(hometoen) ";
	}
	
	//忽略参数标签
	func someFunction(_ firstParameterName:Int,secondParameterName:Int){
		print("参数一:\(firstParameterName),参数二:\(secondParameterName)");
	}
	
	//带默认值的函数
	
	func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
		// 如果你在调用时候不传第二个参数，parameterWithDefault 会值为 12 传入到函数体中。
	}
	
	
	//MARK: ========funcTypeDemo=======
	func funcTypeDemo(){
		//解释：定义一个叫做mathFunction 的变量，类型是”一个有两个   型的参数并返回一个 型的值的函数“，并让这个新变量指向”addTwoInts“函数
		let mathFunction:(Int,Int) ->Int = addTwoInts;
		print("result:\(mathFunction(2,3))");
		
		//函数类型作为参数类型
		printMathResult(multiplyTwoInts, 4, 10);
		
		let currentValue = 3
		//得到函数stepForward或stepBackward
		let moveNearerToZero = chooseStepFunciton(backWard: currentValue > 0);
		print(moveNearerToZero(4));
		
	}
	
	func addTwoInts(_ a: Int, _ b: Int) -> Int {
		return a + b
	}
	func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
		return a * b
		
	}
	
	//你可以用 (Int, Int) -> Int 这样的函数类型作为另一个函数的参数类型。这样你可以将函数的一部分实现留给 函数的调用者来提供
	func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
		print("Result: \(mathFunction(a, b))")
	}
	
	
	func stepForward(_ input: Int) -> Int {
		return input + 1
	}
	func stepBackward(_ input: Int) -> Int {
		return input - 1
	}
	
	//返回值是一个函数
	func chooseStepFunciton(backWard:Bool) ->(Int) ->Int{
		return backWard ? stepBackward : stepForward;
	}
	
	class func getRandomNum() -> NSInteger {
		
		let randomNum = NSInteger(arc4random()%365) + 1;
		print("randomNum = ",randomNum,"?");
		
		return randomNum;
	}

	
	//函数的嵌套
	func chooseStepFunciton2(backWard:Bool) ->(Int) ->Int{
		
		func stepForward(_ input: Int) -> Int {
			return input + 1
		}
		func stepBackward(_ input: Int) -> Int {
			return input - 1
		}
		
		return backWard ? stepBackward : stepForward;
	}


}
