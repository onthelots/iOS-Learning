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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
