//
//  FrameworkDetailViewController.swift
//  AppleFramework
//
//  Created by Jae hyuk Yim on 2023/03/27.
//

import UIKit

// MARK: - SafariService import
import SafariServices

class FrameworkDetailViewController: UIViewController {
    
    // MARK: - Framework를 index로 접근하지 않으므로 AppleFramework 자체를 선언
    // 초기값은 임의로 설정하고, 데이터 업데이트는 FrmaeworkListViewController에서 작업
    var framework: AppleFramework = AppleFramework(name: "Unkown", imageName: "", urlString: "", description: "")
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        imageView.image = UIImage(named: framework.imageName)
        titleLabel.text = framework.name
        descriptionLabel.text = framework.description
    }
    
    // MARK: - SafariView 띄우기 (IBAction)
    @IBAction func learnMoreTapped(_ sender: Any) {
        
        // url이 URL(string:) 형식이며, framework.urlString일 경우
        guard let url = URL(string: framework.urlString) else {
            return
        }
        
        // safariView는 SFSafariVieController의 인자값으로 위에서 선언한 url을 실행
        let safariView = SFSafariViewController(url: url)
        
        // 역시 모달뷰로 띄어야 하기 때문에, present 메서드 활용
        present(safariView, animated: true)
    }
}
