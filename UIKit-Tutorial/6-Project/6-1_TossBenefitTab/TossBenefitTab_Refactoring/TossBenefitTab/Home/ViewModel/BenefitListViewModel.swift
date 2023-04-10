//
//  BenefitListViewModel.swift
//  TossBenefitTab
//
//  Created by Jae hyuk Yim on 2023/04/10.
//

import Foundation
import Combine

final class BenefitListViewModel {
    @Published var todaySectionItems: [AnyHashable] = []
    @Published var otherSectionItems: [AnyHashable] = []
    
    // output: 유저 피드백 가져오기
    let benefitDidTapped = PassthroughSubject<Benefit, Never>()
    let pointDidTapped = PassthroughSubject<MyPoint, Never>()
    
    
    // input: 데이터 가져오기
    func fetchItems() {
        // MARK: - 데이터가 받아오는데 필요한 시간을 설정
        // DispatchQueue -> Queue에 작업을 main스레드에서 x 시점 뒤에 실행(asyncAfter / execute)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.todaySectionItems = TodaySectionItem(point: .default, today: .today).sectionItems // todaySectionItem 데이터 할당
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.otherSectionItems = Benefit.others // otherSectionItem 데이터 할당
        }
    }
    
}
