//
//  ViewController.swift
//  autoLayoutExtensions
//
//  Created by admin on 2/1/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let redView = UIView()
        redView.backgroundColor = .red
        
        view.addSubview(redView)
        
        redView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, btm: view.safeAreaLayoutGuide.bottomAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
    }
}


extension UIView {
    func anchor (top: NSLayoutYAxisAnchor, left: NSLayoutXAxisAnchor, right: NSLayoutXAxisAnchor, btm: NSLayoutYAxisAnchor, padding: UIEdgeInsets = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false

        topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        bottomAnchor.constraint(equalTo: btm, constant: -padding.bottom).isActive = true
        leadingAnchor.constraint(equalTo: left, constant: padding.left).isActive = true
        trailingAnchor.constraint(equalTo: right, constant: -padding.right).isActive = true
    }
}

