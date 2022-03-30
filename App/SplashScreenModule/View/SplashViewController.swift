//
//  SplashViewController.swift
//  App
//
//  Created by Владимир on 26.03.2022.
//

import UIKit

class SplashViewController: UIViewController {
//MARK: -Views
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
        
        return label
    }()
//MARK: -Properties
        var presenter : SplashPresenter?
//MARK: -LifeCircle
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setlabel()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setBackground() {
        view.backgroundColor = .white
        let layer0 = CAGradientLayer()
        layer0.colors = [
        UIColor(red: 0.012, green: 0.663, blue: 0.957, alpha: 1).cgColor,
        UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor]
        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1.17, c: -1.17, d: 0, tx: 1.08, ty: 0))
        layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy:                      -0.5*view.bounds.size.height)
        layer0.position = view.center
        view.layer.addSublayer(layer0)
        self.view.addSubview(textLabel)
    }
    private func setlabel() {
        self.textLabel.text = self.presenter?.text?.text
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.widthAnchor.constraint(equalToConstant: 248).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 177).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 83).isActive = true
        textLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 359).isActive = true
    }
}
extension SplashViewController : SplashViewProtocol {
    func success() {
        print("Done")
    }
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
