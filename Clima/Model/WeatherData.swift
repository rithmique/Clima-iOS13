//
//  WeatherData.swift
//  Clima
//
//  Created by Максим on 28.03.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
//all lines below the structure are comforms to JSON file structure of weatherOpenAPI
struct WeatherData: Codable {
    let cod: String
    let message: String
    let list: [List]
    
    struct List: Codable {
        let main: Main
        let name: String
        let weather: [Weather]
        let sys: Sys
        let wind: Wind
    }
    
    struct Main: Codable {
        let temp: Float
        let feels_like: Float
    }
    struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
    }
    struct Sys: Codable {
        let country: String
    }
    struct Wind: Codable {
        let speed: Float
    }
}
