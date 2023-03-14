//
//  CityObject.swift
//  myweather
//
//  Created by omari katamadze on 17.02.23.
//

import Foundation

class CityObject: Codable{
    var name: String
    var country: String
    var coord: CoordCity
}

class CoordCity: Codable {
    var lat: Double
    var lon: Double
}
