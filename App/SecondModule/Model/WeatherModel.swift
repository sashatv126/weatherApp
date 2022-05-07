//
//  WeatherModel.swift
//  App
//
//  Created by Владимир on 07.05.2022.
//

import Foundation

struct WeatherModel : Codable {
    var weather : [Weather]?
    var main : Main?
}

struct Weather : Codable {
    let main : String?
}

struct Main : Codable {
    let temp : Double?
}
