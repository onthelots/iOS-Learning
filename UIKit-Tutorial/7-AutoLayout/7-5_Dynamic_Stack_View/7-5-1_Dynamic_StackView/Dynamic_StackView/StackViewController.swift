//
//  StackViewController.swift
//  Dynamic_StackView
//
//  Created by Jae hyuk Yim on 2023/06/12.
//

import UIKit

class StackViewController: UIViewController {
    
    // Vertical Stack
    let verticalStackView: UIStackView = UIStackView()
    
    var viewCount: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SafeArea
        let safeArea = view.safeAreaLayoutGuide
        
        // Vertical Stack View
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(verticalStackView)
        
        //horizontal Stack View
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(horizontalStackView)
        
        // add Button
        let addButton = UIButton()
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(.blue, for: .normal)
        
        // MARK: - 메서드를 연결하는 방식 Target Action (addTarget)
        addButton.addTarget(self,
                            // #selector? -> 메서드의 이름을 참조하는 타입(구조체)이며, 메서드의 이름은 Funcion Notation으로 기재함
                            action: #selector(addView),
                            for: .touchUpInside)
        
        // remove Button
        let removeButton = UIButton()
        removeButton.setTitle("Remove", for: .normal)
        removeButton.setTitleColor(.red, for: .normal)
        
        removeButton.addTarget(self,
                               action: #selector(removeView),
                               for: .touchUpInside)
        
        
        // MARK: - addArrangedSubView (Stack View 내부에 Components 추가하기)
        horizontalStackView.addArrangedSubview(addButton)
        horizontalStackView.addArrangedSubview(removeButton)
        
        // distribution
        horizontalStackView.distribution = .fillEqually
        
        // constraints
        horizontalStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        horizontalStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        horizontalStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        
        verticalStackView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: horizontalStackView.topAnchor).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: horizontalStackView.leadingAnchor).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: horizontalStackView.trailingAnchor).isActive = true
            
    }
    
    @objc func addView() {
        let view = UIView()
        view.backgroundColor = .black
        view.isHidden = true
        
        // addArrangedview -> 특정 View가 추가됨
        verticalStackView.addArrangedSubview(view)
        viewCount = viewCount + 1
        print(viewCount)
        
        UIView.animate(withDuration: 0.3) {
            view.isHidden = false
        }
    }
    
    @objc func removeView() {
        // verticalStackView의 마지막 View (Optional Binding)
        guard let lastView = verticalStackView.arrangedSubviews.last else { return }
        verticalStackView.removeArrangedSubview(lastView)
        
        viewCount = viewCount - 1
        print(viewCount)
        
        UIView.animate(withDuration: 0.3) {
            lastView.isHidden = true
        } completion: { (_) in
            self.verticalStackView.removeArrangedSubview(lastView)
        }

        
    }
}
