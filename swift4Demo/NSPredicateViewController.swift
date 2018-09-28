//
//  NSPredicateViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/13.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class NSPredicateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      self.navigationItem.title = "NSPredicate"
        // Do any additional setup after loading the view.
		
		//检索值是否存在一个范围区间里
		let number2 = 0
		let numberPre2 = NSPredicate(format: "SELF BETWEEN{1,5}")
		let bool2 = numberPre2.evaluate(with: number2)
		print(bool2);
		
		//2.检索数组元素中是否包含给定字符串
		let number3 = "dd"
		let numberPre3 = NSPredicate(format: "SELF IN {'dd','bb'}")
		let bool3 = numberPre3.evaluate(with: number3)
		print(bool3);
		
		//判断是否在一个范围
		let num = 10
		let predicate = NSPredicate(format: "(SELF > 20) AND (SELF < 30)")
		let boo7 = predicate.evaluate(with: num)
		print(boo7)
		
		
    }
	
	//MARK:正则匹配
	func matchDemo(){
		//匹配纯数字
		let number = "^[0-9]+$"
		let numberPre = NSPredicate(format: "SELF MATCHES %@", number)
		let boo3 = numberPre.evaluate(with: "13140000000")
		print(boo3);
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
