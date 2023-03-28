import UIKit

// MARK: - 프로퍼티 래퍼와 @Published
// 날씨(Weather) 클래스 내부에 온도(tempearture)값을 외부에서 활용하고, 업데이트 시켜주기 위해 '퍼블리셔'로 선언함
// 반드시 클래스만 사용 가능

class Weather {
    @Published var temperature: Double
    
    init(temperature: Double) {
        self.temperature = temperature
    }
}

let weather: Weather = Weather(temperature: 20)

weather.temperature // 20

// 날씨(온도)의 상태를 알기 위한 Subscription가 접근

let subscription = weather.$temperature.sink {
    print("현재의 온도는 : \($0)") // description으로도 접근 가능
}

// 현재의 온도는 : 20.0

weather.temperature = 25

// 현재의 온도는 : 25.0
