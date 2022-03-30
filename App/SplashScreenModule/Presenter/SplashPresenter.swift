//
//  SplashPresenter.swift
//  App
//
//  Created by Владимир on 26.03.2022.
//

import UIKit

protocol SplashViewProtocol : class {
    func success()
    func failure(error : Error)
}
protocol SplashViewPresenterProtocol {
    init(splashView : SplashViewProtocol, router : RouterProtocol, text : TextLabel)
    func onScreen()
}
class SplashPresenter : SplashViewPresenterProtocol {
    weak var splashView : SplashViewProtocol?
    var router : RouterProtocol?
    var text : TextLabel?
   
    required init(splashView: SplashViewProtocol, router: RouterProtocol, text: TextLabel) {
        self.splashView = splashView
        self.router = router
        self.text = text
    }
    
    func onScreen() {
    }
}
