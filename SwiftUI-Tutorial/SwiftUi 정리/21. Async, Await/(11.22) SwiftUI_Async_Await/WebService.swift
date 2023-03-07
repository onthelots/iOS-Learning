//
//  WebService.swift
//  (11.22) SwiftUI_Async_Await
//
//  Created by Jae hyuk Yim on 2022/11/22.
//

import Foundation

class WebService {
    func fetchData (url: String) async throws -> [CovidCenter] {
        
        guard let url = URL(string: url) else { return }
        
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            // 3. 데이터를 골라서 가져오는 작업
            // guard 구문을 통해 데이터가 없을 경우를 작성
            guard let data else {
                print("data not found")
                return
                
            }
            
            // 4. 가져온 데이터를 변환하는 작업 (encoding 작업)
            let dataToString = String(data: data, encoding: .utf8)
            print("\(dataToString)")
            
            
            // 5. JSON 데이터를 구조체화 한 내용을 불러와준다!
            let centers: CovidCeneters = loadJson(data: data)
            print("CurrentCount : \(centers.currentCount)")
            print("matchCount : \(centers.matchCount)")
            
            
            // 5. CovidCenters의 데이터를 가져오자
            let centerList = centers.data
            
            for detail in centerList {
                print("\(detail.centerName)")
            }
        }
        
        task.resume()
        
        
    }
}
