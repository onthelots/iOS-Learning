//
//  SimpleWeatherViewController.swift
//  Practice
//
//  Created by Jae hyuk Yim on 2023/03/21.
//

import UIKit

class SimpleWeatherViewController: UIViewController {

    // MARK: - 활용할 수 있는 배열 만들기
    let cities = ["Seoul",
                  "Tokyo",
                  "LA",
                  "Seattle"]
    
    let weathers = ["cloud.fill",
                    "sun.max.fill",
                    "wind",
                    "cloud.sun.rain.fill"]
    
    
    @IBOutlet weak var cityLabel: UILabel!
    
    
    @IBOutlet weak var weatherLabel: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func changeButton(_ sender: Any) {
        
        cityLabel.text = cities.randomElement()!
        
        let imageName = weathers.randomElement()!
        
        weatherLabel.image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysOriginal)
        
        let randomTemperature = Int.random(in: 10..<30)
        
        temperatureLabel.text = "\(randomTemperature)"
        
    }
}
