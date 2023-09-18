//
//  ToastAction.swift
//
//
//  Created by Charles Prado on 15/09/2023.
//

import UIKit

public struct ToastAction {
    var title: String
    var action: UIAction

    public init(title: String, action: UIAction) {
        self.title = title
        self.action = action
    }
}
