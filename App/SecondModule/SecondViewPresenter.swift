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
    
    func fff()
}

class SecondViewPresenter : SecondViewPresenterProtocol{
    
    var network : NetworkServiceProtocol!
    
    weak var view : ViewDelegateProtocol!
    
    var object: WeatherModel?
    
    var model : CoordinationModel?
     
    required init(view: ViewDelegateProtocol, network: NetworkServiceProtocol) {
        if self == nil {fatalError("dwdwd")}
        self.network = network
        self.view = view
        getWeather()
    }
    
    func getWeather() {
        let urlstr = "https://api.openweathermap.org/data/2.5/weather?\(model?.lat ?? 0)&lat=\(model?.lon ?? 0)&lon=139&appid=dfb729618687300ffd0e58835f3e4f1c"
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
    func fff() {
        NotificationCenter.default.addObserver(self, selector: #selector(coordinate(notification:)), name: Notification.Name("name"), object: nil)
    }
    
    
    @objc
    private func coordinate(notification: Notification) {
        guard let dict = notification.userInfo as? [String : CoordinationModel] else {
            return
        }
        model = dict["model"]
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
