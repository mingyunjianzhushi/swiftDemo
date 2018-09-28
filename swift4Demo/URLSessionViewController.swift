//
//  URLSessionViewController.swift
//  swift4Demo
//
//  Created by 命运 on 2018/8/10.
//  Copyright © 2018年 com.org.shunshiwei. All rights reserved.
//

import UIKit
import Alamofire

class URLSessionViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationItem.title = "原生请求";
        // Do any additional setup after loading the view.
		
//		let url2 = "https://api.douban.com/v2/book/1220562"
//		[URLSessionViewController .zyGETWithURLSession(url2, parmas: nil, mathFunction: { (data) in
//			print(data);
//		})];
		
		let string = "Hello"
		let name = type(of: string)
		print(name)
		
		let dic : [String:Any] = ["forward":"true","page_size":30,"school_id":106,"tagid":0]
		print(type(of: dic))
		
		let urlStr = URL_BaseUrl + URL_GetNewsList
		URLSessionViewController.zyPOSTwithURLSession(urlStr, parmas: dic as NSDictionary) { (data) in
//			print(data);
			let temp = data as! Dictionary<String, Any>
			let code = data["code"]! as! String
			print(Int(code)!);
			if Int(code)! != 0{
				return
			}
			
			
			let dataArray = data["target"] as! [AnyObject]
			self.pariseData(array: dataArray)
			let newsList = [schoolNewModel].deserialize(from: dataArray)
			
			for model in newsList!{
				let publish_time = model?.publish_time
				let name = model?.name
				
				print("名字是\(name!),发布的时间是\(publish_time!)")
				
			}
			
		}
		
    }
	
	//使用原生解析
	func pariseData(array:[AnyObject]){
		//创建数组
		var dataArray = [schoolNewModel]();
		
		for dic in array{
			let temp = dic as! Dictionary<String, Any>
			let moduleModel = schoolNewModel();
			moduleModel.name = temp["name"] as? String;
			moduleModel.publish_time = temp["publish_time"] as? String
			
			dataArray.append(moduleModel);
		}
		
	}
	
	func AlamofireDemo(){

	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	/*
	URLSessionDataTask: 处理从HTTP get请求中从服务器获取数据到内存中。
	URLSessionUploadTask:上传硬盘中的文件到服务器，一般是HTTP POST 或 PUT方式
	URLSessionDownloadTask: 从远程服务器下载文件到临时文件位置。
	*/
	
	class func zyGETWithURLSession(_ urlString:String,parmas:NSDictionary?,mathFunction:@escaping (_ responObject:AnyObject)->Void){
		
		let session = URLSession.shared;
		var str:String = ""
	
		if parmas != nil {
			str = self.parmasStringWithParmas(parmas!);
		}else{
			str = "";
		}
		
		let url = URL(string: String(format: "%@?%@", urlString,str));
		print(url!);
		let task = session.dataTask(with: url!, completionHandler: { (data, respons, eror) -> Void in
			if data != nil{
				let responsobject = try?JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments);
				
				mathFunction(responsobject! as AnyObject);
			}else{
				mathFunction("file" as AnyObject);
			}
			
			
		})
		task.resume();
	}
	
	
	class func zyPOSTwithURLSession(_ urlString:String,parmas:NSDictionary,mathFunction:@escaping (_ responObject:AnyObject)->Void){
		
		let session = URLSession.shared;
		
		let str = self.parmasStringWithParmas(parmas);
		let url = URL(string: urlString);
		
		var request = URLRequest(url: url!);
		
		request.httpMethod = "POST";
		
		request.httpBody = str.data(using: String.Encoding.utf8);
		
		let task = session.dataTask(with:request, completionHandler: { (data, respons, error) -> Void in
			
			if data != nil{
				let responsobject = try?JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments);
				
				mathFunction(responsobject! as AnyObject);
			}else{
				mathFunction("file" as AnyObject);
			}
		})
		
		task.resume();
	}
	
	
	class func parmasStringWithParmas(_ parmas:NSDictionary)->String{
		
//		let parString = NSMutableString();
		var parString = ""
		let arr = parmas.allKeys as NSArray;
		for i in 0 ..< arr.count{
			let key = arr[i] as! String;
			let value = parmas.object(forKey: arr[i]);
//			parString.appendFormat("%@=%@", key,value);
			parString += "\(key)=\( value!)"
			
			let lastKey = arr.lastObject as! String;
			if (key != lastKey) {
				parString += "&"
//				parString.appendFormat("&");
			}
			
			
		}
		return parString;
	}
	


}




