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
    let weatherURL = "https://api.openweathermap.org/data/2.5/find?appid=put here ur id&units=metric"
    
    func getWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    func performRequest(urlString: String) {
        
        //create an url
        if let url = URL(string: urlString) {
            //create an url session
            let urlSession = URLSession(configuration: .default)
            //provide the url session with a task
            let task = urlSession.dataTask(with: url, completionHandler: handle(data: urlResponse: error:))
            //start the task
            task.resume()
        }
    }
    func handle(data: Data?, urlResponse: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        if let safedata = data {
            let dataString = String(data: safedata, encoding: .utf8)
        }
    }
}
