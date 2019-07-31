//
//  ViewController.swift
//  WeatherAppDemo
//
//  Created by Ibraheem rawlinson on 7/30/19.
//  Copyright © 2019 Ibraheem rawlinson. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DarkSkyClient.fetchWeatherData(lat: DarkSkySecretKey.SampleLat, lng: DarkSkySecretKey.SampleLng)
    }


}

