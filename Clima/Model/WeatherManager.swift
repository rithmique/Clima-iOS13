//
//  WeatherManager.swift
//  Clima
//
//  Created by Максим on 27.03.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager,weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let city: String = ""
    let weatherURL = "https://api.openweathermap.org/data/2.5/find?appid=&units=metric"
    var weatherDelegate: WeatherManagerDelegate?
    
    func getWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    func getWeatherInCurrentLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    func performRequest(with urlString: String) {
        
        //create an url
        if let url = URL(string: urlString) {
            //create an url session
            let urlSession = URLSession(configuration: .default)
            //provide the url session with a task
            //when we get our data from the session below
            //we will calling handle method by trigger completionHandler
            //that will calling by mark, that we have received something from the session
            let task = urlSession.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    weatherDelegate?.didFailWithError(error: error!)
                }
                if let safedata = data {
                    if let weather = self.parseJSON(safedata){
                        weatherDelegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            //start the task
            task.resume()
        }
    }
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.list[0].weather[0].id
            let name = decodedData.list[0].name
            let country = decodedData.list[0].sys.country
            let temp = decodedData.list[0].main.temp
            let feels_like_temp = decodedData.list[0].main.feels_like
            let windSpeed = decodedData.list[0].wind.speed
            
            let weather = WeatherModel(conditionID: id, city: name, country: country, temp: temp, feels_like_temp: feels_like_temp, windSpeed: windSpeed)
            
            return weather
        } catch {
            weatherDelegate?.didFailWithError(error: error)
            return nil
        }
    }
}
