import Foundation

class NetworkManager {
    struct WeatherDay {
        var weekName: String
        var temperature: Int
        var imageName: String
    }

    struct WeatherResponse: Codable {
        let dt: TimeInterval // Assuming this is the timestamp
        let main: Main // Assuming there's a "main" object containing temperature data
        let weather: [Weather] // Assuming there's an array of "weather" objects containing weather information

        struct Main: Codable {
            let temp: Double // Assuming this is the temperature
        }

        struct Weather: Codable {
            let description: String // Assuming this is the weather description
            // Add other properties as needed
        }
    }

    func fetchWeatherData(completion: @escaping ([WeatherDay]) -> Void) {
        let lon: Double = 11.0510
        let lat: Double = 76.0711
        let apiKey = "db86402924bfc4dcef45fd0d5db9c4c6"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let decoder = JSONDecoder()
                let weatherData = try decoder.decode(WeatherResponse.self, from: data)
                let weatherDays = WeatherDay(weekName: "Monday", temperature: 20, imageName: "sunny")
                completion([weatherDays]) // Assuming you only want one weather day for simplicity
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
}
