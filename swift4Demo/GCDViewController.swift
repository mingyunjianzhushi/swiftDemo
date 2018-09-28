//
//  GCDViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/15.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class GCDViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationItem.title = "多线程GCD"
//		demo1()
//		demo2()
//		globalDemo()
//		groupDemo()
		barrier()
    }
	
	//异步线程回到主线程
	func demo1(){
		let queue = DispatchQueue(label: "com.tang")
		queue.async {
			print("这是一个异步线程:\(Thread.current)")
			Thread.sleep(forTimeInterval: 2)
			DispatchQueue.main.async {
				print("回到主线程:\(Thread.current)")
			}
		}
	}
	
	//延时
	func demo2(){
		print("外面\(DispatchTime.now())")
		DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
			print("延迟执行啦\(DispatchTime.now())")
		}
		
		//加上扩展后  推荐使用
		DispatchQueue.main.asyncAfter(deadline: 3, execute: {
			print(Thread.current)
			print("延迟后的\(DispatchTime.now())")
		})
		
		//这是异步线程，执行后也是异步的，在实际中，使用上面的
		DispatchQueue.global().asyncAfter(deadline: 3, execute: {
			print(Thread.current)
			print("延迟后的\(DispatchTime.now())")
		})
	}
	
	//加墙
	func barrier(){
		let concurrentQueue = DispatchQueue(label: "com.leo.concurrent", attributes: .concurrent)
		concurrentQueue.async {
			Thread.sleep(forTimeInterval: 3)
			NSLog("1")
		}
		
		concurrentQueue.async {
			Thread.sleep(forTimeInterval: 4)
			NSLog("2")
		}
		concurrentQueue.async(flags: .barrier, execute: {
			NSLog("Task from barrier 1 begin")
			sleep(3)
			NSLog("Task from barrier 1 end")
		})
	}
	
	//全局队列
	func globalDemo(){
		
		//这是全局并发同步队列  同步操作会使得在前一个任务完成后才去执行下一个任务
//		for i in 1...10{
//			DispatchQueue.global().sync {
//				Thread.sleep(forTimeInterval: 2)
//				print("线程\(Thread.current)正在执行\(i)号任务")
//			}
//		}
		
		
		for i in 1...10 {
			DispatchQueue.global().async {
				//全局并发异步
				Thread.sleep(forTimeInterval: 2)
				print("线程\(Thread.current)正在执行\(i)号任务")
			}
		}
	}
	
	//自定义队列
	func demo4 (){
	  let queue = DispatchQueue(label: "com.tang")//默认创建的串行队列
		let queue2 = DispatchQueue(label: "con",qos:DispatchQoS.default,attributes:DispatchQueue.Attributes.concurrent,autoreleaseFrequency:.workItem,target:nil)
		
		queue2.async {
			//异步并行线程
		}
		
		/*
		参数说明：
		
		label 表示队列标签
		
		qos 表示设置队列的优先级
		
		.userInteractive 需要用户交互的，优先级最高，和主线程一样
		.userInitiated 即将需要，用户期望优先级，优先级高比较高
		.default 默认优先级
		.utility 需要执行一段时间后，再通知用户，优先级低
		*.background 后台执行的，优先级比较低
		*.unspecified 不指定优先级，最低
		attributes 表示队列类型，默认为串行队列，设置为.concurrent表示并行队列。iOS 10.0之后 attributes 新增.initiallyInactive属性表示当前队列是不活跃的，它需要调用DispatchQueue的activate方法来执行任务。
		
		autoreleaseFrequency 表示自动释放频率，设置自动释放机制。
		
		.inherit 表示不确定，之前默认的行为也是现在的默认值
		.workItem 表示为每个执行的项目创建和排除自动释放池, 项目完成时清理临时对象
		.never 表示GCD不为您管理自动释放池
		同步串行队列
		其实同步串行队列，没什么意思的，不管是同步操作还是串行操作都会导致任务被一个一个的执行。这个操作尤其是在主线程执行的时候需要注意，避免造成线程的卡顿
		*/
	}
	
	
	//线程组
	func groupDemo(){
		let group = DispatchGroup()
		
		group.enter()
		DispatchQueue.global().async {
			Thread.sleep(forTimeInterval: 3)
			print("第一份")
			group.leave()
		}
		
		group.enter()
		DispatchQueue.global().async {
			Thread.sleep(forTimeInterval: 5)
			print("第二个")
			group.leave()
		}
		
		group.notify(queue: DispatchQueue.main) {
			print("全部完成");
		}
	}
	
	func groupDemo1(){
		let group = DispatchGroup()
		let queue = DispatchQueue(label: "com.custom.thread", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent)
		for i in 1...10 {
			queue.async(group: group) {
				//并发异步
				Thread.sleep(forTimeInterval: 2)
				print("线程\(Thread.current)正在执行\(i)号任务")
			}
		}
		
		group.notify(queue: DispatchQueue.main) {
			// 通知主线程，子线程操作已完成
			print("所有任务都已经完成")
		}
	
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
