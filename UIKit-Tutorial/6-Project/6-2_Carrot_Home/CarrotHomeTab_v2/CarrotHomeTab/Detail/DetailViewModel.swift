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
    
//    var subscription = Set<AnyCancellable>()
    
    init(network: NetworkService, itemInfo: ItemInfo) {
        self.network = network
        self.itemInfo = itemInfo
    }
    
    
    // featch -> IteminfoDetail의 user, item, details의 값 가져오기
    func fetch() {
//
//        let resource: Resource<ItemInfoDetails> = Resource(
//            base: <#T##String#>,
//            path: <#T##String#>,
//            params: [:],
//            header: [:])
//
//        network.load(resource)
//            .receive(on: RunLoop.main)
//            .sink { completion in
//                switch completion {
//                case .failure(let error) :
//                    print("Error : \(error)")
//                case .finished :
//                    print("Finished")
//                }
//            } receiveValue: { itemInfo in
//                self.itemInfoDetails = itemInfo
//            }.store(in: &subscription)

        // simulate network like behavior
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) { [unowned self] in
            self.itemInfoDetails = ItemInfoDetails(user: User.mock, item: self.itemInfo, details: ItemExtraInfo.mock)
        }
    }

}
