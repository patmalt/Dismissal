
import UIKit

protocol DismissDelegate: class {
    func dismissFromRoot()
}

class ViewController: UIViewController {
    private var presentationStyle: UIModalPresentationStyle = .custom
    private var transitionDelegate: UIViewControllerTransitioningDelegate? {
        return presentationStyle == .custom ? self : nil
    }

    @IBAction func present(sender: AnyObject) {
        let viewController = ModalViewController(color: UIColor.red, delegate: self)
        viewController.transitioningDelegate = transitionDelegate
        viewController.modalPresentationStyle = presentationStyle
        present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func modalSwitchToggled(_ sender: UISwitch) {
        presentationStyle = sender.isOn ? .custom : .fullScreen
    }
}

extension ViewController: DismissDelegate {
    func dismissFromRoot() {
        dismissFromRootViewController(animated: true)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CardViewControllerAnimatedTransitioning.present()
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CardViewControllerAnimatedTransitioning.dismiss()
    }
}
