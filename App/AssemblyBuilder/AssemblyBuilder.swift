//
//  AssemblyBuilder.swift
//  App
//
//  Created by Владимир on 23.03.2022.
//

import UIKit
//Builder, which use for build the modules
protocol AssemblyBuilderProtocol {
    func createSplashModule(router: RouterProtocol ) -> UIViewController
    func createMainModule(router : RouterProtocol) -> UIViewController
    func createSeconModule(router : RouterProtocol, coordination : CoordinationModel?) -> UIViewController
}

class AssemblyBuilder : AssemblyBuilderProtocol {
    func createSplashModule(router: RouterProtocol ) -> UIViewController {
        let splashView = SplashViewController()
        let model = TextLabel(text: "Let's find out where you are")
        let presenter = SplashPresenter(splashView: splashView, router: router, text: model)
        splashView.presenter = presenter
        return splashView
    }
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
