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
    
    
    // description
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.fetch()
        setupUI()
    }
    
    private func setupUI() {
        thumbnailImage.layer.masksToBounds = true
        thumbnailImage.layer.cornerRadius = 40
    }

    
    private func bind() {
        viewModel.$itemInfoDetails
            .compactMap { $0 }
            .receive(on: RunLoop.main)
            .sink { details in
                self.thumbnailImage.kf.setImage(with: URL(string: details.user.thumnail))
                self.nicknameLabel.text = details.user.name
                self.locationLabel.text = details.user.location
            }.store(in: &subscripiton)
    }
}
