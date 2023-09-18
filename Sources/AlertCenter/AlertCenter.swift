//
//  AlertCenter.swift
//
//
//  Created by Charles Prado on 15/09/2023.
//

import UIKit

public protocol AlertCenter: AnyObject {
    associatedtype AlertView: AnimatedAlert
    var animator: AlertAnimator { get set }
    var alertQueue: [AlertView] { get set }
    func display(message: String, time: TimeInterval, onView: UIView?, action: ToastAction?)
}

public extension AlertCenter {
    func display(message: String, time: TimeInterval, onView view: UIView?, action: ToastAction? = nil)  {
        let alert = AlertView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        alert.configure(text: message, action: action)
        alertQueue.append(alert)

        if !animator.isAnimating {
            self.displayNextAlert(time: time, view: view)
        }
    }

    private func displayNextAlert(time: TimeInterval, view: UIView?) {
        guard !alertQueue.isEmpty else { return }

        let alertView = alertQueue.removeFirst()

        if let view = view {
            view.addSubview(alertView)
            animate(alertView: alertView, time: time, view: view)
        } else if let keyWindow = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first {
            keyWindow.addSubview(alertView)
            animate(alertView: alertView, time: time, view: keyWindow)
        }
    }

    private func animate(alertView: AlertView, time: TimeInterval, view: UIView) {
        animator.animate(alertView: alertView, duration: time, inView: view) {
            alertView.removeFromSuperview()
            self.displayNextAlert(time: time, view: view)
        }
    }
}
