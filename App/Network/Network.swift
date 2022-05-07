//
//  Network.swift
//  App
//
//  Created by Владимир on 07.05.2022.
//
import UIKit
//Работа с сетью
protocol  NetworkServiceProtocol {
    
    func loadData<T : Decodable>(url : String ,complition: @escaping (Result<T?,Error>) -> Void)
}

class NetworkService : NetworkServiceProtocol {
    func loadData<T : Decodable>(url : String,complition: @escaping (Result<T?, Error>) -> Void) {
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url) { data, _, error  in
            if let error = error {
                complition(.failure(error))
                return
            }
            do {
                let result = try JSONDecoder().decode(T.self, from: data!)
                complition(.success(result))
            } catch {
                complition(.failure(error))
            }
        }.resume()
    }
}

//https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=dfb729618687300ffd0e58835f3e4f1c
