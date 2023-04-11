//
//  HomeViewController.swift
//  CarrotHomeTab
//
//  Created by Jae hyuk Yim on 2023/04/11.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    let viewModel: HomeViewModel = HomeViewModel(network: NetworkService(configuration: .default))
    var subscription = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetch() // ViewModel에서 선언한 fetch 함수를 실행
        bind()
    }
    private func bind() {
        
        // Input - item 가져오기
        viewModel.$items
            .receive(on: RunLoop.main)
            .sink { items in
                print("--> update CollectionView \(items)")
            }.store(in: &subscription)
        
        // Output - 사용자 인터렉션 실행하기
        viewModel.itemTapped
            .sink { item in
                let sb = UIStoryboard(name: "Detail", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }.store(in: &subscription)
    }
}
