//
//  WeatherManager.swift
//  NowWeather
//
//  Created by Wilson Leung on 25/2/2022.
//

import Foundation
import CoreLocation

class WeatherManager {

    let BASE_URL  = "https://api.openweathermap.org/data/2.5"
    let API_KEY = "API_KEY"

    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> Weather {
        guard let url = URL(string: "\(BASE_URL)/weather?lat=\(latitude)&lon=\(longitude)&appid=\(API_KEY)&units=metric") else {
            fatalError("Missing URL")
        }

        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }

        let decodedData = try JSONDecoder().decode(Weather.self, from: data)
        return decodedData
    }

}
