//
//  SearchViewController.swift
//  InstaSearchView
//
//  Created by Jae hyuk Yim on 2023/03/21.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // MARK: - flowlayout의 크기를 자동으로 맞추지 않도록 함
        // UICollectionViewFlowLayout 타입과 estimatedItemSize 활용
        // Inspector에서도 estimatedSize를 조정할 수 있음
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        
        // MARK: - NavigationBar 수정
        self.navigationItem.title = "Search"
        
        // MARK: - UISearchController라는 메서드가 존재함
        let searchController = UISearchController(searchResultsController: nil)
        
        // 뷰가 나타날 때, NavigationBar를 감추느냐?
        searchController.hidesNavigationBarDuringPresentation = false
        // searchBar의 placeholder String 값은?
        searchController.searchBar.placeholder = "Search"
        
        // MARK: - Search시, View의 업데이트를 누가 해주냐?
        searchController.searchResultsUpdater = self
        self.navigationItem.searchController = searchController
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as? ResultCell else {
            return UICollectionViewCell()
        }
        // MARK: - Assets에 기재된 animals1~24의 index를 문자열 보간으로
        // +1을 왜해? Index가 0부터 시작되므로
        let imageName = "animal\(indexPath.item + 1)"
        cell.configure(imageName)
        return cell
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Item간 Spacing
        let interItemSpacing: CGFloat = 1
        
        // 너비 구하기
        let width = (collectionView.bounds.width - interItemSpacing * 2) / 3
        
        // 1:1 비율이므로, 동일하게 계산
        let height = width
        
        // Cell 및 ContentView의 크기를 설정(CGSize)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

// MARK: - SearchViewController의 위임을 위한 Extension
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let search = searchController.searchBar.text
        print("search: \(search)")
    }
}
