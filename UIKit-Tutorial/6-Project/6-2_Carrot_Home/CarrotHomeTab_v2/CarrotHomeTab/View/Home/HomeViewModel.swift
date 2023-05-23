//
//  HomeViewModel.swift
//  CarrotHomeTab
//
//  Created by Jae hyuk Yim on 2023/04/11.
//

import Foundation
import Combine

final class HomeViewModel {

    // MARK: - Data Input
    // 퍼블리셔1. Network 담당객체
    let network: NetworkService
    // 퍼블리셔2. Model 받아오기 (퍼블리셔) -> viewController에서 바인딩 할 것임
    @Published var items: [ItemInfo] = []
    
    // MARK: - User Interaction Ouput
    // 퍼블리셔3. User Interaction Output
    let itemTapped = PassthroughSubject<ItemInfo, Never>()
    
    // MARK: - SubScription
    var subscriptions = Set<AnyCancellable>()
    
    init(network: NetworkService) {
        self.network = network
    }
    
    // MARK: - fetch (Input 퍼블리셔에 데이터 할당하기)
    func fetch() {
        // network에 할당될 resource 정의
        // resource의 타입은 ItemInfo의 배열 형태 타입
        let resource: Resource<[ItemInfo]> = Resource(
            base: "https://my-json-server.typicode.com/",
            path: "cafielo/demo/products",
            params: [:],
            header: ["Content-Type": "application/json"]
        )
        
        // network에 resource 할당하기(load)
        network.load(resource)
            .receive(on: RunLoop.main)
            // sink -> 데이터 할당하는데, Completion을 활용하여 errorhandling 실시
            .sink { completion in
                switch completion {
                case .failure(let error) :
                    print("--> Error : \(error)")
                case .finished :
                    print("--> Finished")
                }
            } receiveValue: { items in // item 퍼블리셔에 받아온 items 값 할당하기
                self.items = items
                print("Items : \(items)")
            }.store(in: &subscriptions) // 구독
    }
}
