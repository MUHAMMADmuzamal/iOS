//
//  WeatherViewModel.swift
//  WeatherAppWithAPI
//
//  Created by codes orbit on 04/09/2023.
//

import Foundation
import Alamofire

class WeatherViewModel{
    private var url = "https://api.open-meteo.com/v1/forecast?daily=temperature_2m_max,temperature_2m_min,sunrise,sunset&timezone=auto"
   // private var weatherData: WeatherModel?
    func fetchWeatherData(latitude: String,
                          longitude: String,
                          completionHandler:@escaping (_ : WeatherModel) -> (Void), onFailureHandler:@escaping(_:Error)->(Void)){
        
        url += "&latitude=\(latitude)&longitude=\(longitude)"
        AF.request(url).responseDecodable(of: WeatherModel.self) {  response in
            switch response.result {
            case .success(let data):
               completionHandler(data)
            case .failure(let fetcherror):
                onFailureHandler(fetcherror)
            }
        }
    }
}

