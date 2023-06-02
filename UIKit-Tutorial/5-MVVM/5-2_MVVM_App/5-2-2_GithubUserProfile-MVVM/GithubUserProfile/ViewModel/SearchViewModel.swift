//
//  SearchViewModel.swift
//  GithubUserProfile
//
//  Created by Jae hyuk Yim on 2023/04/03.
//

import Foundation
import Combine
import Kingfisher

final class SearchViewModel {
    
    // subscription
    var subscriptions = Set<AnyCancellable>()

    // Data -> Output
//    @Published private(set) var user: UserProfile? // 필요가 없음
    
    let selectedUser: CurrentValueSubject<UserProfile?, Never>
    
    // NetworkController
    let network: NetworkService
    
    // initializer
    init(network: NetworkService, selectedUser: UserProfile?) {
        self.network = network
        self.selectedUser = CurrentValueSubject(selectedUser)
    }
    
    // 연산 프로퍼티 (ViewModel에서 활용가능한)
    var name: String {
        return selectedUser.value?.name ?? "n/a"
    }
    
    var login: String {
        return selectedUser.value?.login ?? "n/a"
    }
    
    var followers: String {
        guard let value = selectedUser.value?.followers else { return ""}
        return "followers: \(value)"
    }
    
    var following: String {
        guard let value = selectedUser.value?.following else { return ""}
        return "following: \(value)"
    }
    
    var imageURL: URL? {
        return selectedUser.value?.avatarUrl
    }
    
    // user action -> Output
    func search(keyword: String) {
        let resource = Resource<UserProfile>(base: "https://api.github.com/", path: "users/\(keyword)", params: [:], header: ["Content-Type": "application/json"])
        
        network.load(resource)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.selectedUser.send(nil)
                    print("error: \(error)")
                case .finished: break
                }
            } receiveValue: { user in
                self.selectedUser.send(user)
            }.store(in: &subscriptions)
    }
}
