//
//  CurrentWeather.swift
//  myweather
//
//  Created by omari katamadze on 17.02.23.
//


import Foundation

struct CurrentWeather: Codable {
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let dt: TimeInterval
    let sys: Sys
    let timezone: Int
    let name: String
}

struct Coord: Codable {
    let lon, lat: Double
}

struct Weather: Codable {
    let id: Int
    let description, icon: String
}

struct Main: Codable {
    let temp, feels_like, temp_min, temp_max: Double
    let pressure, humidity: Double
    
    enum Main : String, CodingKey{
        case Temp
        case FeelsLike
        case TempMin
        case TempMax
    }
}

struct Wind: Codable {
    let speed: Double
}

struct Sys: Codable {
    let country: String
}

