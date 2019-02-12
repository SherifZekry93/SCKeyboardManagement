//
//  NewAccountVC.swift
//  Halan
//
//  Created by Sherif  Wagih on 2/5/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class NewAccountVC: UIViewController,UITextFieldDelegate {
    
    lazy var mainView:NewAccountView = {
        let view = NewAccountView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        addNotificationObservers()
//        navigationController?.navigationBar.isHidden = false
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            var contentInset:UIEdgeInsets = self.mainView.scrollView.contentInset
            let distanceToBottom = mainView.frame.size.height - (mainView.loginFrameView.frame.size.height + mainView.loginFrameView.frame.origin.y)
            contentInset.bottom = abs(keyboardHeight - distanceToBottom)
            mainView.scrollView.contentInset = contentInset
            mainView.scrollView.bounces = false
        }
    }
    @objc func keyboardWillHide()
    {
        UIView.animate(withDuration: 0.3) {
            self.mainView.scrollView.contentInset = .zero
        }
    }
    func addNotificationObservers()
    {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
}
