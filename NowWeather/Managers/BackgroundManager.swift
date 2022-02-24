//
//  BackgroundManager.swift
//  NowWeather
//
//  Created by Wilson Leung on 25/2/2022.
//

import SwiftUI

enum BackgroundType: CaseIterable {
    case plain
    case linear
    case radial
}
struct BackgroundModifier: ViewModifier {
    var type: BackgroundType
    func body(content: Content) -> some View {
        switch type {
            case .plain:
                content
                    .background(
                        Color(hue: 0.656, saturation: 0.787, brightness: 0.354)
                    )
            case .linear:
                content
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [.black, .gray, .white]),
                            startPoint: .topLeading, endPoint: .bottomTrailing
                        )
                    )
            case .radial:
                content
                    .background(
                        RadialGradient(gradient: Gradient(colors: [Color("LightPurple"),Color("DarkPurple")]), center: .center, startRadius: 2, endRadius: 300)
                    )
        }

    }
}
