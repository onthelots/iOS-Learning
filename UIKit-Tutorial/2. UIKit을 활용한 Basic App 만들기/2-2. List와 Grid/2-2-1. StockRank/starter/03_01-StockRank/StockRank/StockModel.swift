//
//  StockModel.swift
//  StockRank
//
//  Created by joonwon lee on 2022/04/19.
//

import Foundation


// 1. Stock과 관련된 Data 속성을 StockModel이란 이름의 구조체로 선언함
struct StockModel {
    let rank: Int
    let imageName: String
    let name: String
    let price: Int
    let diff: Double
}

// 2. extension을 통해 확장, 즉 StockModel 구조체의 기능을 확장하는데..
// 내부에는 전역변수 list가 있으며, 이는 StockModel 배열타입이며, 내부에는 미리 선언해 둔 값들이 존재함
extension StockModel {
    
    // 전역변수(static)으로 선언되어 있기 때문에, 외부에서 배열 [StockModel] 타입의 변수를 선언한 후, 점문법(.)을 통해 StockModel 내부의 list 배열을 할당할 수 있음!
    // list 배열에 들어있는 배열 값들은, 위에서 미리 선언해둔 'StockModel' 구조체의 '저장 프로퍼티'의 속성을 활용하여 초기값을 설정한 Data라고 볼 수 있음
    static let list: [StockModel] = [
        StockModel(rank: 1, imageName: "TSLA", name: "테슬라", price: 1_238_631, diff: 0.04),
        StockModel(rank: 2, imageName: "AAPL", name: "애플", price: 238_631, diff: 1.04),
        StockModel(rank: 3, imageName: "NFLX", name: "넷플릭스", price: 438_631, diff: -0.04),
        StockModel(rank: 4, imageName: "GOOG", name: "알파벳 A", price: 3_176_631, diff: 0.04),
        StockModel(rank: 5, imageName: "AMZN", name: "아마존", price: 3_538_631, diff: 0.04),
        StockModel(rank: 6, imageName: "NIKE", name: "나이키", price: 158_631, diff: 0.04),
        StockModel(rank: 7, imageName: "DIS", name: "디즈니", price: 138_631, diff: 0.04),
        StockModel(rank: 8, imageName: "TSLA", name: "테슬라", price: 1_238_631, diff: 0.04),
        StockModel(rank: 9, imageName: "AAPL", name: "애플", price: 238_631, diff: 1.04),
        StockModel(rank: 10, imageName: "NFLX", name: "넷플릭스", price: 438_631, diff: -0.04),
        StockModel(rank: 11, imageName: "GOOG", name: "알파벳 A", price: 3_176_631, diff: 0.04),
        StockModel(rank: 12, imageName: "AMZN", name: "아마존", price: 3_538_631, diff: 0.04),
        StockModel(rank: 13, imageName: "NIKE", name: "나이키", price: 158_631, diff: 0.04),
        StockModel(rank: 14, imageName: "DIS", name: "디즈니", price: 138_631, diff: 0.04),
    ]
}
