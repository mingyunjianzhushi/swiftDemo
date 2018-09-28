//
//  TableViewCell.swift
//  swfit demo
//
//  Created by 王 旭 on 2017/11/30.
//  Copyright © 2017年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class moduleCell: UITableViewCell {
	
	var nameLabel : UILabel?
	var ageLabel : UILabel?
	
	var tableViewModel : ModuleModel?{
		didSet{
			nameLabel?.text = tableViewModel?.name;
//			ageLabel?.text = String(format:"%d",(tableViewModel?.number)!);
		}
	}

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier);
		self.initCell();
	}
	
	required init?(coder aDecoder: NSCoder) {
		 fatalError("init(coder:) has not been implemented")
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func initCell(){
		self.nameLabel = UILabel.init()
		self.nameLabel?.backgroundColor = UIColor.clear;
		self.nameLabel?.text = "Title"
		self.nameLabel?.textColor = UIColor.black
		self.nameLabel?.font = UIFont.systemFont(ofSize: 15)
		self.nameLabel?.textAlignment = NSTextAlignment.center
		self.addSubview(self.nameLabel!)
		self.nameLabel?.snp.makeConstraints({ (make) -> Void in
			make.centerY.equalTo(self.snp.centerY).inset(0);
			make.left.equalTo(10);
		})
		
		self.accessoryType = .disclosureIndicator;
		self.ageLabel = UILabel.init()
		self.ageLabel?.backgroundColor = UIColor.clear;
		self.ageLabel?.frame = CGRect(x:0, y:30, width:100, height:30)
		self.ageLabel?.text = "Title"
		self.ageLabel?.textColor = UIColor.black
		self.ageLabel?.font = UIFont.systemFont(ofSize: 15)
		self.ageLabel?.textAlignment = NSTextAlignment.center
//		self.addSubview(self.ageLabel!)
		
	}

}
