//
//  SearchViewModel.swift
//  GithubUserSearch
//
//  Created by Jae hyuk Yim on 2023/04/03.
//

import Foundation
import Combine

final class SearchViewModel {
    
    // Data -> Input
    let network: NetworkService
    
    init(network: NetworkService) {
        self.network = network
    }
    
    // Combine
//    @Published private(set) var users = [SearchResult]() // publisher 1
    let users = CurrentValueSubject<[SearchResult], Never>([]) // publisher 2 (Subject를 활용하는 것을 권장함)
    
    var subscriptions = Set<AnyCancellable>() // subscription
    
    // User Action -> Output
    func search(keyword: String) {
        
        // resource 값 할당
        let resource: Resource<SearchUserResponse> = Resource(
            base: "https://api.github.com/",
            path: "search/users",
            params: ["q": keyword],
            header: ["Content-Type": "application/json"]
        )
        
        // decoding
        network.load(resource)
            .map { $0.items }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.users.value, on: self)
            .store(in: &subscriptions)
    }

}
