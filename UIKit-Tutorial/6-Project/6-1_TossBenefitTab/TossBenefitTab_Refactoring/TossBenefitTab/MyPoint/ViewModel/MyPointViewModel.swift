//
//  MyPointViewModel.swift
//  TossBenefitTab
//
//  Created by Jae hyuk Yim on 2023/04/10.
//

import Foundation
import Combine

final class MyPointViewModel {
    
    @Published var points: MyPoint
    
    init(points: MyPoint) {
        self.points = points
    }
}
