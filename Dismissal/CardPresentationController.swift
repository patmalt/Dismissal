
import UIKit

class CardPresentationController: UIPresentationController {
    private let padding: CGFloat = 20
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    override func size(forChildContentContainer container: UIContentContainer,
                       withParentContainerSize parentSize: CGSize) -> CGSize
    {
        return CGSize(width: parentSize.width - 2 * padding,
                      height: parentSize.height - 2 * padding)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        let containerBounds = containerView?.bounds ?? CGRect.zero
        let containterSize = containerBounds.size
        let origin = CGPoint(x: padding, y: padding)
        let size = self.size(forChildContentContainer: presentedViewController,
                             withParentContainerSize: containterSize)
        return CGRect(origin: origin, size: size)
    }
}
