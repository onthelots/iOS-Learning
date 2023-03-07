//
//  struct car.swift
//  (10.25) SwiftUI_List_Navigation Tutorial
//
//  Created by Jae hyuk Yim on 2022/10/25.
//

import Foundation


// List 및 NavigationView내 활용하는 프로퍼티를 저장해 놓은 구조체 선언!
// Car의 정보가 구현되어 있는 Json 내 각 필드에 대한 프로퍼티를 담고 있음

struct Car: Codable, Identifiable {
    
    var id: String
    var name: String
    
    var description: String
    var isHybrid: Bool
    
    var imageName: String
    
}
