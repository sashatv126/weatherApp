//
//  AssemblyBuilder.swift
//  App
//
//  Created by Владимир on 23.03.2022.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createMainModule(router : RouterProtocol) -> UIViewController
    func createSeconModule(router : RouterProtocol, coordination : CoordinationModel?) -> UIViewController
}

class AssemblyBuilder : AssemblyBuilderProtocol {
    
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = ViewController()
        let presenter = MainPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    func createSeconModule(router: RouterProtocol, coordination: CoordinationModel?) -> UIViewController {
        let view = ViewController()
        return view
    }
}
