//
//  WeatherViewController.swift
//  App
//
//  Created by Владимир on 07.05.2022.
//

import UIKit

class WeatherViewController : UIViewController {
    
    var presenter : SecondViewPresenterProtocol!

    var flag = true
    
    private let welcomeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50)
        label.textColor = .white
        label.text = "CLCCC"
        return label
    }()
    
    private let tempLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 80)
        label.textColor = .white
        label.text = "CLCCC"
        return label
    }()
    
    private let button : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Group 11"), for: .normal)
        button.addTarget(nil, action: #selector(buttonTap), for: .touchUpInside)
        return button
    }()
    
    private let image : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override func viewDidLoad() {
        
        addLayout(label: welcomeLabel, image: image, button: button, tempLabel : tempLabel)
    }
    
    @objc
    private func buttonTap() {
        
        if flag {
            view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Group 21"))
            button.setImage(#imageLiteral(resourceName: "Group 16"), for: .normal)
            image.image = setWeather(time: "Night", weather: presenter.object?.weather?.first?.main ?? "")
        } else {
            view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "XR"))
            button.setImage(#imageLiteral(resourceName: "Group 11"), for: .normal)
            image.image = setWeather(time: "Day", weather: presenter.object?.weather?.first?.main ?? "")
        }
        flag = !flag
        
    }
}

extension WeatherViewController : ViewDelegateProtocol {
    func getData() {
        welcomeLabel.text = presenter.object?.weather?.first?.main
        image.image = setWeather(time: "Day", weather: (presenter.object?.weather?.first?.main) ?? "")
        let tempText = String(Int((presenter.object?.main?.temp)! - 273))
        let temp = Int((presenter.object?.main?.temp)! - 273)
        
        if temp > 0 {
            tempLabel.text = "+\(tempText)"
        } else {
            tempLabel.text = "-\(tempText)"
        }
    }
}

