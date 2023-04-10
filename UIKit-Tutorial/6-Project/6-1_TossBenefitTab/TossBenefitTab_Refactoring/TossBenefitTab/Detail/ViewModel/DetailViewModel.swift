//
//  DetailViewModel.swift
//  TossBenefitTab
//
//  Created by Jae hyuk Yim on 2023/04/10.
//

import Foundation
import Combine


final class DetailViewModel {
    @Published var benefit: Benefit
    @Published var benefitDetails: BenefitDetails?
    
    init(benefit: Benefit) {
        self.benefit = benefit
    }
    
    func fetchDeatils() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.benefitDetails = .default
        }
    }
}
