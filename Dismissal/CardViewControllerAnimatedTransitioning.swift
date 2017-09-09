
import UIKit

class CardViewControllerAnimatedTransitioning {
    private static let duration: TimeInterval = 0.45
    
    static func present() -> UIViewControllerAnimatedTransitioning {
        return CardPresentingViewControllerAnimatedTransitioning()
    }
    
    static func dismiss() -> UIViewControllerAnimatedTransitioning {
        return CardDismissingViewControllerAnimatedTransitioning()
    }
    
    private class CardPresentingViewControllerAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
        func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
            return CardViewControllerAnimatedTransitioning.duration
        }
        
        func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
            let containerView = transitionContext.containerView
            guard let presentingViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
                let presentedViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else
            {
                transitionContext.completeTransition(false)
                return
            }
            
            presentedViewController.view.frame = presentingViewController.view.bounds
            containerView.insertSubview(presentedViewController.view, aboveSubview: presentingViewController.view)
            
            presentedViewController.view.transform = CGAffineTransform(scaleX: 0, y: 0)
            let animations = {
                presentedViewController.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            let completion = { (completed: Bool) in
                transitionContext.completeTransition(completed)
            }
            
            UIView.animate(withDuration: transitionDuration(using: transitionContext),
                           animations: animations,
                           completion: completion)
        }
    }
    
    private class CardDismissingViewControllerAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
        func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
            return CardViewControllerAnimatedTransitioning.duration
        }
        
        func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
            guard let presentedViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else
            {
                transitionContext.completeTransition(false)
                return
            }
            
            let animations = {
                presentedViewController.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            }
            let completion = { (completed: Bool) in
                transitionContext.completeTransition(completed)
            }
            
            UIView.animate(withDuration: transitionDuration(using: transitionContext),
                           animations: animations,
                           completion: completion)
        }
    }
}
