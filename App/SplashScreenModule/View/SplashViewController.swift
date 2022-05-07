//
//  SplashViewController.swift
//  App
//
//  Created by Владимир on 26.03.2022.
//

import UIKit

final class SplashViewController: UIViewController {
//MARK: -Views
    var router : RouterProtocol?
    
    private lazy var textLabel : UILabel = {
        let label = UILabel()
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 0.5
        label.layer.shadowOffset = CGSize(width: 4, height: 4)
        label.layer.masksToBounds = false

        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 48)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Let's find out where you are"
        return label
    }()
//MARK: -Properties
   
//MARK: -LifeCircle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setBackground()
        setlabel()
        dismiss()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func dismiss() {
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {[weak self] in
            UIView.animate(withDuration: 1,animations: {
                self?.textLabel.alpha = 0
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                self?.router?.show()
            }
        }
    }
    
    private func setBackground() {
        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "XR"))
        self.view.addSubview(textLabel)
    }
    private func setlabel() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textLabel.widthAnchor.constraint(equalToConstant: 248),
            textLabel.heightAnchor.constraint(equalToConstant: 177)
        ])
    }
}
