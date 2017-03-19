

import UIKit

public class UpdateViewSwift: UIView {

    override init(frame : CGRect){
        super.init(frame: frame)

        initUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:-----Var-----
    var updateBgWin : UIWindow = UIWindow.init()
    var updateInfoView = UIView.init()
    var updateInfoViewWidth : CGFloat = 280
    var titleLabel = UILabel.init()
    var subTitleLabel = UILabel.init()
    var doUpdateBt : UIButton!
    var undoUpteBt : UIButton!
    
    var updateStatus : Bool!
    
    //MARK:-----UI-----
    func initUI() {
        
        updateStatus = false
        
        updateBgWin.frame = CGRect.init(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
        updateBgWin.backgroundColor = UIColor.clear
        updateBgWin.windowLevel = UIWindowLevelAlert
        
        self.backgroundColor = ColorMethodho(hexValue: 0x333333).withAlphaComponent(0.4)
        
        updateInfoView.frame = CGRect.init(x: (ScreenWidth - updateInfoViewWidth)/2, y: 225, width: updateInfoViewWidth, height: 100)
        updateInfoView.layer.masksToBounds = true
        updateInfoView.layer.cornerRadius = 4
        updateInfoView.backgroundColor = ColorMethodho(hexValue: 0xffffff).withAlphaComponent(0.98)
        self .addSubview(updateInfoView)
        
        titleLabel.frame = CGRect.init(x: 0, y: 30, width: updateInfoViewWidth, height: 13)
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.textColor = ColorMethodho(hexValue: 0x333333)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 13)
        updateInfoView .addSubview(titleLabel)
        
        subTitleLabel.frame = CGRect.init(x: 15, y: 58, width: updateInfoViewWidth - 30, height: 15)
        subTitleLabel.numberOfLines = 0
        updateInfoView .addSubview(subTitleLabel)
        
        doUpdateBt = UIButton.init(type: UIButtonType.custom)
        doUpdateBt.frame = CGRect.init(x: 0, y: 0, width: 120, height: 40)
        doUpdateBt.layer.masksToBounds = true
        doUpdateBt.layer.cornerRadius = 3
        doUpdateBt .backgroundColor = ColorMethodho(hexValue: 0x00c18b)
        doUpdateBt .setTitle("立即升级", for: UIControlState.normal)
        doUpdateBt .setTitleColor(ColorMethodho(hexValue: 0xffffff), for: UIControlState.normal)
        doUpdateBt.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        doUpdateBt .addTarget(self, action: #selector(jumpToAppStore), for: UIControlEvents.touchUpInside)
        updateInfoView .addSubview(doUpdateBt)
        
        undoUpteBt = UIButton.init(type: UIButtonType.custom)
        undoUpteBt .frame = CGRect.init(x: 0, y: 0, width: 120, height: 40)
        undoUpteBt.layer.masksToBounds = true
        undoUpteBt.layer.cornerRadius = 3
        undoUpteBt.layer.borderWidth = 0.5
        undoUpteBt.layer.borderColor = ColorMethodho(hexValue: 0xe6e6e6).cgColor
        undoUpteBt .setTitle("以后再说", for: UIControlState.normal)
        undoUpteBt .setTitleColor(ColorMethodho(hexValue: 0xb2b2b2), for: UIControlState.normal)
        undoUpteBt.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        undoUpteBt .backgroundColor = ColorMethodho(hexValue: 0xf5f5f5)
        undoUpteBt .addTarget(self, action: #selector(removeUpdateView), for: UIControlEvents.touchUpInside)
        
    }
    
    //MARK:-----Method-----
    public func update(title : String,subTitle : String,size : String,optional : Bool){
        changeTitle(titlelStr: title)
        changeSubTitle(subTitle: subTitle)
        subTitleLabel .sizeToFit()
        let subLabelWidth = subTitleLabel.frame.width
        let subLabelHeight = subTitleLabel.frame.height
        let titleMaxY = titleLabel.frame.maxY
        
        if subLabelWidth < updateInfoViewWidth {
            let subCenX = updateInfoViewWidth/2
            let subCenY = titleMaxY + 12.5 + subLabelHeight/2
            subTitleLabel.center = CGPoint.init(x: subCenX, y: subCenY)
            
        }
        
        let subLabelMaxY = subTitleLabel.frame.maxY
        
        if optional {
            
            updateStatus = true
            
            updateInfoView .addSubview(undoUpteBt)
            undoUpteBt.frame = CGRect.init(x: 15, y: subLabelMaxY + 28.5, width: 120, height: 40)
            let undoBtMaxX = undoUpteBt.frame.maxX
            let undoBtMaxY = undoUpteBt.frame.maxY
            doUpdateBt.frame = CGRect.init(x: undoBtMaxX + 10, y: subLabelMaxY + 28.5, width: 120, height: 40)
            updateInfoView.frame = CGRect.init(x: (ScreenWidth - updateInfoViewWidth)/2, y: 225, width: updateInfoViewWidth, height: undoBtMaxY + 15)
        }else{
            
            updateStatus = false
            
            let sizeTitle = "立即升级（" + size + "M)"
//            changeTitle(titlelStr: sizeTitle)
            doUpdateBt.frame = CGRect.init(x: 15, y: subLabelMaxY + 28.5, width: updateInfoViewWidth - 30, height: 40)
            doUpdateBt .setTitle(sizeTitle, for: UIControlState.normal)
            let doUpBtMaxY = doUpdateBt.frame.maxY
            updateInfoView.frame = CGRect.init(x: (ScreenWidth - updateInfoViewWidth)/2, y: 225, width: updateInfoViewWidth, height: doUpBtMaxY + 15)
        }
        
    }
    
    public func show(){
        updateBgWin.isHidden = false
        updateBgWin .addSubview(self)
    }
    
    func enterAni(aniTime : Float) {
        UIView.animate(withDuration: TimeInterval(aniTime),
                       animations: { 
                        
            }) { (true) in
                self.backgroundColor = ColorMethodho(hexValue: 0x333333).withAlphaComponent(0.4)
        }
    }
    
    func changeTitle(titlelStr : String){
     
        let Attr = NSMutableAttributedString.init(string: titlelStr)
        
        let Font_13 = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 13)]
        let Color = [NSForegroundColorAttributeName : ColorMethodho(hexValue: 0x333333)]
        
        Attr .addAttributes(Font_13, range: NSRange.init(location: 0, length: titlelStr.characters.count))
        Attr .addAttributes(Color, range: NSRange.init(location: 0, length: titlelStr.characters.count))
        
        titleLabel.attributedText = Attr
    }
    
    func changeSubTitle(subTitle : String) {
        let attr = NSMutableAttributedString.init(string: subTitle)
        
        let Font_12 = [NSFontAttributeName : UIFont.systemFont(ofSize: 12)]
        let Color_gray = [NSForegroundColorAttributeName : ColorMethodho(hexValue: 0xb2b2b2)]
        attr .addAttributes(Font_12, range: NSRange.init(location: 0, length: subTitle.characters.count))
        attr .addAttributes(Color_gray, range: NSRange.init(location: 0, length: subTitle.characters.count))
        
        let Paragraph = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        Paragraph.alignment = NSTextAlignment.center
        Paragraph.lineSpacing = 3.5
        Paragraph.paragraphSpacingBefore = 0
        Paragraph.paragraphSpacing = 0
        let Para = [NSParagraphStyleAttributeName : Paragraph];
        attr .addAttributes(Para, range: NSRange.init(location: 0, length: subTitle.characters.count))
        
        subTitleLabel.attributedText = attr
    }
    
    func removeUpdateView() {
        updateBgWin .isHidden = true
    }
    
    func jumpToAppStore(){
        
        let APPStoreURL = URL.init(string: "itms-apps://itunes.apple.com/app/whosyourdaddy")
        
//        UIApplication.shared.open(APPStoreURL, options: [:]) { (true) in
//            
//        }
        
        if updateStatus == false {
            
        }else{
            removeUpdateView()
        }
        
        UIApplication.shared.openURL(APPStoreURL!)
        
    }
}
