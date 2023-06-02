//
//  FrameworkDetailViewModel.swift
//  AppleFramework
//
//  Created by Jae hyuk Yim on 2023/04/03.
//

import Foundation
import Combine

final class FrameworkDetailViewModel {
    
    // Data -> Output
    let framework: CurrentValueSubject<AppleFramework, Never>
    
    // User Action -> Input
    let buttonTapped = PassthroughSubject<AppleFramework, Never>()
    
    init(framework: AppleFramework) {
        self.framework = CurrentValueSubject(framework)
    }
    
    func learnMoreTapped() {
        buttonTapped.send(framework.value)
    }
}
