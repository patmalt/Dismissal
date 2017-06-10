//
//  ModalViewController.swift
//  Dismissal
//
//  Created by Patrick Maltagliati on 12/8/16.
//  Copyright © 2016 Patrick Maltagliati. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    weak var delegate: DismissDelegate?
    
    init(color: UIColor, delegate: DismissDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func present(sender: AnyObject) {
        let viewController = ModalViewController(color: self.randonColor(), delegate: self.delegate)
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func dismissToRoot(sender: AnyObject) {
        self.delegate?.dismissToRoot()
    }
    
    @IBAction func dismissOnce(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func randonColor() -> UIColor {
        let colors: [UIColor] = [.black, .darkGray, .lightGray, .white, .gray, .green,
                                 .blue, .cyan, .yellow, .magenta, .orange, .purple, .brown]
        return colors[Int(arc4random_uniform(UInt32(colors.count)))]
    }
}