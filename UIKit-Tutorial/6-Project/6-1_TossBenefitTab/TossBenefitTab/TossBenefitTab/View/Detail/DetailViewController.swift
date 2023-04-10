//
//  DetailViewController.swift
//  TossBenefitTab
//
//  Created by Jae hyuk Yim on 2023/04/10.
//

import UIKit

class DetailViewController: UIViewController {
    
    var benefit: Benefit = Benefit.today // 1차 데이터 (임의값)
    var benefitDetails: BenefitDetails = .default // 2차 가공 데이터

    @IBOutlet weak var vStackView: UIStackView!
    @IBOutlet weak var ctaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        addGuides()
    }
    
    private func setupUI() {
        navigationItem.largeTitleDisplayMode = .never
        
        ctaButton.layer.masksToBounds = true
        ctaButton.layer.cornerRadius = 10
        ctaButton.setTitle(benefit.ctaTitle, for: .normal) // 1차 데이터 연결 -> setTitle (버튼 타이틀)
    }
    
    private func addGuides() {
        let guideViews: [DetailGuideView] = benefitDetails.guides.map { guide in
            let guideView = DetailGuideView(frame: .zero)
            guideView.icon.image = UIImage(systemName: guide.iconName)
            guideView.title.text = guide.guide
            return guideView
        }
        
//        if benefit.type == "thisWeek" {
            guideViews.forEach { view in
                self.vStackView.addArrangedSubview(view) // vStackView에 새로운 subView를 추가함
                NSLayoutConstraint.activate([
                    view.heightAnchor.constraint(equalToConstant: 60) // View의 높이를 60으로 설정 (뷰 하나당)
                ])
            }
//        }
    }
    
}
