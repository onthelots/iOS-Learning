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

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
//    @Published private(set) var user: UserProfile?
    
    var searchViewModel: SearchViewModel!
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchViewModel = SearchViewModel(network: NetworkService(configuration: .default), selectedUser: nil)
        setupUI()
        bind()
        embedSearchControl()
    }
    
    private func setupUI() {
        thumbnail.layer.cornerRadius = 80
    }
    
    private func bind() {

        searchViewModel.selectedUser
            .receive(on: RunLoop.main)
            .sink { [unowned self] result in
                self.nameLabel.text = searchViewModel.name
                self.loginLabel.text = searchViewModel.login
                self.followerLabel.text = searchViewModel.followers
                self.followingLabel.text = searchViewModel.following
                self.thumbnail.kf.setImage(with: self.searchViewModel.imageURL) // kingfisher (kf.setImage(with: )
            }.store(in: &subscriptions)
    }
    
    private func embedSearchControl() {
        self.navigationItem.title = "Search"
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "cafielo"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
}

extension UserProfileViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let keyword = searchController.searchBar.text
        print("search: \(keyword)")
    }
}

extension UserProfileViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text, !keyword.isEmpty else { return }
        
        searchViewModel.search(keyword: keyword)
    }
}
