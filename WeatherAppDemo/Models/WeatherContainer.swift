//
//  WeatherContainer.swift
//  WeatherAppDemo
//
//  Created by Ibraheem rawlinson on 7/30/19.
//  Copyright © 2019 Ibraheem rawlinson. All rights reserved.
//

import Foundation

struct WeatherContainer: Codable {
    let latitude: Double
    let longitude: Double
    let currently: CurrentlyContainer
}
struct CurrentlyContainer: Codable {
    let time: Int
    let summary: String
    let temperature: Double
    let apparentTemperature: Double
    let dewPoint: Double
    let humidity: Double
    let pressure: Double
    let windSpeed: Double
}
