//
//  CovidCenters.swift
//  (11.22) SwiftUI_Async_Await
//
//  Created by Jae hyuk Yim on 2022/11/22.
//

import Foundation


struct CovidCeneters: Codable {
    
    // 내부에 있는 key:Value 부분을 모두 구조체 안에 선언해준다.
    var currentCount: Int
    
    // 배열로 구성된 구조체를 이렇게 타입으로 선언해줌!!
    var data: [CovidCenter]
    var matchCount: Int
    var page: Int
    var perPage: Int
    var totalCount: Int
}

struct CovidCenter: Codable {
    var address: String
    var centerName: String
    var centerType: String
    var sido: String
}

class CovidCenterStore : ObservableObject {
    
    @Published var centers: [CovidCeneters]
    
    init (centers: [CovidCeneters] = []) {
        self.centers = centers
    }
}
