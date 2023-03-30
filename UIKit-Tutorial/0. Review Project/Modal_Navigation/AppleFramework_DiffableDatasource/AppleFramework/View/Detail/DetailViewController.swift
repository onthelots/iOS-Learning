//
//  DetailViewController.swift
//  AppleFramework
//
//  Created by Jae hyuk Yim on 2023/03/30.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController {

    var detail: AppleFramework = AppleFramework.init(name: "", imageName: "", urlString: "", description: "")
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configure(_ detail: AppleFramework) {
        thumbnailImage.image = UIImage(named: detail.imageName)
        nameLabel.text = detail.name
        descriptionLabel.text = detail.description
    }
    
    @IBAction func learnMoreTapped(_ sender: Any) {
        guard let url = URL(string: detail.urlString) else {
            return
        }
        
        // SFSafariViewController
        let safariView = SFSafariViewController(url: url)
        
        // modality
        present(safariView, animated: true)
    }
}
