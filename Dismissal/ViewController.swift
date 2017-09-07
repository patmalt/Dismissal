//
//  ViewController.swift
//  Dismissal
//
//  Created by Patrick Maltagliati on 12/8/16.
//  Copyright © 2016 Patrick Maltagliati. All rights reserved.
//

import UIKit

protocol DismissDelegate: class {
    func dismissFromRoot()
}

class ViewController: UIViewController {

    @IBAction func present(sender: AnyObject) {
        let viewController = ModalViewController(color: UIColor.red, delegate: self)
        self.present(viewController, animated: true, completion: nil)
    }
}

extension ViewController: DismissDelegate {
    func dismissFromRoot() {
        dismissFromRootViewController(animated: true)
    }
}
