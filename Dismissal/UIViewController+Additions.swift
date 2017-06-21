//
//  UIViewController+Additions.swift
//  Dismissal
//
//  Created by Patrick Maltagliati on 6/21/17.
//  Copyright © 2017 Patrick Maltagliati. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var topPresentedViewController: UIViewController {
        var current: UIViewController = self
        while let presented = current.presentedViewController {
            current = presented
        }
        return current
    }
    
    var rootPresentingViewController: UIViewController {
        var current = self
        while let presenting = current.presentingViewController {
            current = presenting
        }
        return current
    }
}
