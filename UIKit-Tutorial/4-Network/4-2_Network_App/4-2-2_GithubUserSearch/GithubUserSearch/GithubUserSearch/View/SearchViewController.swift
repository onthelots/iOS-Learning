//
//  SearchViewController.swift
//  GithubUserSearch
//
//  Created by joonwon lee on 2022/05/25.
//

import UIKit
import Combine

class SearchViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // 퍼블리셔 users 생성 -> SearchResult 타입이며, 빈 배열로 초기화함
    @Published private(set) var users: [SearchResult] = []
    
    // NetworkService
    let networkService = NetworkService(configuration: .default)
    
    // subscription 생성
    var subscription = Set<AnyCancellable>()
    
    typealias Item = SearchResult
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embedSearchControl() // 서치컨트롤 처리 (naviagtionItem 서치컨트롤에 값을 할당)
        bind() // CollectionView dataSource(snapshot)에 users(퍼블리셔)의 값을 할당함
        configureCollectionView() // CollectionView의 presentation, layout을 설정함
    }
    
    private func embedSearchControl() {
        self.navigationItem.title = "Search"
        
        let searchController = UISearchController(searchResultsController: nil) // 서치컨트롤 생성
        searchController.hidesNavigationBarDuringPresentation = false // 네비게이션 바 삭제
        searchController.searchBar.placeholder = "닉네임을 입력하세요" // placeholder
        
        // delegate setting
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        
        // navigationItem의 searchController에 위에서 선언한 서치 컨트롤을 할당함
        self.navigationItem.searchController = searchController
    }
    
    // bind
    private func bind() {
        $users
            .receive(on: RunLoop.main)
            // 구독자가 Sink받는 데이터를 할당하는데..
            // users(퍼블리셔)의 값이 변경될 때 마다 CollectionView의 dataSource의 값도 변경되어야 하니, snapshot을 해당 Scope에서 선언함
            .sink { users in
                var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
                snapshot.appendSections([.main])
                snapshot.appendItems(users, toSection: .main) // snapshot의 아이템 또한 users(퍼블리셔)로 설정함
                self.datasource.apply(snapshot)
            }.store(in: &subscription)
    }
    
    // configure
    private func configureCollectionView() {
        // presentation
        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView,
                                                                       cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as? ResultCell else {
                return nil
            }
            cell.user.text = item.login // cell 내부에 있는 [user UILabel] -> SearchResult에 [login text]
            return cell
        })
        
        // layout
        collectionView.collectionViewLayout = layout()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout{
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

// 서치컨트롤 업데이트 Delegate
extension SearchViewController: UISearchResultsUpdating {
    // 업데이트 함수
    func updateSearchResults(for searchController: UISearchController) {
        let keyword = searchController.searchBar.text // keyword(타이핑 되는 값) -> searchController.searchBar.text
        print("search: \(String(describing: keyword))")
    }
}

// 서치바 Delegate
extension SearchViewController: UISearchBarDelegate {
    // 서치버튼 클릭 함수
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("button clicked: \(searchBar.text)")
        
        guard let keyword = searchBar.text, !keyword.isEmpty else { return }
        
//        // 도메인 주소 및 path
//        let base = "https://api.github.com/"
//        let path = "search/users"
//        let params: [String: String] = ["q": keyword]
//        let header: [String: String] = ["Content-Type": "application/json"]
//
//        // 위 정보를 활용할 수 있는 URLComponents와 쿼리아이템 선언
//        var urlComponents = URLComponents(string: base + path)!
//        let queryItem = params.map { (key: String, value: String) in
//            return URLQueryItem(name: key, value: value)
//        }
//
//        // urlComponents의 쿼리아이템에 위에서 만들어 둔 queryItem을 할당함
//        urlComponents.queryItems = queryItem
//
//        // URLRequest -> 데이터를 요청하기 위한 객체 선언
//        var request = URLRequest(url: urlComponents.url!) // 컴포넌트 url을 할당
//        header.forEach { (key: String, value: String) in
//            request.addValue(value, forHTTPHeaderField: key)
//        } // header 또한 request의 데이터에 forEach구문을 활용하여 할당함
        
        // MARK: - Network
        let resource = Resource<SearchUserResponse>(
            base: "https://api.github.com/",
            path: "search/users",
            params: ["q": keyword],
            header: ["Content-Type": "application/json"])
        
        // MARK: - NetworkService
        networkService.load(resource)
            .map{$0.items}
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.users, on: self)
            .store(in: &subscription)
        
//        URLSession.shared.dataTaskPublisher(for: request) // 퍼블리셔 생성(request의 데이터를 받아오는)
//        // dataTaskPublisher는 response와 data 속성 2가지를 모두 가지고 있음
//            .map{$0.data} // 1. 일단 데이터만 받아오고,
//            .decode(type: SearchUserResponse.self, decoder: JSONDecoder()) // 2. 디코딩(서버에서 받아오는) 작업을 실시함으로서 데이터를 SearchResultUsers 타입에 맞게끔 설정함
//            .map{$0.items} // 3. 그 중에서도, items 배열값만 받아옴 (전체 데이터 말구)
//            .receive(on: RunLoop.main) // 4. 작업 스레드를 설정해주고..
//            .replaceError(with: []) // 5. 에러 처리도 해주고..
//            .assign(to: \.users, on: self) // 6. assing 할당자를 통해 self(SearchViewController)내에 선언된 users(퍼블리셔)에게 값을 할당함
//            .store(in: &subscription) // 7. 마지막으로 구독처리를 실시함
    }
}
