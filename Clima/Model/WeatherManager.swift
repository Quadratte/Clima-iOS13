import UIKit
import CoreLocation

protocol WeatherManagerDelegate {
  func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
  func didFailWithError(error: Error) 
}

struct WeatherManager {
  let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=21e0bc80dcdfaca2a9c01cb4c4b313f9&units=metric"
  
  var delegate: WeatherManagerDelegate?
  
  func fetchWeather(cityName: String) {
    let urlString = "\(weatherURL)&q=\(cityName)"
    performRequest(urlString: urlString)
  }
  
  func fetchWeather(latitude : CLLocationDegrees, longitude: CLLocationDegrees) {
    let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
    performRequest(urlString: urlString)
  }
  
  func performRequest(urlString: String) {
    
    if let url = URL(string: urlString) {
      
      let session = URLSession(configuration: .default)
      
      let task = session.dataTask(with: url) { data, response, error in
        if error != nil {
          self.delegate?.didFailWithError(error: error!)
        }
        
        if let safeData = data {
          if let weather = self.parsJSON(weatherData: safeData) {
            self.delegate?.didUpdateWeather(self, weather: weather)
          }
        }
      }
      task.resume()
      
    }
    
    }
  
  func parsJSON(weatherData: Data) -> WeatherModel? {
    
    let decoder = JSONDecoder()
    do {
      let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
      let id = decodedData.weather[0].id
      let temp = decodedData.main.temp
      let name = decodedData.name
      
      let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp)
      return weather
      
    } catch {
      delegate?.didFailWithError(error: error)
      return nil
    }
    
  }
  
}

