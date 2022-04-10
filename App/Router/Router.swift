//
//  Router.swift
//  App
//
//  Created by Владимир on 23.03.2022.
//

import Foundation
import UIKit
//add Router for navigation 
protocol MainRouterProtocol {
    var nVC : UINavigationController? {get set}
    var assemblyBuider : AssemblyBuilderProtocol? { get set }
}
protocol RouterProtocol : MainRouterProtocol{
    func initialViewController()
    func showSecondVC(coordination : CoordinationModel?)
    func show()
    
}
class Router: RouterProtocol {
    func show() {
        if let navigationController = nVC {
            guard let vc = assemblyBuider?.createMainModule(router: self) else {return}
            navigationController.viewControllers = [vc]
        }
    }
    
    
    var assemblyBuider: AssemblyBuilderProtocol?
    
    var nVC: UINavigationController?
    
    init(navigationController : UINavigationController, assebly : AssemblyBuilderProtocol ){
        self.nVC = navigationController
        self.assemblyBuider = assebly
    }
    
    
    func initialViewController() {
        if let navigationController = nVC {
           let vc = SplashViewController()
            vc.router = self
            navigationController.viewControllers = [vc]
        }
    }
    func showSecondVC(coordination: CoordinationModel?) {
        if let navigationController = nVC {
            guard let secondVc = assemblyBuider?.createSeconModule(router: self, coordination: coordination) else {return}
            navigationController.pushViewController(secondVc , animated: true)
        }
    }
    
    
}
