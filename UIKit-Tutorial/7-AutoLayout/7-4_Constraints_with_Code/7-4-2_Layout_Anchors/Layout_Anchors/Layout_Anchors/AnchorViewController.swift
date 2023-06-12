//
//  AnchorViewController.swift
//  Layout_Anchors
//
//  Created by Jae hyuk Yim on 2023/06/12.
//

import UIKit

class AnchorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Custom Button
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        view.addSubview(button)
        
        // Constraints를 사용하기 위한 코드
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // safeArea의 영역을 나타내는 임의의 상수
        let safeArea = view.safeAreaLayoutGuide
        
        // Constraints -> isActive
        // 제약은 활성화, 비활성화 상태가 있는데 -> constraint 함수는 일종의 인스턴스를 생성해 주는 것이므로, 앞에 임의 인스턴스를 붙여야 함
        // 하지만, 그렇게 되면 모든 제약을 인스턴스로 생성해줘야 하므로 수정자 'isActive'를 맨 마지막에 붙여서 활성화(true)를 시켜주게 되면 별도의 오류가 발생하지 않음
        
        button.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true // leading
        button.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true // trailing
        
        // safeArea에서의 Bottom 관계 (우선도는 낮다 -> 하단의 Bar가 존재하지 않는 디바이스에서는 SafeArea와 View의 크기가 동일하므로, 하단에 완전 붙어서 보이는 문제가 발생할 수 있음)
        let safeBottonAnchor = button.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        safeBottonAnchor.isActive = true
        safeBottonAnchor.priority = .defaultLow
        
        // View와의 Bottom 관계 (우선도는 높다 -> 만약, 하단의 Bar가 존재하지 않는 디바이스의 레이아웃을 위해 Bottom에서부터 20만큼 떨어져야 한다)
        let viewBottomAnchor = button.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20)
        viewBottomAnchor.isActive = true
    }
}
