//
//  JudgeViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/9.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class JudgeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationItem.title = "判断";
		SwitchDemo();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	//MARK:判断语句
	func SwitchDemo(){
		
		//与 C 和 Objective-C 中的 switch 语句不同，在 Swift 中，当匹配的 case 分支中的代码执行完毕后，程序会 终止 switch 语句，而不会继续执行下一个 case 分支。这也就是说，不需要在 case 分支中显式地使用 break 语 句。这使得 switch 语句更安全、更易用，也避免了因忘记写 break 语句而产生的错误。
		
		let someCharacter:Character = "z";
		
		switch someCharacter {
		case "z":
			print("z");
		case "a":
			print("a");
		case "b","m"://可以多个值的复合匹配
			print("b");
		case "d":
			print("d");
		default:
			print("default");
		}
		
		
		//case 分支的模式也可以是一个值的区间。下面的例子展示了如何使用区间匹配来输出任意数字对应的自然语言格
		let approximateCount = 0
		let countedThings = "moons orbiting Saturn"
		var naturalCount: String
		switch approximateCount {
		case 0:
			naturalCount = "no"
		case 1..<5:
			naturalCount = "a few"
		case 5..<12:
			naturalCount = "several"
		case 12..<100:
			naturalCount = "dozens of"
		case 100..<1000:
			naturalCount = "hundreds of"
		default:
			naturalCount = "many"
		}
		print("There are \(naturalCount) \(countedThings).") // 输出 "There are dozens of moons orbiting Saturn."
		
		//使用元组
		let somePoint = (1, 1)
		switch somePoint {
		case (0, 0):
			print("(0, 0) is at the origin")
		case (_, 0):
			print("(\(somePoint.0), 0) is on the x-axis")
		case (0, _):
			print("(0, \(somePoint.1)) is on the y-axis")
		case (-2...2, -2...2):
			print("(\(somePoint.0), \(somePoint.1)) is inside the box")
		default:
			print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
		}
		// 输出 "(1, 1) is inside the box"
		
		/*
		值绑定(Value Bindings)
		case 分支允许将匹配的值绑定到一个临时的常量或变量，并且在case分支体内使用 —— 这种行为被称为值绑 定(value binding)，因为匹配的值在case分支体内，与临时的常量或变量绑定。
		*/
		let anotherPoint = (2, 0)
		switch anotherPoint {
		case (let x, 0):
			print("on the x-axis with an x value of \(x)")
		case (0, let y):
			print("on the y-axis with a y value of \(y)")
		case let (x, y):
			print("somewhere else at (\(x), \(y))")
		}
		// 输出 "on the x-axis with an x value of 2"
		
		//		continue 语句告诉一个循环体立刻停止本次循环，重新开始下次循环。就好像在说“本次循环我已经执行完 了”，但是并不会离开整个循环体
		
		let puzzleInput = "great minds think alike"
		var puzzleOutput = ""
		for character in puzzleInput.characters {
			switch character {
			case "a", "e", "i", "o", "u", " ":
				continue
			default:
				puzzleOutput.append(character)
			}
		}
		print(puzzleOutput)
		// 输出 "grtmndsthnklk"
		
		
		//如果你确实需要 C 风格的贯穿的特性，你可以在每个需要该特性的 case 分支中使用 fallthrough 关键字。下面 的例子使用 fallthrough 来创建一个数字的描述语句
		
		let integerToDescribe = 5
		var description = "The number \(integerToDescribe) is"
		switch integerToDescribe {
		case 2, 3, 5, 7, 11, 13, 17, 19:
			description += " a prime number, and also"
			fallthrough
		default:
			description += " an integer."
		}
		print(description)
		
		
		if #available(iOS 10, macOS 10.12, *) {
			// 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
		} else {
			// 使用先前版本的 iOS 和 macOS 的 API
		}
		// 输出 "The number 5 is a prime number, and also an integer."
	}
}
