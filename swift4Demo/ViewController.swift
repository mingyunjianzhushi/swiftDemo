//
//  ViewController.swift
//  swift 基础
//
//  Created by 命运 on 2018/8/6.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit

struct contents {
	static let cellIdendity = "cellId"
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,btnClickDelegate {
	
	var dataArray:[ModuleModel]?
	//懒加载
	lazy var tableView : UITableView = {
		let tempTableView = UITableView (frame: self.view.bounds, style:.plain)
		tempTableView.delegate = self
		tempTableView.dataSource = self
		tempTableView.backgroundColor = UIColorFromRGB(color_vaule: "#7FFFAA")//colorWithHexString(hexColor: "#7FFFAA") //UIColorFromRGB(color_vaule: 0x1234)  UIColorFromRGB(color_vaule: "#7FFFAA")
		tempTableView.separatorStyle = .singleLine
		//注册
		tempTableView.tableFooterView = UIView();
		tempTableView.register(moduleCell.self, forCellReuseIdentifier: contents.cellIdendity);
		return tempTableView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationItem.title = "功能列表";
		
		//将布局在导航下面
		self.navigationController?.navigationBar.isTranslucent = false;
		//读取plist文件路径
		let plistStr = Bundle.main.path(forResource: "module", ofType: "plist");
		//转换为字典数组
		let array = NSArray(contentsOfFile: plistStr!);
		
		pariseData2(array: array!);
		
		self.view.addSubview(self.tableView)
		self.tableView.snp.makeConstraints { (make) -> Void in
			make.edges.equalTo(0);
		};
		
		let view = UIView();
		self.view.addSubview(view);
		view.snp.makeConstraints { (make) in
			make.top.equalTo(self.view.snp.top).offset(100);
			make.left.equalTo(self.view.snp.left).offset(100);
			make.height.equalTo(20);
			make.width.equalTo(100);
		}
		
		self.view.layoutIfNeeded();
		print(NSStringFromCGRect(view.frame));
		
		NotificationCenter.default.addObserver(self, selector: #selector(upDataChange(notif:)), name: NSNotification.Name(rawValue: "changeItem"), object: nil)
		
}
	
	//MARK:-通知回调值
	@objc func upDataChange(notif: NSNotification) {
		
		print(notif.userInfo!["data"]!)
		
	}
	
	
	//使用原生解析
	func pariseData(array:NSArray){
		//创建数组
		var dataArray = [ModuleModel]();
		
		for dic in array{
			let temp = dic as! Dictionary<String, Any>
			let moduleModel = ModuleModel();
			moduleModel.name = temp["name"] as? String;
			moduleModel.controllerName = temp["controllerName"] as? String
			dataArray.append(moduleModel);
		}
		
		self.dataArray = dataArray;
	}
	
	
	func pariseData2(array:NSArray){
		//创建数组
		var dataArray = [ModuleModel]();
		
		for dic in array{
			let temp = dic as! Dictionary<String, Any>
			let moduleModel = ModuleModel.deserialize(from: temp);
			dataArray.append(moduleModel!);
		}
		
		self.dataArray = dataArray;
	}

	func test1(){
		
		let apples = 3;
		let pranges = 5;
		let appleSummary = "I have \(apples) apples and \(pranges) pranges";
		print(appleSummary);
		
		let label = "the width is";
		let width = 94;
		let widthLabel = label + String(width);
		print(widthLabel);
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	//MARK:tableView的代理方法
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return (self.dataArray?.count)!;
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: contents.cellIdendity) as! moduleCell;
		cell.tableViewModel = self.dataArray?[indexPath.row];

		return cell;
	}
	
	//通过反射机制来跳转
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true);
		let itemData = self.dataArray?[indexPath.row];
		//  swift4中通过字符串名转化成类，需要在字符串名前加上项目的名称
		let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String//这是获取项目的名称，
		//如果通过？会有options
		let className = clsName!+"."+itemData!.controllerName!
		
		if itemData?.controllerName == "ClosuresViewController" {
			let vc = ClosuresViewController()
			vc.myCloure1 = { (s1:Int,s2:Int) ->Int in
			print(s1 + s2)
				return s1 + s2;
			}
			
			vc.loadData {s1,s2 in
				print("回调函数\(s1) =====\(s2)")
			}
			
			
			weak var weakSelf = self  //解决循环引用问题
			vc.loadData(param: 12) {s1 in
				print(weakSelf?.dataArray)
				print(s1)
			}
			
			
			self.navigationController?.pushViewController(vc, animated: false)
			return
		}else if itemData?.controllerName == "ProtocolViewController"{
			//这里需要指定类的类型XX.Type
			let controllerClass = NSClassFromString(className) as? ProtocolViewController.Type;
			let controller = controllerClass!.init()
			controller.setValue("str", forKey: "str")
			controller.delegate = self
			controller.navigationItem.title = itemData?.name
			self.navigationController?.pushViewController(controller, animated: false);
		}else{
			//这里需要指定类的类型XX.Type
			let controllerClass = NSClassFromString(className) as? UIViewController.Type;
			let controller = controllerClass!.init()
			controller.navigationItem.title = itemData?.name
			self.navigationController?.pushViewController(controller, animated: false);
		}
	
	}
	
	func changeString(newString: String) {
		print("回调的值\(newString)");
	}


}

