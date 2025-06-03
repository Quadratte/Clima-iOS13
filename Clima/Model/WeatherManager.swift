import UIKit

struct WeatherManager {
  let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=21e0bc80dcdfaca2a9c01cb4c4b313f9&units=metric"
  
  func fetchWeather(cityName: String) {
    let urlString = "\(weatherURL)&q=\(cityName)"
    performRequest(urlString: urlString)
  }
  
  func performRequest(urlString: String) {
    
    if let url = URL(string: urlString) {
      
      let session = URLSession(configuration: .default)
      
      let task = session.dataTask(with: url) { data, response, error in
        if error != nil {
          print(error!)
          return
        }
        
        if let safeData = data {
          self.parsJSON(weatherData: safeData)
        }
      }
      
      task.resume()
      
    }
    
  }
  
  func parsJSON(weatherData: Data) {
    let decoder = JSONDecoder()
    do {
      let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
      print(decodedData.weather[0].id)

    } catch {
      print(error)
    }
    
  }
  
}
