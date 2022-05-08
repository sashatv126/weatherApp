//
//  UIKit + UIViewController.swift
//  App
//
//  Created by Владимир on 07.05.2022.
//

import UIKit

extension UIViewController {
    
    func addLayout(label : UILabel, image : UIImageView, button : UIButton, tempLabel : UILabel) {
        
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "XR"))
        
        label.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(tempLabel)
        
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -140),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor,constant: 160),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            image.heightAnchor.constraint(equalToConstant: 320)
        ])
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor,constant: 50),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            button.widthAnchor.constraint(equalToConstant: 48),
            button.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            tempLabel.bottomAnchor.constraint(equalTo: label.topAnchor,constant: -60),
            tempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setWeather(time : String, weather : String) -> UIImage {
        
        if time == "Day" && weather != "No Data" {
            let desc = ["Rain" : #imageLiteral(resourceName: "Group 23"), "Clear" : #imageLiteral(resourceName: "Group 19") , "Clouds" : #imageLiteral(resourceName: "Group 25")]
            
                return desc[weather] ?? #imageLiteral(resourceName: "Group 14")
        } else {
            
            let desc = ["Rain" : #imageLiteral(resourceName: "Group 23"), "Clear" : #imageLiteral(resourceName: "Group 27"), "Clouds" : #imageLiteral(resourceName: "Group 26")]
            
            return desc[weather] ?? #imageLiteral(resourceName: "Group 14")
        }
    }
}


