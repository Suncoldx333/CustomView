

import UIKit

@objc(NetErrorDelegate)
protocol NetErrorDelegate {
    func reloadAllData()
    func jumpToNetSetting()
    
}

public class NetErrorView: UIView {

    override public init(frame : CGRect){
        super.init(frame: frame)
        initUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -----Var-----
    var delegate : NetErrorDelegate! = nil
    
    //MARK: -----initUI-----
    func initUI() {
        
        self.backgroundColor = UIColor.clear
        
        let Height : CGFloat = 100 * (ScreenHeight/667)
        let ImageW : CGFloat = 30
        let ImageH : CGFloat = 25
        let ImageY = Height
        let ImageX = (ScreenWidth - ImageW)/2
        
        let netErrorImageView = UIImageView.init(frame: CGRect.init(x: ImageX, y: ImageY, width: ImageW, height: ImageH))
        netErrorImageView.image = #imageLiteral(resourceName: "notNetWorkin.png")
        self .addSubview(netErrorImageView)
        
        let tipLabel : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: netErrorImageView.frame.maxY + 25, width: ScreenWidth, height: 13))
        tipLabel.textColor = ColorMethodho(hexValue: 0x333333)
        tipLabel.textAlignment = NSTextAlignment.center
        tipLabel.text = "网络请求失败"
        tipLabel.font = UIFont.systemFont(ofSize: 13)
        self .addSubview(tipLabel)
        
        let checkNetWoringBtn : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: tipLabel.frame.maxY + 15, width: ScreenWidth, height: 10))
        checkNetWoringBtn .addTarget(self, action: #selector(setNetWorkingEvent), for: UIControlEvents.touchUpInside)
        checkNetWoringBtn .setTitleColor(ColorMethodho(hexValue: 0xb2b2b2), for: UIControlState.normal)
        checkNetWoringBtn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        checkNetWoringBtn .setTitle("请检查您的网络设置", for: UIControlState.normal)
        self .addSubview(checkNetWoringBtn)
        
        let lengthLabel = UILabel.init()
        lengthLabel.font = UIFont.systemFont(ofSize: 10)
        lengthLabel.text = "请检查您的网络设置"
        lengthLabel .sizeToFit()
        let labelLength : CGFloat = lengthLabel.bounds.size.width
        let layer : CALayer = CALayer.init()
        layer.frame = CGRect.init(x: (ScreenWidth - labelLength)/2, y: checkNetWoringBtn.frame.maxY, width: labelLength, height: 0.5)
        layer.backgroundColor = ColorMethodho(hexValue: 0xb2b2b2).cgColor
        self.layer .addSublayer(layer)
        
        let reloadDataBtn : UIButton = UIButton.init(frame: CGRect.init(x: (ScreenWidth - 80)/2, y: layer.frame.maxY + 35, width: 80, height: 30))
        reloadDataBtn .addTarget(self, action: #selector(reloadData), for: UIControlEvents.touchUpInside)
        reloadDataBtn .setTitleColor(ColorMethodho(hexValue: 0xffffff), for: UIControlState.normal)
        reloadDataBtn.backgroundColor = ColorMethodho(hexValue: 0x00c18b)
        reloadDataBtn.layer.masksToBounds = true
        reloadDataBtn.layer.cornerRadius = 3
        reloadDataBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        reloadDataBtn .setTitle("重新加载", for: UIControlState.normal)
        self .addSubview(reloadDataBtn)
    }
    
    //MARK: -----BtnEvent-----
    func setNetWorkingEvent() {
        delegate .jumpToNetSetting()
    }
    
    func reloadData() {
        delegate .reloadAllData()
    }

}
