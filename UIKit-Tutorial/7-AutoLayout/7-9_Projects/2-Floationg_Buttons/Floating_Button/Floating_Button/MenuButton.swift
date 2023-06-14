//
//  MenuButton.swift
//  Floating_Button
//
//  Created by Jae hyuk Yim on 2023/06/14.
//

import UIKit

class MenuButton: UIView {
    private var defaultButton: UIButton!
    private var expendStackButtons: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addMenuButton()
        addMenuStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuButton {
    private func addMenuButton() {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "tray",
                            withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle))
        
        button.setImage(image, for: .normal)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // 👆🏻MenuButton의 하위뷰 Subview로 지정
        addSubview(button)
        
        // Constraints
        // ✅ defaultButton의 Top을 MenuButton(전체 View) TopAnchor와 정렬,
        // 그러나 추후 StackButton(View)가 Toggle 될 경우를 대비하여 우선도를 낮춰줌
        let buttonTopConstraints = button.topAnchor.constraint(equalTo: topAnchor)
        buttonTopConstraints.priority = .defaultLow
        buttonTopConstraints.isActive = true
        
        button.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        // action
        button.addTarget(self,
                         action: #selector(tapMenuButton),
                         for: .touchUpInside)
        
        defaultButton = button
    }
    
    @objc private func tapMenuButton() {
        
        // 일반적인 애니메이션 효과
//        UIView.animate(withDuration: 0.3) {
//            self.expendStackButtons.arrangedSubviews.forEach { (button) in
//                button.isHidden.toggle()
//            }
//        }
        
        // Damping 애니메이션 효과 
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5) {
            self.expendStackButtons.arrangedSubviews.forEach { (button) in
                button.isHidden.toggle()
            }
        }
    
        
        // UI 업데이트 Task의 Queue를 가장 맨 앞쪽으로 우선순위를 변경, 곧바로 UI가 변경될 수 있도록 함
        expendStackButtons.layoutIfNeeded()
    }
    
    private func addMenuStack() {
        
        let stackButtons = UIStackView()
        stackButtons.axis = .vertical
        stackButtons.translatesAutoresizingMaskIntoConstraints = false
        
        let images: [String] = ["square.and.arrow.up.circle.fill",
                                "folder.fill.badge.plus",
                                "trash.circle.fill"]
        
        images.forEach { (imageName) in
            let button = UIButton(type: .system)
            let image = UIImage(systemName: imageName,
                                withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle))
            
            button.setImage(image, for: .normal)
            stackButtons.addArrangedSubview(button)
            
            // animated
            button.isHidden = true
            button.tintColor = .systemCyan
        }
        
        // 👆🏻MenuButton의 하위뷰 Subview로 지정
        addSubview(stackButtons)
        stackButtons.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        // ✅ 여기서 StackButtons의 Bottom은 또 다른 하위뷰인 defaultsButton의 TopAnchor와 10만큼 떨어지게 만들어 둠 (하지만, hidden으로 인해 보이지 않게 됨)
        stackButtons.bottomAnchor.constraint(equalTo: defaultButton.topAnchor,
                                             constant: -10).isActive = true
        
        // ✅ StackButtons의 Top을 MenuButton(전체 View) TopAnchor와 정렬,
        // Toggle 될 경우, Hidden되어 있던 View가 나타나고 Height가 증가할 것이므로 중요도를 높게 설정함
        let stackTopConstraint = stackButtons.topAnchor.constraint(equalTo: topAnchor)
        stackTopConstraint.isActive = true
        stackTopConstraint.priority = .defaultHigh
        
        expendStackButtons = stackButtons
    }
}
