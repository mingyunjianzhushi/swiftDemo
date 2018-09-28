//
//  SetViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/14.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class SetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationItem.title = "集合";
       /*
		Swift 中的 Set 类型被写为 Set<Element> ，这里的 Element 表示 Set 中允许存储的类型，和数组不同的是，集 合没有等价的简化形式
		*/
		
		setDemo();
		
		var letters = Set<Character>();
		print("letters is of type set<Character> wiht \(letters.count) items")
		
		letters.insert("a");
		letters = []//清空
		
		var favoriteGenres : Set<String> = ["Rock","Classical","Hip hop"];
		//构造一个含三个初始值的集合
		
		if favoriteGenres.isEmpty {
			print("为空")
		}else{
			print("不为空")
		}
		
		favoriteGenres.insert("这是");
		
		//删除方法
		if favoriteGenres.remove("ock") != nil {
			print("删除成功");
		}else{
			print("无这个人");
		}
		
		//检查set中是否存在一个值
		
		if favoriteGenres.contains("这是") {
			print("有的");
		}else{
			print("没有")
		}
		
		/*
		Swift 的 Set 类型没有确定的顺序，为了按照特定顺序来遍历一个 Set 中的值可以使用 sorted() 方法，它将返 回一个有序数组，这个数组的元素排列顺序由操作符'<'对元素进行比较的结果来确定*/
		
		//遍历
		for genre in favoriteGenres{
			print(genre);
		}
		
		//对集合进行排序
		for genre in favoriteGenres.sorted(){
			print(genre);
		}
		
    }
	
	func setDemo(){
		
		/*
		• 使用 intersection(_:) 方法根据两个集合中都包含的值创建的一个新的集合。
		第 2 章 Swift 教程 | 93
		• 使用 symmetricDifference(_:) 方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
		• 使用 union(_:) 方法根据两个集合的值创建一个新的集合。
		• 使用 subtracting(_:) 方法根据不在该集合中的值创建一个新的集合。
		*/
		let oddDigits: Set = [1, 3, 5, 7, 9]
		let evenDigits: Set = [0, 2, 4, 6, 8]
		let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
		print(oddDigits.union(evenDigits).sorted());
		// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
		print(oddDigits.intersection(evenDigits).sorted())
		// []
		print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())
		// [1, 9]
		print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())
		// [1, 2, 9]
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
