//
//  NewAccountView.swift
//  Halan
//
//  Created by Sherif  Wagih on 2/5/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class NewAccountView: UIView {
    
    let scrollView:UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.backgroundColor = .clear
        scroll.bounces = false
        scroll.contentInset = .zero
        scroll.contentInsetAdjustmentBehavior = .never
        return scroll
    }()
    
    let contentView:UIView = {
        let view = UIView()
        return view
    }()
    
    let loginFrameView:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.borderColor = UIColor(white: 0.3, alpha: 0.4).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let loginFrameTitle:UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Register", comment: "")
        label.backgroundColor = .mainGreen
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.clipsToBounds = true
        label.textColor = .white
        return label
    }()
    
    let nameTextField:CustomTextFieldView = {
        let text = CustomTextFieldView()
        text.customPLaceHolder = NSLocalizedString("Name", comment: "")
        text.image = #imageLiteral(resourceName: "profile_selected")
        return text
    }()
    
    let emailTextField:CustomTextFieldView = {
        let text = CustomTextFieldView()
        text.customPLaceHolder = NSLocalizedString("Email", comment: "")
        text.image = #imageLiteral(resourceName: "profile_selected")
        return text
    }()
    
    let passwordTextField:CustomTextFieldView = {
        let text = CustomTextFieldView()
        text.customPLaceHolder = NSLocalizedString("Password", comment: "")
        text.image = #imageLiteral(resourceName: "profile_selected")
        return text
    }()
    
    let phoneTextField:CustomTextFieldView = {
        let text = CustomTextFieldView()
        text.customPLaceHolder = NSLocalizedString("Phone", comment: "")
        text.image = #imageLiteral(resourceName: "profile_selected")
        return text
    }()
    
    lazy var mainStackView:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameTextField,emailTextField,passwordTextField,phoneTextField])
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.axis = .vertical
        return stack
    }()
    
    lazy var reigsterButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(NSLocalizedString("Register", comment: ""), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.backgroundColor = .mainGreen
        button.layer.cornerRadius = 10
        //button.addTarget(delegate, action: #selector(delegate?.didTapRegisterButton), for: .touchUpInside)
        return button
    }()
    //weak var delegate:NewAccountVProtocol?
    init()
    {
        super.init(frame: .zero)
//        self.delegate = delegate
        setupGradientLayer()
        addSubview(scrollView)
        scrollView.fillSuperView()
        scrollView.addSubview(contentView)
        contentView.fillSuperView()
        contentView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        contentView.addSubview(loginFrameView)
        loginFrameView.addSubview(loginFrameTitle)
        loginFrameView.anchorToView(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 430),centerV: true)
        loginFrameTitle.anchorToView(top: loginFrameView.topAnchor, leading: loginFrameView.leadingAnchor, bottom: nil, trailing: loginFrameView.trailingAnchor, padding: .zero, size: .init(width: 0, height: 100))
        loginFrameView.addSubview(mainStackView)
        mainStackView.anchorToView(top: loginFrameTitle.bottomAnchor, leading: loginFrameTitle.leadingAnchor, bottom: nil, trailing: loginFrameTitle.trailingAnchor, padding: .init(top: 20, left: 10, bottom: 10, right: 10), size: .init(width: 0, height: 230))
        loginFrameView.addSubview(reigsterButton)
        reigsterButton.anchorToView(top: mainStackView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 120, height: 50), centerH: true)
    }
    let gradientLayer = CAGradientLayer()
    fileprivate func setupGradientLayer()
    {
        let topColor = UIColor.white.cgColor
        let bottomColor = UIColor.mainGreen.cgColor
        gradientLayer.locations = [0,1.1]
        gradientLayer.colors = [topColor,bottomColor]
        gradientLayer.frame = frame
        gradientLayer.bounds = bounds
        gradientLayer.zPosition = -1
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews()
    {
        gradientLayer.frame = frame
        gradientLayer.bounds = bounds
        loginFrameTitle.roundCorners([.topLeft,.topRight], radius: 15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
