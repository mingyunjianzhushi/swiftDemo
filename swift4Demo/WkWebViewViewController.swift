//
//  WkWebViewViewController.swift
//  swift4Demo
//
//  Created by 命运 on 9/12/18.
//  Copyright © 2018 com.org.shunshiwei. All rights reserved.
//

import UIKit
import WebKit

class WkWebViewViewController: UIViewController{
	
	lazy var webView : WKWebView = {
		let webView = WKWebView()
		return webView
	}()

//	var webVew : WebView?

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Singleton.sharedInstance.age)
		print(Singleton.sharedInstance.name)
//		webVew = WebView();
//		webVew?.snp.makeConstraints({ (make) in
//			make.left.right.bottom.equalTo(self.view).offset(0)
//			make.top.equalTo(self.view.snp.top).offset(10)
//		})
//		webVew?.backgroundColor = UIColor.red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
