//
//  ClosuresViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/15.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

typealias MyClosureType = (Int,Int) ->Int

class ClosuresViewController: UIViewController {
	
	//定义一个闭包属性
	var myCloure:((Int,Int) ->Int)?
	var myCloure1:MyClosureType?

    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationItem.title = "闭包"
		
		let btn = UIButton(type: .custom);
		btn.backgroundColor = UIColor.gray
		btn.setTitle("点击回调", for: .normal)
		btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
		self.view.addSubview(btn)
		btn.snp.makeConstraints { (make) in
			make.top.equalTo(self.view.snp.top).offset(40);
			make.left.equalTo(self.view.snp.left).offset(40);
			make.width.equalTo(200);
			make.height.equalTo(50);
		}
		
		self.methodName(duration: 0.2, animations: {
			
		}) { (fineds) in
			
		}
		
		
        // Do any additional setup after loading the view.
    }
	
	@objc func btnClick(){
		let a = self.myCloure1!(12,3)
		print(a) //结果的值
	}
	
	//无参数 添加回调参数
	func loadData(finished:@escaping (Int,Int)->()){
		
		print("点击后")
		DispatchQueue.main.asyncAfter(deadline: 3) {
			finished(12,12)
		}
	}
	
	//这是一个非逃逸闭包，闭包doBlock 在函数执行的时候就调用了
	func methodName1(block:(() -> Void)) {
		block()
	}
	
	//这是一个逃逸闭包，闭包block 到了另一个作用域，跟当前函数是异步的,逃逸闭包必须用@escaping来修饰。因为默认是 @noescaping
	func methodName2(block:@escaping (() -> Void)) {
		DispatchQueue.main.async {
			block()
		}
	}
	
	//多个参数的情况
	func methodName(duration:TimeInterval,animations:() -> Void,completion:(Bool) ->Void){
		
	}
	
	
	//带参  添加回调参数
	func loadData(param:Int,finished:@escaping (Int)->()){
		
		print("点击后")
		DispatchQueue.main.asyncAfter(deadline: 3) {
			finished(param + 1)
		}
	}
	
	////用变量记录函数 (带参数的闭包)
	//带有参数的闭包
	//参数返回值 实现代码  {形参->返回值 in 代码}
	//带参数待返回值的闭包
	func demo1(){
		
//		{
//			(parameters) -> returnType in
//			statements
//		}
		
		let countNum = {(num1:Int,num2:Int) ->Int in
			return num1 + num2
		}
		
		let count1 = countNum(2,3);
		print(count1);
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
	
	deinit {
		print("控制器 88")
	}
	
	func loadData(completion:@escaping ([String])->() ){
		DispatchQueue.global().async {
			print("耗时操作\(Thread.current)")
			Thread.sleep(forTimeInterval: 1.0);
			let json=["12","23","34"]
			//以下两段代码相同只不过一个是使用尾随闭包的写法
			DispatchQueue.main.async{
				print("主线程\(Thread.current)")
				completion(json)
			}
			DispatchQueue.main.async(execute: {
				print("主线程\(Thread.current)")
				completion(json)
			})
			
		}
	}

}
