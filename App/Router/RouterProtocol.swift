//
//  RouterProtocol.swift
//  App
//
//  Created by Владимир on 07.05.2022.
//

import UIKit

protocol MainRouterProtocol {
    
    var nVC : UINavigationController? {get set}
    var assemblyBuider : AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol : MainRouterProtocol{
    
    func initialViewController()
    func showSecondVC()
    func showSecondSplash()
    func show()
    
}
