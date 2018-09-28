//
//  DateSelectManager.swift
//  swift4Demo
//
//  Created by 命运 on 9/26/18.
//  Copyright © 2018 com.org.shunshiwei. All rights reserved.
//

import UIKit

protocol DateSelectManagerDelegate {
	func getDateWithDateSelectManager(dataView : DateSelectManager,resultDateString : String)
}

public class DateSelectManager: UIView {
	/*标识*/
	var identity : String?
	/**返回数据的格式*/
	var backDateFormatStr : DateformatStr?
	/** 起止日期选择view里的起始日期 */
	var datePicker : UIDatePicker?
	/**回调代理*/
	var delegate : DateSelectManagerDelegate?
	private var dateBgView : UIView?
	private var tipStr:String?
	private var datePickerMode : UIDatePickerMode?
	
	convenience init(delegate:DateSelectManagerDelegate? , identity:String?,tipStr:String?,datePickerMode:UIDatePickerMode?){
		self.init()
		self.tipStr = tipStr
		self.identity = identity
		self.datePickerMode = datePickerMode
		self.delegate = delegate
		self.frame = kMainScreenFrameRect
		self.backgroundColor = UIColor(white: 0.2, alpha: 0.0)
		UIApplication.shared.windows[0].endEditing(true)
		UIApplication.shared.keyWindow?.addSubview(self)
		self.createDateView()
		UIView.animate(withDuration: 0.2) {
			self.backgroundColor = UIColor(white: 0.2, alpha: 0.7)
			self.dateBgView?.isHidden = false
		}
		
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(removeFromCurrentView))
		self.addGestureRecognizer(tapGesture)
	}
	
	class func showDateView(delegate:DateSelectManagerDelegate , identity:String,tipStr:String,datePickerMode:UIDatePickerMode) -> DateSelectManager{
		let dateSelectManager = DateSelectManager(delegate: delegate, identity: identity, tipStr: tipStr, datePickerMode: datePickerMode)
		return dateSelectManager
	}
	
	
	@objc func removeFromCurrentView(){
		
	}
	
	func createDateView(){
		let dateBgView = UIView()
		self.dateBgView = dateBgView
		self.addSubview(dateBgView)
		dateBgView.backgroundColor = UIColor.white
		dateBgView.snp.makeConstraints { (make) in
			make.bottom.equalTo(self.snp.bottom).offset(0)
			make.left.right.equalTo(self).offset(0)
			make.height.equalTo(220)
		}
		
		let cancelBtn = UIButton(type: .custom)
		cancelBtn.setTitle("取消", for: .normal)
		cancelBtn.setTitleColor(UIColor.black, for: .normal)
		cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
		cancelBtn.addTarget(self, action: #selector(clickDateViewCancelButton), for: .touchUpInside)
		dateBgView.addSubview(cancelBtn)
		cancelBtn.snp.makeConstraints { (make) in
			make.height.equalTo(40)
			make.width.equalTo(60)
			make.left.equalTo(dateBgView.snp.left)
			make.top.equalTo(dateBgView.snp.top)
		}
		
		let ensureBtn = UIButton(type: .custom)
		ensureBtn.setTitle("确定", for: .normal)
		ensureBtn.setTitleColor(UIColorFromRGB(color_vaule: 0x0389ED), for: .normal)
		ensureBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
		ensureBtn.addTarget(self, action: #selector(clickDateViewEnsureBtnButton), for: .touchUpInside)
		dateBgView.addSubview(ensureBtn)
		ensureBtn.snp.makeConstraints { (make) in
			make.height.equalTo(40)
			make.width.equalTo(60)
			make.right.equalTo(dateBgView.snp.right)
			make.top.equalTo(dateBgView.snp.top)
		}
		
		let wordLabel = UILabel(text: "", fontSize: 18, TextAlignment: .center, textColor: UIColorFromRGB(color_vaule: 0xb2b2b2))
		wordLabel.lineBreakMode = .byTruncatingTail
		wordLabel.sizeToFit()
		dateBgView.addSubview(wordLabel)
		wordLabel.snp.makeConstraints { (make) in
			make.centerX.equalTo(dateBgView.snp.centerX)
			make.centerY.equalTo(ensureBtn.snp.centerY)
			make.right.equalTo(ensureBtn.snp.right).offset(-5)
			make.left.equalTo(cancelBtn.snp.left).offset(5)
		}
		
		if self.tipStr != nil {
			wordLabel.text = self.tipStr
		}
		
		let datePicker = UIDatePicker()
		self.datePicker = datePicker
		datePicker.locale = Locale(identifier: getPreferredLanguage())
		if self.datePickerMode != nil {
			datePicker.datePickerMode = self.datePickerMode!
		}
		datePicker.minuteInterval = 1
		let fmt = DateFormatter()
		fmt.dateFormat = "yyyy-MM-dd"
		let miniDate = fmt.date(from: "2000-01-01")
		datePicker.minimumDate = miniDate
		
		dateBgView.addSubview(datePicker)
		
		datePicker.snp.makeConstraints { (make) in
			make.bottom.left.right.equalTo(0);
			make.top.equalTo(ensureBtn.snp.bottom).offset(0)
		}
		
	}
	
  	@objc	func clickDateViewCancelButton(){
		
	}
	
	@objc	func clickDateViewEnsureBtnButton(){
		
	}
}


