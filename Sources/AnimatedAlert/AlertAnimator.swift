//
//  AlertAnimator.swift
//
//
//  Created by Charles Prado on 15/09/2023.
//

import UIKit

public protocol AlertAnimator {
    var isAnimating: Bool { get set }

    func animate(alertView: AnimatedAlert, duration: TimeInterval, inView view: UIView, completion: @escaping () -> Void)
}
