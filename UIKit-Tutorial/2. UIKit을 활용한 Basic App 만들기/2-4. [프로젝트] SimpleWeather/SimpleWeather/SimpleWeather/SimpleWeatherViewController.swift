//
//  SimpleWeatherViewController.swift
//  SimpleWeather
//
//  Created by Jae hyuk Yim on 2023/03/09.
//

import UIKit

class SimpleWeatherViewController: UIViewController {
    
    // MARK: - (변화 예정) 컴포넌트 프로퍼티 생성
    // 도시 라벨
    @IBOutlet weak var cityLabel: UILabel!
    // 날씨 UI 이미지
    @IBOutlet weak var weatherUIImage: UIImageView!
    // 온도 라벨
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    // MARK: - 활용할 수 있는 배열 만들기
    let cities = ["Seoul",
                  "Tokyo",
                  "LA",
                  "Seattle"]
    
    let weathers = ["cloud.fill",
                    "sun.max.fill",
                    "wind",
                    "cloud.sun.rain.fill"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - 도시, 날씨, 온도 바꾸는 Button
    @IBAction func changeButton(_ sender: Any) {
        
        cityLabel.text = cities.randomElement()

        let imageName = weathers.randomElement()!
        // 여기서, inspector에서는 multycolor이지만, 여기선 단순히
        // 시스템 이미지값으로 넘겼기 때문에, 당연히 TintColor로 먹히게 됨
        // 따라서, 'withRenderingMode' 수정자를 넘겨줘야 함
        // 내부 값으로는 .alwaysOriginal은 본래 이미지의 색상
        weatherUIImage.image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysOriginal)
        
        let randomTemperature = Int.random(in: 10..<30)
        
        // MARK: - 문자열 변환(String interpolation)
        // Int 값으로 설정된 randomTemperature를 text로 넘겨주기 위해
        // 흔히 사용하던 \()을 활용하여 Int -> String 값으로 변환시켜 할당할 수 있다
        temperatureLabel.text = "\(randomTemperature)°"
        
        print("도시, 날씨, 온도가 변경!")
    }
    
}
