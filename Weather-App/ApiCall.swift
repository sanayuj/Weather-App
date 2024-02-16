//
//  ApiCall.swift
//  Weather-App
//
//  Created by Sanay UJ on 16/02/24.
//

import Foundation


class NetworkManager {
    struct WeatherDay {
        var weekName: String
        var temperature: Int
        var imageName: String
    }
    enum NetworkError: Error {
        case invalidURL
        case noData
        case decodingError
       
    }


    
    func fetchWeatherData(completion: @escaping (Result<[WeatherDay], Error>) -> Void) {
    
        let lon:Double = 11.0510
        let lat:Double = 76.0711
        let apiKey = "db86402924bfc4dcef45fd0d5db9c4c6"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)"
        

        guard let url = URL(string: urlString) else {
                   completion(.failure(NetworkError.invalidURL))
                   return
               }

               let task = URLSession.shared.dataTask(with: url) { data, response, error in
                   if let error = error {
                       completion(.failure(error))
                       return
                   }
                   
                   guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                       completion(.failure(NetworkError.invalidURL))
                       return
                   }
                   
                   guard let data = data else {
                       completion(.failure(NetworkError.noData))
                       return
                   }
                   
                   do {
                       let decoder = JSONDecoder()
                       let weatherData = try decoder.decode(WeatherResponse.self, from: data)
                       let weatherDays = // Convert weatherData to [WeatherDay]
                       completion(.success(weatherDays))
                   } catch {
                       completion(.failure(NetworkError.decodingError))
                   }
               }
               task.resume()
           }
}

