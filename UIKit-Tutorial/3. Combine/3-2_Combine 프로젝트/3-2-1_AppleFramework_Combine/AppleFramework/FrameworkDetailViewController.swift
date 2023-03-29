//
//  FrameworkDetailViewController.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/05/01.
//

import UIKit
import SafariServices
import Combine

class FrameworkDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
//    @Published var framework: AppleFramework = AppleFramework(name: "Unknown", imageName: "", urlString: "", description: "")

    let buttonTapped = PassthroughSubject<AppleFramework, Never>() // 버튼클릭 퍼블리셔 생성
    var framework = CurrentValueSubject<AppleFramework, Never>(AppleFramework(name: "", imageName: "", urlString: "", description: "")) // 퍼블리셔 생성
    
    var subscription = Set<AnyCancellable>() // 구독티켓 생성
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        
        // Input (사용자의 인터렉션 - 버튼 클릭)
        // Framework -> url -> safari -> present
        // buttomTapped 데이터 내부에, compactMap으로 접근함으로서 URL String 값으로 캐스팅을 실시함
        buttonTapped
            .receive(on: RunLoop.main)
            .compactMap{ URL(string: $0.urlString)}
            .sink { [unowned self] url in
                let safari = SFSafariViewController(url: url)
                self.present(safari, animated: true)
            }.store(in: &subscription)
        
        // Output (데이터가 세팅이 될 시, UI를 업데이트)
        framework
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
                self.imageView.image = UIImage(named: framework.imageName)
                self.titleLabel.text = framework.name
                self.descriptionLabel.text = framework.description
            }.store(in: &subscription)
    }
    
    @IBAction func learnMoreTapped(_ sender: Any) {
        buttonTapped.send(framework.value)
    }
}
