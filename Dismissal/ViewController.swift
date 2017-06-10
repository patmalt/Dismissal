//
//  ViewController.swift
//  Dismissal
//
//  Created by Patrick Maltagliati on 12/8/16.
//  Copyright © 2016 Patrick Maltagliati. All rights reserved.
//

import UIKit

protocol DismissDelegate: class {
    func dismissToRoot()
}

class ViewController: UIViewController {

    @IBAction func present(sender: AnyObject) {
        let viewController = ModalViewController(color: UIColor.red, delegate: self)
        self.present(viewController, animated: true, completion: nil)
    }
}

extension ViewController: DismissDelegate {
    func dismissToRoot() {
        if let presented = self.presentedViewController {
            let top = self.topPresentedViewController
            if top != presented {                
                if let snapshot = top.view.snapshotView(afterScreenUpdates: false) {
                    snapshot.frame = presented.view.frame
                    presented.view.addSubview(snapshot)
                }
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
}

extension ViewController {
    
    var topPresentedViewController: UIViewController {
        var current: UIViewController = self
        while let presented = current.presentedViewController {
            current = presented
        }
        return current
    }
}
