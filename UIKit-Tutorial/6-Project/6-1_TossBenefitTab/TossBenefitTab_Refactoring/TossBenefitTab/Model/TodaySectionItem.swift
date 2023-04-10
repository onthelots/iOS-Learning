//
//  TodaySectionItem.swift
//  TossBenefitTab
//
//  Created by Jae hyuk Yim on 2023/04/07.
//

import Foundation

struct TodaySectionItem {
    var point: MyPoint
    var today: Benefit
    
    var sectionItems: [AnyHashable] {
        return [point, today]
    }
}

// mock-up
extension TodaySectionItem {
    static let mock = TodaySectionItem(
        point: MyPoint(point: 0),
        today: Benefit.button)
}
