//
//  DetailGuideView.swift
//  TossBenefitTab
//
//  Created by Jae hyuk Yim on 2023/04/10.
//

import UIKit

final class DetailGuideView: UIView {
    // icon
    lazy var icon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // title
    lazy var title: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // exe
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    // error handling
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // AutoLayout
    private func setup() {
        // addSubview -> 추가될 view
        addSubview(icon)
        addSubview(title)
        // icon
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: self.leadingAnchor), // 좌측정렬
            icon.centerYAnchor.constraint(equalTo: self.centerYAnchor), // 중앙정렬
            icon.widthAnchor.constraint(equalToConstant: 20),
            icon.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        // title
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 20), // title의 좌측은 / icon의 우측과 20정도 떨어져서 정렬
            title.centerYAnchor.constraint(equalTo: icon.centerYAnchor), // title의 Y축과 icon의 Y축을 일치 -> 결국엔 동일한 Y축 좌표를 가지게 됨
        ])
    }
}
