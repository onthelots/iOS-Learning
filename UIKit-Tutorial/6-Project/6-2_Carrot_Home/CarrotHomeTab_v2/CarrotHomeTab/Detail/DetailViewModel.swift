//
//  DetailViewModel.swift
//  CarrotHomeTab
//
//  Created by Jae hyuk Yim on 2023/04/14.
//
import Foundation
import Combine

final class DetailViewModel {
    
    let network: NetworkService // 기존에 내려오는 데이터 가져오기
    let itemInfo: ItemInfo // 내려오는 데이터 가져오기
    
    // Publisher -> itemInfoDeatils
    @Published var itemInfoDetails: ItemInfoDetails? = nil
    
    init(network: NetworkService, itemInfo: ItemInfo) {
        self.network = network
        self.itemInfo = itemInfo
    }
    
    
    // featch -> IteminfoDetail의 user, item, details의 값 가져오기
    func fetch() {
        // simulate network like behavior
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.3) { [unowned self] in
            self.itemInfoDetails = ItemInfoDetails(user: User.mock, item: self.itemInfo, details: ItemExtraInfo.mock)
        }
    }

}
