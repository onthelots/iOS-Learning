//
//  DetailViewController.swift
//  TossBenefitTab
//
//  Created by Jae hyuk Yim on 2023/04/10.
//

import UIKit
import Combine

class DetailViewController: UIViewController {
    
//    var benefit: Benefit = Benefit.today
//    var benefitDetails: BenefitDetails = .default

    var detailViewModel: DetailViewModel!
    
    @IBOutlet weak var vStackView: UIStackView!
    @IBOutlet weak var ctaButton: UIButton!
    
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bind()
        detailViewModel.fetchDeatils()
    }
    
    private func bind(){
        detailViewModel.$benefit
            .receive(on: RunLoop.main)
            .sink { benefit in
                // benefit 데이터를 가져오고,
                self.ctaButton.setTitle(benefit.ctaTitle, for: .normal)
            }.store(in: &subscriptions)
        
        detailViewModel.$benefitDetails
            .receive(on: RunLoop.main)
            .compactMap { $0 }
            .sink { detail in
                self.addGuides(detail: detail)
            }.store(in: &subscriptions)
    }
    
    
    private func setupUI() {
        navigationItem.largeTitleDisplayMode = .never
        
        ctaButton.layer.masksToBounds = true
        ctaButton.layer.cornerRadius = 10
        ctaButton.setTitle(detailViewModel.benefit.ctaTitle, for: .normal)
    }
    
    // MARK: - GuideView 불로오기
    private func addGuides(detail: BenefitDetails) {
        
        let guideView = vStackView.arrangedSubviews.filter { $0 is DetailGuideView }
        guard guideView.isEmpty else { return }
        
        let guideViews: [DetailGuideView] = detail.guides.map { guide in
            let guideView = DetailGuideView(frame: .zero) // 사이즈
            guideView.icon.image = UIImage(named: guide.iconName)
            guideView.title.text = guide.guide
            return guideView
        }
        
        // 개별 View (= 아이템 두개)의 사이즈
        guideViews.forEach { view in
            self.vStackView.addArrangedSubview(view)
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 60)
            ])
        }
    }
    
}
