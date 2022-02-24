//
//  ContentView.swift
//  NowWeather
//
//  Created by Wilson Leung on 25/2/2022.
//

import SwiftUI

struct ContentView: View {
    var weatherManager = WeatherManager()
    @StateObject var locationManger = LocationManager()
    @State var weather: Weather?

    var body: some View {
        VStack {
            if let coordinate = locationManger.lastCoordinate {
                if let weather = weather {
                    WeatherView(weather: weather)
                        .environmentObject(locationManger)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: coordinate.latitude, longitude: coordinate.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManger.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManger)
                }
            }
        }
            .configureBackground(type: .linear)
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct CityTextView: View {
    var cityName: String

    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct CurrentDayView: View {
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
            .padding(.bottom, 40)
    }
}
