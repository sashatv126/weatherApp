//
//  SecondViewPresenter.swift
//  App
//
//  Created by Владимир on 07.05.2022.
//

import Foundation

protocol SecondViewPresenterProtocol : AnyObject {
    
    init(view : ViewDelegateProtocol, network : NetworkServiceProtocol)
    
    func getWeather()
    
    var object : WeatherModel? { get set }
}

class SecondViewPresenter : SecondViewPresenterProtocol{
    
    static var model : CoordinationModel?
    
    var network : NetworkServiceProtocol!
    
    weak var view : ViewDelegateProtocol!
    
    var object: WeatherModel?
    
    
     
    required init(view: ViewDelegateProtocol, network: NetworkServiceProtocol) {
        self.network = network
        self.view = view
        getWeather()
    }
    
    func getWeather() {
        let urlstr = "https://api.openweathermap.org/data/2.5/weather?\(SecondViewPresenter.model?.lat ?? 0)&lat=\(SecondViewPresenter.model?.lon ?? 0)&lon=139&appid=dfb729618687300ffd0e58835f3e4f1c"
        network.loadData(url : urlstr,complition: {[weak self] (result : Result<WeatherModel?,Error>) -> Void in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let weather) :
                    self.object = weather
                    self.view.getData()
                case .failure(let error) :
                  print("FF\(error)")
                }
            }
        })
    }
}
