//
//  WeatherThirdViewController.swift
//  App
//
//  Created by Владимир on 07.05.2022.
//

import UIKit

class WeatherThirdViewController : UIViewController {
    
    private let welcomeLabel = UILabel()
    
    override func viewDidLoad() {
        view.backgroundColor = .yellow
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)
        
        welcomeLabel.text = "CLCCC"
        
        NSLayoutConstraint.activate([
                    welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 160),
                    welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                ])
    }
}


