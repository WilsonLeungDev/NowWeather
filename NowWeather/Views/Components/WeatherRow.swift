//
//  WeatherRow.swift
//  NowWeather
//
//  Created by Wilson Leung on 25/2/2022.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    var highlightColor: Color {
        let color =
        name.containsIgnoringCase(find: "max") ? Color.red :
        name.containsIgnoringCase(find: "min") ? Color.blue :
        Color.black
        return color
    }
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                .foregroundColor(highlightColor)
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.caption)
                
                Text(value)
                    .bold()
                    .font(.title)
            }
        }
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(logo: "thermometer", name: "Feels like", value: "8°")
    }
}
