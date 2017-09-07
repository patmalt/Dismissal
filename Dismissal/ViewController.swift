
import UIKit

protocol DismissDelegate: class {
    func dismissFromRoot()
}

class ViewController: UIViewController {

    @IBAction func present(sender: AnyObject) {
        let viewController = ModalViewController(color: UIColor.red, delegate: self)
        present(viewController, animated: true, completion: nil)
    }
}

extension ViewController: DismissDelegate {
    func dismissFromRoot() {
        dismissFromRootViewController(animated: true)
    }
}
