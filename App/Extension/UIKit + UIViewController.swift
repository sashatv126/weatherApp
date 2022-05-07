//
//  UIKit + UIViewController.swift
//  App
//
//  Created by Владимир on 07.05.2022.
//

import UIKit

extension UIViewController {
    
    func addLayout(label : UILabel, image : UIImageView, button : UIButton) {
        
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "XR"))
        
        label.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -140),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                ])
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor,constant: 160),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 320),
            image.widthAnchor.constraint(equalToConstant: 414),
                ])
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor,constant: 50),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            button.widthAnchor.constraint(equalToConstant: 50),
            button.heightAnchor.constraint(equalToConstant: 50)
                ])
    }
}


