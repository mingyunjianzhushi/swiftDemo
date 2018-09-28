//
//  UIAlertController+TJLAlertView.swift
//  swift4Demo
//
//  Created by 命运 on 9/26/18.
//  Copyright © 2018 com.org.shunshiwei. All rights reserved.
//

import UIKit
//用于UIAlertController的文字偏移
var subviews : [UIView]?
extension UIAlertController{
	var TJL_titleLabel : UILabel?{
		
		get{
			if TJL_viewArray(root: self.view) != nil {
				return TJL_viewArray(root: self.view)![1] as? UILabel
			}
			return nil
		}
	}
	var TJL_messageLabel : UILabel?{
		
		get{
			
			if TJL_viewArray(root: self.view) != nil {
			
				return TJL_viewArray(root: self.view)![2] as? UILabel
			}
			return nil
		}
	}
	
	
	func TJL_viewArray(root:UIView) -> [UIView]?{
		
		subviews = nil
		for item in root.subviews{
			
			if subviews != nil {
				break
			}
			
			if item is UILabel{
				subviews = root.subviews
				return subviews!
			}
			
			TJL_viewArray(root: item)
		}
		
		return subviews
	}
	
	
}

