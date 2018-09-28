//
//  GenericViewController.swift
//  swift4Demo
//
//  Created by 命运 on 9/10/18.
//  Copyright © 2018 com.org.shunshiwei. All rights reserved.
//

import UIKit

class GenericViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		var someInt = 3
		var anotherInt = 107
		self.navigationItem.title = "泛型"
		swapTwoInts(a: &someInt, b: &anotherInt)
		
		print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
		// 打印 “someInt is now 107, and anotherInt is now 3”
		
		var someDouble = 3.0
		var anoterDouble = 107.0
		swapTwoDoubles(a: &someDouble, b: &anoterDouble)
		print("someDouble is now \(someDouble), and anoterDouble is now \(anoterDouble)")
		
		//使用泛型函数
		var someString = "这是我"
		var anoterString = "这是你"
		swapTwoValues(a: &someString, b: &anoterString)
		print("someString is now \(someString), and anoterString is now \(anoterString)")
		
		// 针对String类型
		let newString = self.addTwo(a: "第一段字符", b: "第二段字符") { (a, b) -> String in
			return a+b
		}
		print(newString)
		
		
		var stackOfStrings = Stack<String>()
		stackOfStrings.push(item: "uno")
		stackOfStrings.push(item: "dos")
		stackOfStrings.push(item: "tres")
		stackOfStrings.push(item: "cuatro")
		
		if let topItem = stackOfStrings.topItem {
			 print("The top item on the stack is \(topItem).")
		}

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	//一个标准的非泛型函数 swapTwoInts(_:_:) ，用来交换两个 Int 值
	func swapTwoInts(a: inout Int, b: inout Int) {
		let temporaryA = a
		a = b
		b = temporaryA
	}
	
	func swapTwoStrings(a: inout String, b: inout String) {
		let temporaryA = a
		a = b
		b = temporaryA
	}
	func swapTwoDoubles(a: inout Double, b: inout Double) {
		let temporaryA = a
		a = b
		b = temporaryA
	}
	
	/*
	这个函数的泛型版本使用了占位类型名(在这里用字母 T 来表示)来代替实际类型名(例如 Int、String
	或 Double )。占位类型名没有指明 T 必须是什么类型，但是它指明了 a 和 b 必须是同一类型 T ，无论 T 代表什么类型。只有 swapTwoValues(_:_:) 函数在调用时，才能根据所传入的实际类型决定 T 所代表的类
	型。
	另外一个不同之处在于这个泛型函数名( swapTwoValues(_:_:) )后面跟着占位类型名( T )，并用尖括号括起 来( <T> )。这个尖括号告诉 Swift 那个 T 是 swapTwoValues(_:_:) 函数定义内的一个占位类型名，因此 S wift 不会去查找名为 T 的实际类型。
	*/
	
	//泛型函数可以适用于任何类型，下面的 swapTwoValues(_:_:) 函数是上面三个函数的泛型版本
	func swapTwoValues<T>(a: inout T,b: inout T) {
		let temporaryA = a
		a = b
		b = temporaryA
	}
	
	
	
	func addTwo<T>(a:T,b:T,sideFun:(T,T) -> (T)) ->T{
		return sideFun(a,b)
	}
	
	//普通函数
	struct InStack {
		var items = [Int]()
		mutating func push(item:Int){
			items.append(item)
		}
		
		mutating func pop() ->Int{
			return items.removeLast()
		}
	}

}

//使用泛型的函数
struct Stack<Element> {
	var items = [Element]()
	mutating func push(item:Element){
		items.append(item)
	}
	
	mutating func pop() ->Element{
		return items.removeLast()
	}
	
}

extension Stack{
	var topItem : Element?{
		return items.isEmpty ? nil : items[items.count - 1]
	}
}

//第一个类型参数 T ，有一个要求 T 必须是 SomeClass 子类的类型约束;第 二个类型参数 U ，有一个要求 U 必须符合 SomeProtocol 协议的类型约束
func someFunction<T:SomeClass,U:SomeProtocol>(someT:T,someU:U){
	
}


protocol Container {
	associatedtype ItemType
	mutating func append(item: ItemType)
	var count: Int { get }
	subscript(i: Int) -> ItemType { get }
}

struct IntStack: Container {
	// IntStack 的原始实现部分
	var items = [Int]()
	mutating func push(item: Int) {
		items.append(item)
	}
	mutating func pop() -> Int {
		return items.removeLast()
	}
	// Container 协议的实现部分 typealias ItemType = Int
	mutating func append(item: Int) {
		self.push(item: item)
	}
	var count: Int {
		return items.count
	}
	subscript(i: Int) -> Int {
		return items[i]
	}
}

struct StackAnthor<Element>: Container {
	// Stack<Element> 的原始实现部分
	var items = [Element]()
	mutating func push(item: Element) {
		items.append(item)
	}
	mutating func pop() -> Element {
		return items.removeLast()
	}
	// Container 协议的实现部分
	mutating func append(item: Element) {
		self.push(item: item)
	}
	var count: Int {
		return items.count
	}
	subscript(i: Int) -> Element {
		return items[i]
	}
}

public class SomePublicClass {
	public var somePublicProperty = 0
	var someInternalProperty = 0
	fileprivate func someFilePrivateMethod() {} // 显式文件私有类成员
}
private func somePrivateMethod() {}
// 显式私有类成员
class SomeInternalClass {
	var someInternalProperty = 0
	fileprivate func someFilePrivateMethod() {} // 显式文件私有类成员
}
private func somePrivateMethodOne() {}
// 显式私有类成员
// 显式文件私有类
// 隐式文件私有类成员 // 显式私有类成员
// 显式私有类
// 隐式私有类成员
fileprivate class SomeFilePrivateClass {
	func someFilePrivateMethod() {}
	private func somePrivateMethod() {}
}
private class SomePrivateClass {
	func somePrivateMethod() {}
}
