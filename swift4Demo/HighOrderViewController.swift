//
//  HighOrderViewController.swift
//  swift4Demo
//
//  Created by 命运 on 9/17/18.
//  Copyright © 2018 com.org.shunshiwei. All rights reserved.
//

import UIKit

class HighOrderViewController: UIViewController {
	
	deinit {
		print("死啦")
	}

    override func viewDidLoad() {
        super.viewDidLoad()
       	mapDemo()
		flatMapDemo()
		reduceDemo()
    }
	
	//map：可以对数组中的每一个元素做一次处理
	func mapDemo(){
		let stringArray = ["Objective-C", "Swift", "HTML", "CSS", "JavaScript"]
		
		let array1 = stringArray.map(stringCount) //获得一个字符数数组
		print(array1)
		
		//变形
		let array2 = stringArray.map { (string) -> Int in
			return string.count
		}
		
		print(array2)
		
		//最终版
		let array3 = stringArray.map {
			return $0.count
		}
		
		print(array3)
	}
	
	//苹果在Swift 4.1中新增compactMap函数，用来代替flatMap函数
	//flatMap返回后的数组中不存在nil，同时它会把Optional解包
	func flatMapDemo(){
		let array = ["Apple", "Orange", "Puple", ""]
		
		let arr1 = array.map { a -> Int? in
			let length = a.count
			guard length > 0 else { return nil }
			return length
		}
		print(arr1)
		// [{some 5}, {some 6}, {some 5}, nil]
	
		//可以自动过滤nil
		let arr2 = array.compactMap { a -> Int? in
			let length = a.count
			guard length > 0 else { return nil}
			return length
		}
		print(arr2)
		
		let arr3 = array.compactMap {
			return $0.count
		}
		print(arr3)
		// [5, 6, 5]
		
		let nums = [1, nil, 3, nil, 5]
		let result = nums.compactMap { return $0 }
		print(result) // [1, 3, 5]
		
		//类型转换
		let nums2 = [1,2,3,4,5]
		let result2 = nums2.compactMap { (item) -> String? in
			return "\(item)"
		}
		print(result2)
		
		//简洁语法
		let result3 = nums2.compactMap{ return "\($0)" }
		print(result3)
		
		let nums4 = [12, 55, 733, 77, 44]
		let result4 = nums4.compactMap { (item) -> Int? in
			
			if item%4 == 0 {
				return item
			}
			return nil
		}
		
		print(result4) // [12, 44]
		
		// filter:筛选 (根据条件筛选数组已有的值,返回筛选过后的值)
		print("\(nums4.filter { $0 % 4 == 0 })" + "\n")
	}
	
	//filer
	//filer：过滤，可以对数组中的元素按照某种规则进行一次过滤
	func filerDemo(){
		
		// 筛选出字符串的长度小于10的字符串
		let stringArray = ["Objective-C", "Swift", "HTML", "CSS", "JavaScript"]
		func stringCountLess10(string: String) -> Bool {
			return string.count < 10
		}
		let a1 = stringArray.filter(stringCountLess10)
		print(a1)
		
		let a2 = stringArray.filter({string -> Bool in
			return string.count < 10
		})
		print(a2)
		// $0表示数组中的每一个元素
		let a3 = stringArray.filter{
			return $0.count < 10
		}
		
		print(a3)
	}
	
	//reduce：计算，可以对数组的元素进行计算
	func reduceDemo(){
		let stringArray = ["Objective-C", "Swift", "HTML", "CSS", "JavaScript"]
		
		
		let string = stringArray.reduce("", appendString)
		print(string)
		
		let string2 = stringArray.reduce("", {
			return $0 == "" ? $1 : $0 + "、" + $1
		})
		print(string2)
	}
	
	func appendString(string1:String,string2:String) ->String{
		return string1 == "" ? string2 : string1 + "、"+string2
	}
	
	func stringCount(string:String) -> Int{
		return string.count
	}
	
	

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
