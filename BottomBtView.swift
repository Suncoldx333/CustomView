


//  底部按钮视图，底色d9d9d9，按钮颜色333333,文字颜色ffffff
//
//  创建完之后，需设置代理，以及中间文字centerTitle属性
//
import UIKit

@objc(BottomBtViewDelegate)
protocol BottomBtViewDelegate {
    func BottomBtViewClickEvent()
}

public class BottomBtView: UIView {

    override init(frame: CGRect){
        super.init(frame: frame)
        initUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public var centerTitle : String{
        get{
            return self.title
        }
        set(title){
            self.changeCenterTitle(title: title)
        }
    }
    var delegate : BottomBtViewDelegate! = nil
    var title : String!
    var centerLabel : UILabel!
    
    func initUI() {
        
        self.backgroundColor = ColorMethodho(hexValue: 0xf9f9f9)
        
        let seLine = CALayer.init()
        seLine.backgroundColor = ColorMethodho(hexValue: 0xcccccc).cgColor
        seLine.frame = CGRect.init(x: 0, y: 0, width: ScreenWidth, height: 0.5)
        self.layer.addSublayer(seLine)
        
        centerLabel = UILabel.init(frame: CGRect.init(x: 15, y: 18, width: ScreenWidth - 30, height: 45))
        centerLabel.layer.masksToBounds = true
        centerLabel.layer.cornerRadius = 3
        centerLabel.isUserInteractionEnabled = true
        let centerLabelTap = UITapGestureRecognizer.init(target: self, action: #selector(LabelTap))
        centerLabel.addGestureRecognizer(centerLabelTap)
        centerLabel.backgroundColor = ColorMethodho(hexValue: 0x333333)
        centerLabel.textColor = ColorMethodho(hexValue: 0xffffff)
        centerLabel.font = UIFont.systemFont(ofSize: 15)
        centerLabel.textAlignment = NSTextAlignment.center
        self.addSubview(centerLabel)
    }

    func changeCenterTitle(title : String) {
        centerLabel.text = title
    }
    
    func LabelTap() {
        delegate.BottomBtViewClickEvent()
    }
}
