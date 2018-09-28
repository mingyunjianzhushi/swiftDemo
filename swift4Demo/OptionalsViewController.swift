//
//  OptionalsViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/14.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class OptionalsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		demo2();
		demo3();
		
		do {
			try canThrowAnError()
			//没有错误
		} catch  {
			//有一个错误消息
		}
		
		let age = -3
		//断言  就是崩溃信息
		assert(age >= 0, "A person's age cannot be less than zero") // 因为 age < 0，所以断言会触发
		
        // Do any additional setup after loading the view.
    }
	
	//Swift 的 Int 类型有一种构造器，作用是将一个 String 值转换成一个 Int 值。然而，并 不是所有的字符串都可以转换成一个整数。字符串 "123" 可以被转换成数字 123 ，但是字符串 "hello, wor ld" 不行
	func demo1(){
		let possibleNumber = "123"
		//字符串转换为Int类型
		let convertedNumber = Int(possibleNumber);
		// convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"
		print(convertedNumber!);//需要解包，如果为空就崩溃
		
		//所以这样来取值
		if let actualNumber = Int(possibleNumber) {
			 print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
		}else{
			 print("\'\(possibleNumber)\' could not be converted to an integer")
		}
		
		/*
		
		“如果 Int(possibleNumber) 返回的可选 Int 包含一个值，创建一个叫做 actualNumber 的新常量并将可选 包含的值赋给它。”
		如果转换成功， actualNumber 常量可以在 if 语句的第一个分支中使用。它已经被可选类型 包含的 值初始化 过，所以不需要再使用 ! 后缀来获取它的值。在这个例子中，actualNumber 只被用来输出转换结果。
		你可以在可选绑定中使用常量和变量。如果你想在if语句的第一个分支中操作 actualNumber 的值，你可以改 成 if var actualNumber ，这样可选类型包含的值就会被赋给一个变量而非常量
		*/
		
	}
	
	/*
	nil 不能用于非可选的常量和变量。如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型。
	如果你声明一个可选常量或者变量但是没有赋值，它们会自动被设置为 nil
	*/
	func demo2(){
		var serverResponseCode:Int? = 404
		//serverResponseCode 包含一个可选的Int值 404
		serverResponseCode = nil
		// serverResponseCode 现在不包含值
		
		//解包时候，需要判断是否为空
		if serverResponseCode != nil {
			print(serverResponseCode!)
		}else{
			print("空的")
		}
		
		
		var surveyAnswer: String?
		// surveyAnswer 被自动设置为 nil
		
		/*
		注意:
		Swift 的 nil 和 Objective-C 中的 nil 并不一样。在 Objective-C 中， nil 是一个指向不存在对象的指 针。在 Swift 中， nil 不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设 置为 nil ，不只是对象类型
		*/
	}
	
	
	func demo3(){
		var serverResponseCode:Int = 404
		
//		serverResponseCode = nil
		/*
		nil 不能用于非可选的常量和变量。如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成
		对应的可选类型
		*/

	}
	
	
	
	/*
	if 语句以及强制解析
	你可以使用 if 语句和 nil 比较来判断一个可选值是否包含值。你可以使用“相等”(==)或“不 等”( != )来执行比较。
	如果可选类型有值，它将不等于 nil
	*/
	
	func demo4(){
		var convertedNumber:Int?=4
		
		if convertedNumber != nil {
			print("convertedNumber contains some integer value.")
		}
		
		
	}
	
	func demo5(){
		
		/*
		你可以包含多个可选绑定或多个布尔条件在一个 if 语句中，只要使用逗号分开就行。只要有任意一个可选绑定 的值为nil，或者任意一个布尔条件为false，则整个if条件判断为false，这时你就需要使用嵌套 if 条 件语句来处理，如下所示
		*/
		
		if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100{
			print("\(firstNumber) < \(secondNumber) < 100")
	      }
	   // 输出 "4 < 42 < 100"
		if let firstNumber = Int("4") {
			if let secondNumber = Int("42") {
				if firstNumber < secondNumber && secondNumber < 100 {
					print("\(firstNumber) < \(secondNumber) < 100")
				} }
		}
	   // 输出 "4 < 42 < 100"
    }
	
	
	/*
	有时候在程序架构中，第一次被赋值之后，可以确定一个可选类型总会有值。在这种情况下，每次都要判断和解
	析可选值是非常低效的，因为可以确定它总会有值。
	这种类型的可选状态被定义为隐式解析可选类型(implicitly unwrapped optionals)。把想要用作可选的类型 的后面的问号( String? )改成感叹号( String! )来声明一个隐式解析可选类型
	*/
	
	//下面的例子展示了可选类型 String 和隐式解析可选类型 String 之间的区别
	func demo6(){
		let possibleString:String? = "an optional string"
		let forcedString:String = possibleString!  //需要解包
		print(forcedString);
		
		let assumedString:String! = "an is ffff aaaa"
		let implicitString : String = assumedString //不需要叹号
		print(implicitString)
	}
	
	//当一个函数遇到错误条件，它能报错。调用函数的地方能抛出错误消息并合理处理
	func canThrowAnError() throws{
		// 这个函数有可能抛出错误
	
	}
	
}
