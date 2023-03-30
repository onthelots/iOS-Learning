//
//  FrameworkDetailViewController.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/05/01.
//

import UIKit
import Combine
import SafariServices

class FrameworkDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // Combine
    // Publisher -> 특정 반환값이 없지만, 초기값이 있으므로 CurrentValueSubject로
    let framework = CurrentValueSubject<AppleFramework, Never>(AppleFramework(name: "", imageName: "", urlString: "", description: ""))
    
    // Publisher2 -> Button 클릭 시 불러오는 값들에 대한 퍼블리셔 생성
    let buttonTapped = PassthroughSubject<AppleFramework, Never>()
    
    // description
    var description1 = Set<AnyCancellable>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        
        // 프레임워크 구독자 생성
        framework
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
                self.imageView.image = UIImage(named: framework.imageName)
                self.titleLabel.text = framework.name
                self.descriptionLabel.text = framework.description
            }
            .store(in: &description1)
        
        // 버튼 구독자 생성
        buttonTapped // 아래 learnMoreTapped 메서드를 통해 framework전체의 값을 가지고 있음
            .receive(on: RunLoop.main)
            .compactMap({ URL(string: $0.urlString)}) // 여기서 오퍼레이터가 생성되어야 함 -> URL에 대한 정보는 컴포넌트로 값을 할당할 수 없음! 따라서, 별도의 구독자를 생성해야 함
        // 즉, compactMap을 통해 요소의 urlString만 방출 할 수 있도록 함
            .sink { [unowned self] url in
                // sink 빌트인을 통해 아래 메서드를 실행하여 건네줌
                let safari = SFSafariViewController(url: url)
                self.present(safari, animated: true)
            }.store(in: &description1)
    }
    
    @IBAction func learnMoreTapped(_ sender: Any) {
        // 버튼이 눌릴때, buttonTapped(퍼블리셔)에게 데이터를 전송함
        buttonTapped.send(framework.value)
    }
}
