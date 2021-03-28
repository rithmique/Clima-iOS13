//
//  WeatherModel.swift
//  Clima
//
//  Created by Максим on 28.03.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionID: Int
    let city: String
    let temp: Float
    let feels_like_temp: Float
    
    var tempString: String {
        return "\(String(format: "%.1f", temp))"
    }
    
    var conditionName: String {
        switch conditionID {
        case 200...232:
            return "cloud.bolt.fill"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
