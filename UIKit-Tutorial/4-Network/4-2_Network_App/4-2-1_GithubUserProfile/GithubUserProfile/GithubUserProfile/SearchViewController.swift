//
//  SearchViewController.swift
//  GithubUserSearch
//
//  Created by joonwon lee on 2022/05/25.
//

import UIKit
import Combine
import Kingfisher

class UserProfileViewController: UIViewController {
    
    // NetworkService
    let networkService = NetworkService(configuration: .default)
    
    
    @Published private var user: UserProfile?
    var subscripiton = Set<AnyCancellable>()

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
        embedSearchControl()
    }
    
    // setupUI
    private func setupUI() {
        thumbnail.layer.cornerRadius = 80
    }
    
    private func embedSearchControl() {
        self.navigationItem.title = "Search"
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "onthelots" // placeholder
        searchController.searchResultsUpdater = self // delegate
        searchController.searchBar.delegate = self // delegate
        
        // navigationItem의 searchController를 위에서 선언한 searchController에 할당함
        self.navigationItem.searchController = searchController
    }
    
    // bind -> updataUI
    private func bind() {
        $user
            .receive(on: RunLoop.main)
            .sink { [unowned self] result in
                self.update(result) // update (데이터 넣어주기)
            }.store(in: &subscripiton)
    }
    
    // update -> sink
    private func update(_ user: UserProfile?) {
        guard let user = user else {
            self.nameLabel.text = "n/a" //nil
            self.loginLabel.text = "n/a"
            self.followerLabel.text = ""
            self.followingLabel.text = ""
            self.thumbnail.image = nil
            return
        }
        self.nameLabel.text = user.name
        self.loginLabel.text = user.login
        self.followerLabel.text = "folloers :\(user.followers)"
        self.followingLabel.text = "followings: \(user.following)"
        
        // MARK: - KingFisher / image url(avataUrl) -> UIImage로 변환
        self.thumbnail.kf.setImage(with: user.avatarUrl)
    }
    
}

// SearchResultUpdating
extension UserProfileViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let keyword = searchController.searchBar.text
        print("search: \(keyword)")
    }
}

extension UserProfileViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("button clicked: \(searchBar.text)")
        
        // keyword가 비어있지 않다 -> 아니라면 return
        // 사용자가 입력하는 keyword가 searchBar.text일건데, 비워있지 않을 경우만 코드 아래로 넘어가자
        // searchBar에 텍스트가 있고, 키워드가 비어있지 않을 경우 else 구문으로 ~
        guard let keyword = searchBar.text,
              !keyword.isEmpty else { return }
        
        
        // MARK: - Resource
        // url의 정보를 나눠주자
//        let base = "https://api.github.com/"
//        let path = "users/\(keyword)"
//        
//        // 여기부터는 url의 추가(세부)정보인 파라미터와 헤더값
//        let params: [String: String] = [:] // 파라미터
//        let header: [String: String] = ["Content-Type" : "application/json"]
//        
//        
//        // url을 완성시키는 components와 추가(세부)정보인 queryItem 처리
//        
//        // urlComponents
//        var urlComponents = URLComponents(string: base + path)!
//        
//        // queryItem
//        let queryItem = params.map { (key: String, value: String) in
//            URLQueryItem(name: key, value: value)
//        }
//        
//        // 기본정보 + 세부정보
//        urlComponents.queryItems = queryItem
//        
//        // URLRequest -> 요청자(다양한 필요정보를 객체화함)
//        var request = URLRequest(url: urlComponents.url!)
//        
//        // header에 필요한 값을 넣어줌
//        header.forEach { (key: String, value: String) in
//            request.addValue(value, forHTTPHeaderField: key)
//        }
        
        let resource = Resource<UserProfile>(base: "https://api.github.com/",
                                             path: "users/\(keyword)",
                                             params: [:],
                                             header: ["Content-Type" : "application/json"])
        
        // MARK: - 퍼블리셔 만들기 (URL 요청자를 활용해서)
        networkService.load(resource)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished: break
                }
            } receiveValue: { user in
                self.user = user
            }.store(in: &subscripiton)

//        URLSession.shared
//            .dataTaskPublisher(for: request) // 1. 퍼블리셔 선언
//            .tryMap { result -> Data in // 2. map과 동일하나, 클로저 내부에 예외상황을 연산할 수 있도록 함
//                guard let response = result.response as? HTTPURLResponse,
//                      (200..<300).contains(response.statusCode) else {
//                    let response = result.response as? HTTPURLResponse // 에러대응
//                    let statusCode = response?.statusCode ?? -1 // 에러대응
//                    throw NetworkError.responseError(statusCode: statusCode) // statusCode 던지기
//                }
//                return result.data
//            }
//            .decode(type: UserProfile.self, decoder: JSONDecoder()) // 3. 디코딩 (Server to Device)
//            .receive(on: RunLoop.main) // 4. 스레드 실행
//            .sink { completion in // 5. 구독티켓 발행 -> user Model의 데이터를 앞서 받아온 Server Data로 바꿔줌 (일종의 연속된 디코딩)
//                switch completion { // 에러 핸들링 ㄱㄱ
//                case .failure(let error):
//                    self.user = nil
//                case .finished: break
//                }
//
//                print("Completion: \(completion)") // 오류처리
//            } receiveValue: { user in
//                self.user = user
//            }.store(in: &subscripiton) // 6. 구독자에게 데이터를 전달함
    }
}
