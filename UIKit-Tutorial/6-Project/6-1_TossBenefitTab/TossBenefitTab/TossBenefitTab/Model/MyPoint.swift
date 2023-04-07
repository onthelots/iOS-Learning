//
//  MyPoint.swift
//  TossBenefitTab
//
//  Created by Jae hyuk Yim on 2023/04/07.
//

import Foundation

struct MyPoint: Hashable {
    var point: Int
}

extension MyPoint {
    // 전역상수의 이름을 ` `로 감싸주면, 점문법(.)으로 해당 상수를 접근할 수 있음
    static let `default` = MyPoint(point: 0)
}

