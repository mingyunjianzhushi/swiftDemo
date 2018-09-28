//
//  StructAndClassViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/15.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class StructAndClassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "结构体和类"
	
		
		//初始化
		let videoMode = VideoMode()
		let resolution = Resolution()
		
		
		
		//访问
		print("The width of someResolution is \(resolution.width)")
		//// 打印 "The width of someResolution is 0"
		
		print("The width of someVideoMode is \(videoMode.resolution.width)") // 打印 "The width of someVideoMode is 0"
		
		//赋值
		videoMode.resolution.width = 230
		
		print("The width of someVideoMode2 is \(videoMode.resolution.width)")
		
		
		//结构体类型的成员逐一构造器
		let vga = Resolution(width: 640, height: 320)
		//与结构体不同，类实例没有默认的成员逐一构造器
		print("宽为:\(vga.width),高为:\(vga.height)")
		
		
		//在 Swift 中，所有的结构体和枚举类型都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型属 性，在代码中传递的时候都会被复制
		let hd = Resolution(width: 1920, height: 1080)
		var cinema = hd
		
//		下面，为了符合数码影院放映的需求(2048 像素宽，1080 像素高)，cinema的width属性需要作如下修 改:
		cinema.width = 2048
//		这里，将会显示 cinema 的 width 属性确已改为了 2048 :
		print("cinema is now \(cinema.width) pixels wide") // 打印 "cinema is now 2048 pixels wide"
//		然而，初始的 hd 实例中 width 属性还是 1920 :
		print("hd is still \(hd.width) pixels wide") // 打印 "hd is still 1920 pixels wide"
    }

}

//类的定义
class VideoMode {
	var resolution = Resolution()
	var interlaced = false
	var frameRate = 0.0
	var name: String?
}

//结构体的定义
struct Resolution {
	var width = 0
	var height = 0
}
