//
//  customCellWidget.swift
//  SWCampus
//
//  Created by 11111 on 2017/3/14.
//  Copyright © 2017年 WanHang. All rights reserved.
//

import UIKit

public class customCellWidget: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCellSelectionStyle.none
        initBasicUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initBasicUI() {
        self.contentView.backgroundColor = ColorMethodho(hexValue: 0xffffff)
        
        let seline = CALayer.init()
        seline.backgroundColor = ColorMethodho(hexValue: 0xe6e6e6).cgColor
        seline.frame = CGRect.init(x: 15, y: ViewHeight(v: self.contentView), width: ViewWidh(v: self.contentView), height: 0.5)
        self.contentView.layer.addSublayer(seline)
    }

}
