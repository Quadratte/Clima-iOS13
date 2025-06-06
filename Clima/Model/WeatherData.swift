import UIKit

struct WeatherData: Decodable {
  
  let name: String
  let main: Main
  let weather: [Weather]
  let lat: Int
  let lon: Int
  
}

struct Main: Decodable {
  let temp: Double
}

struct Weather: Decodable {
  let description: String
  let id: Int
}
