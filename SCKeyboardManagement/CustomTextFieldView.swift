//
//  CustomTextFieldView.swift
//  Halan
//
//  Created by Sherif  Wagih on 2/5/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class CustomTextFieldView: UIView {
    
    let mainTextField:LeftRightPaddedTextField = {
        let text = LeftRightPaddedTextField()
        return text
    }()
    
    let iconImageView : UIImageView = {
        let image = UIImageView()
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .mainGreen
        return image
    }()
    
    lazy var mailStack:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconImageView,mainTextField])
        //stack.alignment = .fill
        stack.alignment = .center
        return stack
    }()
    
    init()
    {
        super.init(frame: .zero)
        setupViews()
    }
    
    fileprivate func setupViews()
    {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.borderColor = UIColor.mainGreen.cgColor
        layer.borderWidth = 1
        addSubview(mailStack)
        mailStack.fillSuperView()
        iconImageView.anchorToView(size:.init(width: 30, height: 50))
    }
    
    override func layoutSubviews() {
        iconImageView.roundCorners([.topLeft,.bottomLeft], radius: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var image:UIImage?{
        didSet{
            iconImageView.image = image?.withRenderingMode(.alwaysTemplate)
            iconImageView.tintColor = .white
        }
    }
    
    var text:String {
        get{
            return mainTextField.text ?? ""
        }
    }
    
    var customPLaceHolder:String?
    {
        didSet{
            let attributedString = NSMutableAttributedString(string: customPLaceHolder ?? "", attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 18),NSAttributedString.Key.foregroundColor:UIColor.lightGray])
            mainTextField.attributedPlaceholder = attributedString
        }
    }
    
}
