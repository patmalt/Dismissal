
import UIKit

class ModalViewController: UIViewController {
    
    weak var delegate: DismissDelegate?
    
    init(color: UIColor, delegate: DismissDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func present(sender: AnyObject) {
        let viewController = ModalViewController(color: randonColor(), delegate: delegate)
        present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func dismissToRoot(sender: AnyObject) {
        dismissToRootViewController(animated: true)
    }
    
    @IBAction func dismissFromRoot() {
        delegate?.dismissFromRoot()
    }
    
    @IBAction func dismissOnce(sender: AnyObject) {
        dismiss(animated: true)
    }
    
    private func randonColor() -> UIColor {
        let colors: [UIColor] = [.black, .darkGray, .lightGray, .white, .gray, .green,
                                 .blue, .cyan, .yellow, .magenta, .orange, .purple, .brown]
        return colors[Int(arc4random_uniform(UInt32(colors.count)))]
    }
}
