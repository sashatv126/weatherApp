//
//  WeatherThirdViewController.swift
//  App
//
//  Created by Владимир on 07.05.2022.
//

import UIKit

class WeatherThirdViewController : UIViewController {
    
    private let welcomeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50)
        label.text = "CLCCC"
        return label
    }()
    
    private let image = UIImageView()
    
    private let button : UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    override func viewDidLoad() {
        
        addLayout(label: welcomeLabel, image: image, button: button)
    }
}

