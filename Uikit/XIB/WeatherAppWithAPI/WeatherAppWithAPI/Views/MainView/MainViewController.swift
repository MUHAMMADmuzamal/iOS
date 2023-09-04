//
//  MainViewController.swift
//  WeatherAppWithAPI
//
//  Created by codes orbit on 04/09/2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var latitude:UITextField!
    @IBOutlet weak var longitude:UITextField!
    @IBOutlet weak var temperatureLabel:UILabel!
    
    let weatherViewModel = WeatherViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func fetchData(_ sender: Any){
        weatherViewModel.fetchWeatherData(latitude: latitude.text ??  "33.7215", longitude: longitude.text ?? "73.0433"){ [self]
            (data:WeatherModel) in
            print("\(data.daily.temperature2MMax)")
            self.temperatureLabel?.text = "\(data.daily.temperature2MMax[0])"
        }onFailureHandler:{
            (error) in
            print(error)
        }

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
