//
//  LocationWeatherManager.swift
//  myweather
//
//  Created by omari katamadze on 18.02.23.
//


import Foundation

enum NetworkError: Error {
    case serverError
    case decodingError
}

class LocationWeatherManager {
    
    static let shared = LocationWeatherManager()
    private let key = "17d851020051493aa9518d733e996825"
    
    private init() {}
 
    func getCurrentWeather(lat:Double,lon:Double,locale: String,completion: @escaping (Result<CurrentWeather,NetworkError>) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&lang=\(locale)&units=metric&appid=\(key)") else {
            completion(.failure(.serverError))
            return
        }
        print(url)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.serverError))
                return
            }
            do {
                let weather = try JSONDecoder().decode(CurrentWeather.self, from: data)
                completion(.success(weather))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
 
    }
    
    func getDailyWeather(lat:Double,lon:Double,locale: String, completion: @escaping (Result<DailyWeather,NetworkError>) -> ()) {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&units=metric&appid=\(key)") else {
            completion(.failure(.serverError))
            return
        }
        print(url)
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.serverError))
                return
            }
            do {
                let weather = try JSONDecoder().decode(DailyWeather.self, from: data)
                completion(.success(weather))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
}





