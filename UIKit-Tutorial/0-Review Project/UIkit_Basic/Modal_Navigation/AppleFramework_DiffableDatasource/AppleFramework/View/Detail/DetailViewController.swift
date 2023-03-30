//
//  DetailViewController.swift
//  AppleFramework
//
//  Created by Jae hyuk Yim on 2023/03/30.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController {

    var items: AppleFramework = AppleFramework(name: "", imageName: "", urlString: "", description: "")
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update(items)
    }
    
    private func update(_ item: AppleFramework) {
        thumbnailImage.image = UIImage(named: item.imageName)
        nameLabel.text = item.name
        descriptionLabel.text = item.description
    }
    
    @IBAction func learnMoreTapped(_ sender: Any) {
        // url 유효성 검사
        guard let url = URL(string: items.urlString) else {
            return
        }
        // SFSafariViewController 연결
        let safariView = SFSafariViewController(url: url)
        // 모달뷰
        present(safariView, animated: true)
    }
}
