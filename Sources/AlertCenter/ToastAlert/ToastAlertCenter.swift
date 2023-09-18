//
//  ToastAlertCenter.swift
//
//
//  Created by Charles Prado on 15/09/2023.
//

import Foundation
import Combine

public class ToastAlertCenter<AlertView: MDCSnackbarToastAlert>: AlertCenter {
    public var animator: AlertAnimator
    @Published public var alertQueue: [AlertView]

    public init(animator: AlertAnimator = ToastAnimator(), alertQueue: [AlertView] = []) {
        self.animator = animator
        self.alertQueue = alertQueue
    }
}
