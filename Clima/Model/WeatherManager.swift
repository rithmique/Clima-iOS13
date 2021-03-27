//
//  WeatherManager.swift
//  Clima
//
//  Created by Максим on 27.03.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import UIKit

struct WeatherManager {
    let city: String = ""
    let weatherURL = "http://api.openweathermap.org/data/2.5/find?appid=0c7121f670162ed550582cc9e699da68&units=metric"
    
    func getWeather(cityName: String) {
        let URLString = "\(weatherURL)&q=\(cityName)"
    }
}
