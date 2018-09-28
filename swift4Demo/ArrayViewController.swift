//
//  ArrayViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/13.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class ArrayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "数组"
		createSArray();
		modifyDemo();
		
		sortDemo();
		stringOrArrayChange()
    }
	
	func createSArray(){
		var someInts = [Int]();
		someInts.append(12);
		print("someInts is of type [Int] with \(someInts.count) items.")
		//通过构造函数的类型， someInts 的值类型被推断为 [Int]
		
		someInts.append(3)
		print("someInts is of type [Int] with \(someInts.count) items.")
		// someInts 现在包含一个 Int 值
		someInts = []
		print("someInts is of type [Int] with \(someInts.count) items.")
		// someInts 现在是空数组，但是仍然是 [Int] 类型的。
		
		
		
		//创建一个带有默认值的数组
		let threeDoubles = Array(repeating: 0.0, count: 3);
		//// threeDoubles 是一种 [Double] 数组，等价于 [0.0, 0.0, 0.0]
		
		let anotherThreeDoubles = Array(repeating: 2.5, count: 3);
		// anotherThreeDoubles 被推断为 [Double]，等价于 [2.5, 2.5, 2.5]
		
		var sixDoubles = threeDoubles + anotherThreeDoubles;
		
		print(sixDoubles.count);
		// sixDoubles 被推断为 [Double]，等价于 [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
	}
	
	//修改的方法
	func modifyDemo(){
		//用数组字面量构造数组
		
		var shoppingList: [String] = ["Eggs", "Milk"]
		print(shoppingList);
		shoppingList.append("Flour");
		// shoppingList 已经被构造并且拥有两个初始项
		
		shoppingList += ["Baking Powder"]
		// shoppingList 现在有四项了
		shoppingList += ["Chocolate Spread", "Cheese", "Butter"] // shoppingList 现在有七项了
		
		//访问
		let firstItem = shoppingList[0]
		print(firstItem);
		// 第一项是 "Eggs"
		
		//修改
		shoppingList[0] = "Six eggs"
		// 其中的第一项现在是 "Six eggs" 而不是 "Eggs"
		
		//修改某一个范围的
		shoppingList[4...6] = ["Bananas", "Apples"] // shoppingList 现在有6项
		
		//指定位置插入
		shoppingList.insert("hello", at: 0);
		
		//删除指定位置
	let hello = shoppingList.remove(at: 0);
		print(hello)  //hello 可以获得删除的文字  删除第一项
		
		let apples = shoppingList.removeLast();
		print(apples) //删除最后一项
		
	}
	
	func traverseDemo(){
		
		var shoppingList: [String] = ["Eggs", "Milk"]
		
		shoppingList += ["Baking Powder"]
		shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
		
		for item in shoppingList{
			print(item);
		}
		
		//如果我们同时需要每个数据项的值和索引值，可以使用 enumerated() 方法来进行数组遍历。 enumerated() 返回 一个由每一个数据项索引值和数据值组成的元组。我们可以把这个元组分解成临时常量或者变量来进行遍历
		
		for (index,value) in shoppingList.enumerated(){
			 print("Item \(String(index + 1)): \(value)")
		}
		
	}
	
	
	//MARK:排序
	func sortDemo(){
		var userList = [userModel]()
		userList.append(userModel.UserInfo(name: "tang", age: 12))
		userList.append(userModel.UserInfo(name: "tang2", age: 5))
		userList.append(userModel.UserInfo(name: "tang3", age: 25))
		userList.append(userModel.UserInfo(name: "tang4", age: 15))
		userList.append(userModel.UserInfo(name: "tang5", age: 45))
		
		func onSort(s1:userModel, s2:userModel) -> Bool{
			return s1.age! > s2.age!
		}
		
		//方法一
		let result1 = userList.sorted(by: onSort);
		
		print(result1);
		
		//方法二
		let result = userList.sorted { (s1:userModel, s2:userModel) -> Bool in
			return s1.age! > s2.age!
		}
		
		print(result);
		
		//传入一个闭包
		let result2 = userList.sorted(by: {
			(s1:userModel, s2:userModel) -> Bool in
			return s1.age! > s2.age!
		})
		
		print(result2);
		
		
//		let sortByA = NSSortDescriptor.sor
		
	}
	
	func stringOrArrayChange(){
		//字符串转数组
		let str = "I am FlyElephant"
		let array = str.components(separatedBy: " ")
		print(array)
		
		let data = [1, 2, 3, 4, 5]
		let dataStr = data.map(String.init)
		let reslut = dataStr.joined(separator: "")
		print(reslut)
		
	}
	
}
