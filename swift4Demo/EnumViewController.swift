//
//  EnumViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/15.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class EnumViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationItem.title = "枚举"
		
	
    }
	
	//常规定义
	func demo1(){
		enum SomeEnumeration { // 枚举定义放在这里
		}
		
		//定义一
		enum CompassPoint{
			case north
			case south
			case east
			case west
		}
		
		//定义二
		enum Planet {
			case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
		}
		
		var directionToHead = CompassPoint.north
		directionToHead = .south  //directionToHead  被推断为 CompassPoint
		switch directionToHead {
		case .north:
			print("Lots of planets have a north")
		case .south:
			print("Watch out for penguins")
		case .east:
			print("Where the sun rises")
		case .west:
			print("Where the skies are blue")
		}
		// 打印 "Watch out for penguins”
		
		
		let somePlanet = Planet.earth
		switch somePlanet {
		case .earth:
			print("Mostly harmless")
		default:
			print("Not a safe place for humans")
		}
		// 打印 "Mostly harmless”
	}
	
	func demo2(){
		
		/*
		定义一个名为 Barcode 的枚举类型，它的一个成员值是具有 (Int，Int，Int，Int) 类型关联值的 upc ，另一个
		成员值是具有 String 类型关联值的 qrCode
		*/
		enum Barcode {
			case upc(Int, Int, Int, Int)
			case qrCode(String)
		}
		
//		然后可以使用任意一种条形码类型创建新的条形码，例如:
		
		var productBarcode = Barcode.upc(8, 85909, 51226, 3)
		
//		同一个商品可以被分配一个不同类型的条形码，例如:
		productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
		
		
		switch productBarcode {
		case .upc(let numberSystem, let manufacturer, let product, let check):
			print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
		case .qrCode(let productCode):
			print("QR code: \(productCode).")
		}
		// 打印 "QR code: ABCDEFGHIJKLMNOP."
		
	}
	
	func originalValue(){
		
		//这是一个使用 ASCII 码作为原始值的枚举:
		//原始值可以是字符串，字符，或者任意整型值或浮点型值。每个原始值在枚举声明中必须是唯一的
		enum ASCIIControlCharacter: Character {
			case tab = "\t"
			case lineFeed = "\n"
			case carriageReturn = "\r"
		}
		
		//在上面的例子中， Plant.mercury 的显式原始值为 1 ， Planet.venus 的隐式原始值为 2 ，依次类推
		enum Planet: Int {
			case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
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
