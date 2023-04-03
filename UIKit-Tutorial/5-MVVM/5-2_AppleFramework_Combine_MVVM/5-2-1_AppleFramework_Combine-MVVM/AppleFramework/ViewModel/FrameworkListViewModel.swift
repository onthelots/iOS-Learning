//
//  FrameworkListViewModel.swift
//  AppleFramework
//
//  Created by Jae hyuk Yim on 2023/04/03.
//

import Foundation
import Combine

final class FrameworkListViewModel {
    
    // Data -> View로의 Output 처리
    let items: CurrentValueSubject<[AppleFramework], Never>
    
    // User Action -> 사용자의 Input을 처리
    let selectedItem: CurrentValueSubject<AppleFramework?, Never> // 하나만 선택되는 아이템
    
    // initializer
    init(items: [AppleFramework], selectedItem: AppleFramework? = nil) {
        self.items = CurrentValueSubject(items)
        self.selectedItem = CurrentValueSubject(selectedItem)
    }
    
    // didSelect (선택된 아이템을 찾아서 보냄)
    func didSelect(at indexPath: IndexPath) {
        let item = items.value[indexPath.item]
        selectedItem.send(item) // selectedItem은 indextPath에 해당되는 Item
    }
    
}
