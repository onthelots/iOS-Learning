//
//  DetailViewController.swift
//  CarrotHomeTab
//
//  Created by Jae hyuk Yim on 2023/04/11.
//

import UIKit
import Combine
import Kingfisher

class DetailViewController: UIViewController {

    var viewModel: DetailViewModel!
    var subscripiton = Set<AnyCancellable>()
    
    // User
    @IBOutlet weak var itemThumbnail: UIImageView!
    @IBOutlet weak var userThumbnail: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userLocationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    // ItemInfoDetails
    @IBOutlet weak var itemInfoTitle: UILabel!
    @IBOutlet weak var itemInfoDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.fetch()
        configurationNavigationBar()
        setupUI()
 
    }
    
    private func bind() {
        viewModel.$itemInfoDetails
            .compactMap{ $0 }
            .receive(on: RunLoop.main)
            .sink { details in
                self.itemThumbnail.kf.setImage(with: URL(string: details.item.thumbnailURL))
                self.userThumbnail.kf.setImage(with: URL(string: details.user.thumnail))
                self.userNameLabel.text = details.user.name
                self.userLocationLabel.text = details.user.location
                self.temperatureLabel.text = "\(details.user.temperature)°C"
                self.itemInfoTitle.text = details.item.title
                self.itemInfoDescription.text = details.details.descriptions
                
            }.store(in: &subscripiton)
    }
    
    private func configurationNavigationBar() {
        // MARK: - SearchConfig 초기값 설정하기
        let moreConfig = CustomBarItemConfiguration(
            image: UIImage(systemName: "ellipsis"),
            handler: { print("---> searchItem Selected")})
        let moreItem = UIBarButtonItem.generate(
            with: moreConfig,
            width: 30)
        
        // MARK: - 오른쪽 버튼 초기값 설정하기
        let shareConfig = CustomBarItemConfiguration(
            image: UIImage(systemName: "square.and.arrow.up"),
            handler: { print("---> searchItem Selected")})
        let shareItem = UIBarButtonItem.generate(
            with: shareConfig,
            width: 30)
        
        navigationItem.rightBarButtonItems = [shareItem, moreItem] // 2개 이상일 경우, rightBarButtonItems(배열)에 할당하기
        navigationItem.backButtonDisplayMode = .minimal // backButton의 모드 설정 (.miniaml일 경우, 아이콘으로만 설정됨)
    }
    
    private func setupUI() {
        self.userThumbnail.layer.masksToBounds = true
        self.userThumbnail.layer.cornerRadius = 50
    }
}
