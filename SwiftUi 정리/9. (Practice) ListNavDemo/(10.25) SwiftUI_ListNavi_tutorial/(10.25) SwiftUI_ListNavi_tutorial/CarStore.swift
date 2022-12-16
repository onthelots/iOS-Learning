//
//  CarStore.swift
//  (10.25) SwiftUI_List_Navigation Tutorial
//
//  Created by Jae hyuk Yim on 2022/10/25.
//

import Foundation
import Combine

// 데이터 저장소 추가
// Observable 객체에 의존!

class CarStore : ObservableObject {
    
    @Published var cars: [Car]
    
    // 초기화로 전달된 배열을 게시자로!
    // var cars: [Car]
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
