//
//  AssemblyBuilder.swift
//  App
//
//  Created by Владимир on 23.03.2022.
//

import UIKit
//Builder, which use for build the modules
protocol AssemblyBuilderProtocol {
    
    func createMainModule(router : RouterProtocol) -> UIViewController
    func createSeconModule(router : RouterProtocol) -> UIViewController
    func createFirstPage() -> UIViewController
    func createSecondPage() -> UIViewController
    func createThirdPage() -> UIViewController
    
}

class AssemblyBuilder : AssemblyBuilderProtocol {
    
    
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = ViewController()
        let presenter = MainPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createSeconModule(router: RouterProtocol) -> UIViewController {
        let view = SecondViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return view
    }
    
    func createFirstPage() -> UIViewController {
        let view = WeatherViewController()
        let network = NetworkService()
        let presenter = SecondViewPresenter(view: view, network: network)
        view.presenter = presenter
        return view
    }
    
    func createSecondPage() -> UIViewController {
        let view = WeatherSecondViewController()
        let network = NetworkService()
        let presenter = SecondViewPresenter(view: view, network: network)
        view.presenter = presenter
        return view
    }
    
    func createThirdPage() -> UIViewController {
        let view = WeatherThirdViewController()
        let network = NetworkService()
        let presenter = SecondViewPresenter(view: view, network: network)
        view.presenter = presenter
        return view
    }
}
