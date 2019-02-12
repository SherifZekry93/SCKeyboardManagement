//
//  LeftRightPaddedTextField.swift
//  Halan
//
//  Created by Sherif  Wagih on 2/4/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
class LeftRightPaddedTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 8, dy: 0)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 8, dy: 0)
    }
}
