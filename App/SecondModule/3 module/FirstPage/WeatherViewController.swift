//
//  WeatherViewController.swift
//  App
//
//  Created by Владимир on 07.05.2022.
//

import UIKit

class WeatherViewController : UIViewController {
    
    private let welcomeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50)
        label.text = "CLCCC"
        return label
    }()
    
    private let button : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "dddd"), for: .normal)
        return button
    }()
    
    private let image = UIImageView()
    
    override func viewDidLoad() {
        
        addLayout(label: welcomeLabel, image: image, button: button)
    }
}
