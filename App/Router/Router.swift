//
//  Router.swift
//  App
//
//  Created by Владимир on 23.03.2022.
//

import Foundation
import UIKit
//add Router for navigation
class Router: RouterProtocol {
    
    var assemblyBuider: AssemblyBuilderProtocol?
    var nVC: UINavigationController?
    
    init(navigationController : UINavigationController, assebly : AssemblyBuilderProtocol ){
        self.nVC = navigationController
        self.assemblyBuider = assebly
    }
    
    func showSecondSplash() {
        if let navigationController = nVC {
           let vc = SplashSecondViewController()
            vc.router = self
            navigationController.viewControllers = [vc]
        }
    }
    
    func show() {
        
        if let navigationController = nVC {
            guard let vc = assemblyBuider?.createMainModule(router: self) else {return}
            navigationController.viewControllers = [vc]
        }
    }
    
    func initialViewController() {
        
        if let navigationController = nVC {
           let vc = SplashViewController()
            vc.router = self
            navigationController.viewControllers = [vc]
        }
    }
    func showSecondVC() {
        
        if let navigationController = nVC {
            guard let secondVc = assemblyBuider?.createSeconModule(router: self) else {return}
            navigationController.pushViewController(secondVc , animated: true)
        }
    }
    
    
}
