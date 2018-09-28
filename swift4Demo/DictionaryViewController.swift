//
//  DictionaryViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/14.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class DictionaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationItem.title = "字典"
		createDemo();
        // Do any additional setup after loading the view.
    }
	
	func createDemo(){
		//创建一个空字典
		var namesOfIntegers = [Int:String]()
		let count = namesOfIntegers.count;
		print("count:\(count)");
		namesOfIntegers[16] = "唐";
		print(namesOfIntegers);
		
		//用字面量来创建字典
		var airports : [String:String] = ["YYZ":"torafd","DUB":"dublun"]
		
		
		if airports.isEmpty {
			print("空字典")
		}else{
			print("不是空字典")
		}
		
		//我们也可以在字典中使用下标语法来添加新的数据项。可以使用一个恰当类型的键作为下标索引，并且分配恰当类型的新值
		
		airports["LHR"] = "London"
		print(airports["LHR"]!)
		
		//:对于存储 String 值的字典，这个函数会 返回一个 String? 或者“可选 String ”类型的值
		if let airportName = airports["DUB"] {
			print("The name of the airport is \(airportName).")
		} else {
			print("That airport is not in the airports dictionary.")
		}
		
		
		//删除
		airports.removeValue(forKey: "DUB");
		
		//遍历
		for (airportCode,airportName) in airports{
			print("\(airportCode):\(airportName)");
		}
		
		
		for airportCode in airports.keys {
			print("Airport code: \(airportCode)")
		}
		// Airport code: YYZ
		// Airport code: LHR
		for airportName in airports.values {
			print("Airport name: \(airportName)")
			let str = "Airport name: \(airportName)"
			print(str)
		}
		// Airport name: Toronto Pearson
		// Airport name: London Heathrow
	}

}
