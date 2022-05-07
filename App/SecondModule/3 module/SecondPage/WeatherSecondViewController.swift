//
//  WeatherSecondViewController.swift
//  App
//
//  Created by Владимир on 07.05.2022.
//

import UIKit

class WeatherSecondViewController : UIViewController {
    
    var flag = true
    
    private let welcomeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50)
        label.textColor = .white
        label.text = "CLCCC"
        return label
    }()
    
    private let image : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let button : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Group 11"), for: .normal)
        button.addTarget(nil, action: #selector(buttonTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        
        addLayout(label: welcomeLabel, image: image, button: button)
    }
    
    @objc
    private func buttonTap() {
        
        if flag {
            view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Group 21"))
            button.setImage(#imageLiteral(resourceName: "Group 16"), for: .normal)
            image.image = setWeather(time: "Night", weather: "Clear")
        } else {
            view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "XR"))
            button.setImage(#imageLiteral(resourceName: "Group 11"), for: .normal)
            image.image = setWeather(time: "Day", weather: "Clear")
        }
        flag = !flag
    }
}

