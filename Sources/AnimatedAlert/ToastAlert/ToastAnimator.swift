//
//  ToastAnimator.swift
//
//
//  Created by Charles Prado on 15/09/2023.
//

import UIKit

public class ToastAnimator: AlertAnimator {
    public var isAnimating: Bool = false
    
    private var animator: UIViewPropertyAnimator?
    private var reverseAnimator: UIViewPropertyAnimator?
    
    public init() {}
    
    public func animate(alertView: AnimatedAlert,
                        duration delay: TimeInterval,
                        inView view: UIView,
                        completion: @escaping () -> Void
    ) {
        let spacing: CGFloat = 16
        let finalFrame = CGRect(x: spacing,
                                y: view.frame.height - alertView.frame.height - spacing * 1.4,
                                width: view.frame.width - (spacing * 2),
                                height: alertView.frame.height)
        
        var initialFrame = finalFrame
        initialFrame.origin.y += alertView.frame.height
        
        alertView.frame = initialFrame
        
        let timingParameters = UISpringTimingParameters(dampingRatio: 0.6, initialVelocity: CGVector(dx: 0, dy: 2))
        
        animator = UIViewPropertyAnimator(duration: 0.3, timingParameters: timingParameters)
        
        animator?.addAnimations {
            alertView.frame = finalFrame
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            self?.reverseAnimator = UIViewPropertyAnimator(duration: 0.3, timingParameters: timingParameters)
            
            self?.reverseAnimator?.addAnimations {
                alertView.layer.position.y += alertView.frame.height * 1.3
            }
            
            self?.reverseAnimator?.addCompletion { _ in
                self?.isAnimating = false
                completion()
            }
            
            self?.reverseAnimator?.startAnimation()
        }
        
        isAnimating = true
        animator?.startAnimation()
    }
}
