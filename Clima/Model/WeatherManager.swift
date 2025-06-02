//
//  Weathermanager.swift
//  Clima
//
//  Created by S&Q on 02.06.2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

struct WeatherManager {
  let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=21e0bc80dcdfaca2a9c01cb4c4b313f9&units=metric"
  
  func fetchWeather(cityName: String) {
    let urlString = "\(weatherURL)&q=\(cityName)"
    print(urlString)
  }
}
