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
        
        let redView = UIView(); redView.backgroundColor = .red
        let blueView = UIView(); blueView.backgroundColor = .blue
        let greenView = UIView(); greenView.backgroundColor = .green
        
        [redView, blueView, greenView].forEach { (view.addSubview($0))}
        view.addSubview(redView)
        
        redView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: nil, right: view.safeAreaLayoutGuide.trailingAnchor, btm: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 12), size: .init(width: 125, height: 0))
        
       
        redView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
        
        blueView.anchor(top: redView.bottomAnchor, left: nil, right: redView.trailingAnchor, btm: nil, padding: .init(top: 12, left: 0, bottom: 0, right: 0))
        
//        blueView.widthAnchor.constraint(equalTo: redView.widthAnchor).isActive = true  <--- also works as pair
//        blueView.heightAnchor.constraint(equalTo: blueView.widthAnchor).isActive = true <--- also works as pair
        
        blueView.anchorSize(to: redView)
        
        
        greenView.anchor(top: redView.topAnchor, left: view.safeAreaLayoutGuide.leadingAnchor, right: redView.leadingAnchor, btm: blueView.bottomAnchor, padding: .init(top: 0, left: 12, bottom: 0, right: 12))
    
        let purpleView = UIView(); purpleView.backgroundColor = .purple
        view.addSubview(purpleView)
        purpleView.fillSuperview()
    }
    
    

    
    
}


extension UIView {
    
    func fillSuperview() {
        anchor(top: superview?.topAnchor, left: superview?.leadingAnchor, right: superview?.trailingAnchor, btm: superview?.bottomAnchor)
    }
    
    func anchorSize(to view: UIView){
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchor (top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, right: NSLayoutXAxisAnchor?, btm: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero, size:CGSize = .zero ) {
        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
        topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let btm = btm {
        bottomAnchor.constraint(equalTo: btm, constant: -padding.bottom).isActive = true
        }
        
        if let left = left {
        leadingAnchor.constraint(equalTo: left, constant: padding.left).isActive = true
        }
        
        if let right = right {
        trailingAnchor.constraint(equalTo: right, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}

