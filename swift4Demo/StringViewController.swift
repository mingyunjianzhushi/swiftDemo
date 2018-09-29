//
//  StringViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/10.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class StringViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationItem.title = "字符串"
		stringFuncBase()
		ModifyStringDemo()
		removeAndReplaceDemo()
		subString()
		replace()
		stringContainst()
    }
	
	/*
	通过调用 String 的 index(before:) 或 index(after:) 方法，可以立即得到前面或后面的一个索引。您还 可以通过调用 index(_:offsetBy:) 方法来获取对应偏移量的索引，这种方式可以避免多次调用 index(befor e:) 或 index(after:) 方法
	*/
	
	//字符串的修改
	func ModifyStringDemo(){
		let greeting = "guten tag!";
		//可以使用下标语法来访问 String 特定索引的 Character
	let firstLetter = greeting[greeting.startIndex];
		print(firstLetter);
		print(greeting);
		print(greeting[greeting.index(before: greeting.endIndex)]);
		//!
		print(greeting[greeting.index(after: greeting.startIndex)]);
		//u
		
		let index = greeting.index(greeting.startIndex, offsetBy: 7)
		print(greeting[index]);
		// a
		
		//属性的 indices 属性会创建一个包含全部索引的范围(Range)，用来在一个字符串中访问单 个字符
		
		for index in greeting.indices{
//			print("\(greeting[index])");
			 print("\(greeting[index]) ", terminator: "") //输出到一行
		}
		
		
		//获取位置   开始位置和偏移
		let index2 = greeting.index(greeting.startIndex, offsetBy: 7);
		
		
		
		let text = "Hello world"
		
		for char in text {
			print(char)
		}
		
		print(text.prefix(5)) // "Hello"   开始的5个字符
		print(text.suffix(5)) // "world"   从后开始5个字符
		
		print(text.dropFirst()) // "H"   删除开始一个字符
		print(text.dropLast()) // "d"   删除最后一个字符
		
		
	}
	
	//MARK: 字符串涉及的判断
	func stringJDudgeDemo(){
		let romeoAndJuliet = [
			"Act 1 Scene 1: Verona, A public place",
			"Act 1 Scene 2: Capulet's mansion",
			"Act 1 Scene 3: A room in Capulet's mansion",
			"Act 1 Scene 4: A street outside Capulet's mansion",
			"Act 1 Scene 5: The Great Hall in Capulet's mansion",
			"Act 2 Scene 1: Outside Capulet's mansion",
			"Act 2 Scene 2: Capulet's orchard",
			"Act 2 Scene 3: Outside Friar Lawrence's cell",
			"Act 2 Scene 4: A street in Verona",
			"Act 2 Scene 5: Capulet's mansion",
			"Act 2 Scene 6: Friar Lawrence's cell"
		]
		
//		您可以调用 hasPrefix(_:) 方法来计算话剧中第一幕的场景数:
		var act1SceneCount = 0
		for scene in romeoAndJuliet {
			if scene.hasPrefix("Act 1 ") {
				act1SceneCount += 1
			} }
		print("There are \(act1SceneCount) scenes in Act 1")
		// 打印输出 "There are 5 scenes in Act 1"
		
		
		var mansionCount = 0
		var cellCount = 0
		for scene in romeoAndJuliet {
			if scene.hasSuffix("Capulet's mansion") {
				mansionCount += 1
			} else if scene.hasSuffix("Friar Lawrence's cell") {
				cellCount += 1
			} }
		
		print("\(mansionCount) mansion scenes; \(cellCount) cell scenes") // 打印输出 "6 mansion scenes; 2 cell scenes"
		
		//您可以用 hasSuffix(_:) 方法来计算发生在不同地方的场景数
	}
	
	//基础操作
	func stringFuncBase(){
		let string = "hello word";
		//打印长度
		print(string.count);
		
		var emptyString = "";
		//判断是否为空
		if emptyString.isEmpty {
			print("noting to se here");
		}
		
		emptyString += "tang";
		print(emptyString);
		
		//		let constantString = "Highlander"
		//		constantString += " and another Highlander"
		// 这会报告一个编译错误 (compile-time error) - 常量字符串不可以被修改。
		
		//循环一个字符串 可以直接遍历
		for character in "Dog!?"{
			print(character);
		}
		
		//通过标明一个 Character 类型并用字符字面量进行赋值，可以建立一个独立的字符常量或变量
		let exclamationMark:Character = "!";
		print(exclamationMark);
		
		//字符串可以通过传递一个值类型为 Character 的数组作为自变量来初始化
		let catCharacters : [Character] = ["c","a","t","!"];
		let catString = String(catCharacters);
		print(catString);
		
		//拼接字符串
		let string1 = "hello"
		let string2 = "there"
		var welcome = string1 + string2;
		print(welcome);
		
		//+法赋值运算
		var instruction = "look over"
		instruction += string2;
		print(instruction);
		
		//删除操作
//		instruction.removeSubrange()
		
		
		//append() 方法将一个字符附加到一个字符串变量的尾部
		let exclamation: Character = "!"
		welcome.append(exclamation);
		print(welcome);
		
		//注意 不能将一个字符串或者字符添加到一个已经存在的字符变量上，因为字符变量只能包含一个字符
		
		//字符串插值
		let multiplier = 3
		let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)" // message 是 "3 times 2.5 is 7.5"
		print(message)
	}
	
	func removeAndReplaceDemo(){
	
		var str = "swift is a rang"
		
		str.insert(".", at: str.endIndex) //插入字符串
		//按照位置插入
		str.insert("c", at: str.index(str.startIndex, offsetBy: 2))
		print(str)
		str.removeLast(1)
		print(str)
		
		let startIndex = str.index(str.startIndex, offsetBy: 1)
		let endIndex = str.index(str.startIndex, offsetBy: 3)
		str.removeSubrange(startIndex...endIndex)
		
		
		print("删除字符串后：\(str)")
		
	   str.replaceSubrange(startIndex...endIndex, with: "啦啦啦啦")
		print("替换后\(str)")
		
	}
	
	
	//字符串截取
	func subString(){
		let str = "Sat, 29 Sep 2018 02:34:52 GMT"
		let index1 = str.index(str.startIndex, offsetBy: 5)   //获取索引
		let index2 = str.index(str.endIndex, offsetBy: -4)
		let res = str[index1..<index2]
		print(res)
//		let re = str.subStr(fromIndex: 6)
	}
	
	//判断文字包含
	func stringContainst(){
		let str = "fafdafa"
		let result = str.contains("af")
		print(result)
	}
	
	func replace(){
		let str = "abcdefghi"
		let result = str.replacingOccurrences(of:"abc", with:"m")
		print(result)
	}

}
