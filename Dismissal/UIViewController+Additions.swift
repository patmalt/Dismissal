
import UIKit

extension UIViewController {
    
    var topPresentedViewController: UIViewController? {
        guard var presentedViewController = self.presentedViewController else {
            return nil
        }
        
        while let nextPresentedViewController = presentedViewController.presentedViewController {
            presentedViewController = nextPresentedViewController
        }
        return presentedViewController
    }
    
    func dismissFromRootViewController(animated: Bool, completion: (() -> ())? = nil) {
        guard let presentedViewController = self.presentedViewController else {
            return
        }
        
        if animated,
            let topPresentedViewController = self.topPresentedViewController,
            presentedViewController != topPresentedViewController
        {
            if let snapshot = topPresentedViewController.view.snapshotView(afterScreenUpdates: false) {
                snapshot.frame = presentedViewController.view.frame
                presentedViewController.view.addSubview(snapshot)
            }
        }
        
        dismiss(animated: animated, completion: completion)
    }
    
    var rootPresentingViewController: UIViewController? {
        guard var presentingViewController = self.presentingViewController else {
            return nil
        }
        
        while let nextPresentingViewController = presentingViewController.presentingViewController {
            presentingViewController = nextPresentingViewController
        }
        return presentingViewController
    }
    
    func dismissToRootViewController(animated: Bool, completion: (() -> ())? = nil) {
        if let rootPresentingViewController = self.rootPresentingViewController {
            if animated,
                let rootPresented = rootPresentingViewController.presentedViewController,
                let snapshot = view.snapshotView(afterScreenUpdates: false)
            {
                snapshot.frame = rootPresented.view.frame
                rootPresented.view.addSubview(snapshot)
            }
            rootPresentingViewController.dismiss(animated: animated, completion: completion)
        }
    }
}
