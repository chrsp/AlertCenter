//
//  ToastAction.swift
//
//
//  Created by Charles Prado on 15/09/2023.
//

import UIKit

public struct ToastAction {
    var title: String
    var target: AnyObject
    var selector: Selector

    public init(title: String, target: AnyObject, selector: Selector) {
        self.title = title
        self.target = target
        self.selector = selector
    }
}
