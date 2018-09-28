//
//  CycleViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/9.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class CycleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationItem.title = "循环";
		ControlFlow();
    }

	
	func ControlFlow(){
		//循环样式一
		for index in 1...5{
			print(index);
		}
		
		
		for index in 1..<5{
			print(index)
		}
		
		//循环样式二
		
		let base = 3;
		let power = 10;
		var answer = 1;
		for _ in 1...power{
			answer *= base;
		}
		
		print("\(base)的answer次方为\(answer)");
		
		let names = ["Anna","Alex","Brian","Jack"];
		for name in names{
			print(name);
		}
		
		//从某个开始
		//此处从1开始
		for value in names[1..<names.count]{
			print(value);
		}
		
		let numbersLegs = ["spider":8,"ant":6,"cat":4];
		//遍历键值对
		for (animalName,legCount) in numbersLegs{
			print("\(animalName) have \(legCount) legs");
		}
		
	}

}
