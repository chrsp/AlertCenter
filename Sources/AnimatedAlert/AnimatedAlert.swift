//
//  AnimatedAlert.swift
//
//
//  Created by Charles Prado on 15/09/2023.
//

import UIKit

public protocol AnimatedAlert: UIView {
    func configure(text: String, action: ToastAction?)
}

public extension AnimatedAlert {
    func configure(text: String, action: ToastAction? = nil) {

    }
}
