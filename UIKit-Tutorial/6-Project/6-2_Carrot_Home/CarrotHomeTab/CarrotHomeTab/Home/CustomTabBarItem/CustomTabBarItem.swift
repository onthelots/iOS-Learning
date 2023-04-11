//
//  CustomTabBarItem.swift
//  CarrotHomeTab
//
//  Created by Jae hyuk Yim on 2023/04/11.
//

import Foundation
import UIKit

// MARK: - CustomBarItem 컴포넌트 설정(Configuration)
struct CustomBarItemConfiguration {
    
    typealias Handler = () -> Void // typealias를 통해 미리 설정함
    
    let title: String?
    let image: UIImage?
    let handler: Handler
    
    //init -> nil값으로 초기화, handler는 외부에서도 써야하니 @escaping 클로저 타입으로 선언
    init(title: String? = nil, image: UIImage? = nil, handler: @escaping Handler) {
        self.title = title
        self.image = image
        self.handler = handler
    }
}

// MARK: - Custom View (UIButton)만들기
final class CustomTabBarItem: UIButton {
    // 타이틀, 이미지, 타겟, 액션 핸들러
    
    // CustomBarItem 컴포넌트 가져오기
    var customBarItemConfig: CustomBarItemConfiguration
    
    // CustomBarItem 컴포넌트 값 할당하기
    init(config: CustomBarItemConfiguration) {
    
        self.customBarItemConfig = config
       
        // MARK: - 1. 필수 Designated initializer (코드로서 호출됨)
        super.init(frame: .zero)
        
        // 🔵 스타일 설정 -> 자동 초기값
        setupStyle()
        // 🔴 데이터 업데이트 -> 자동 초기값
        updateConfig() // 데이터 업데이트 -> 자동 초기값
        // 🟣 타깃(addTarget) -> UIButton을 클릭할 경우, 실행될 메서드(buttonTapped)
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside) // #selector -> objective-C 런타임으로 실행되는 메서드를 사용하기 위해 선언함
    }
    // 🔵 Title(Label), Image(View) 스타일 설정
    private func setupStyle() {
        self.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        self.titleLabel?.textColor = .white
        self.imageView?.tintColor = .white
    }
    
    // 🔴 Title(setTitle), Image(setImage) 데이터 업데이트
    private func updateConfig() {
        self.setTitle(customBarItemConfig.title, for: .normal) // UIButton에 있는 메서드(setTitle)
        self.setImage(customBarItemConfig.image, for: .normal) //  UIButton에 있는 메서드(setTitle)
    }
    
    // MARK: - 2. 필수 Designated initializer (스토리보드로서 호출됨)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 🟣 objective-c 코드 활용하기 (buttonTapped()) -> 궁극적으로, navigationItem.rightBarButtonItem = UIBarButtonItem(customView: <#T##UIView#>)
    // UIView 형식이지만, Button 형식으로 작동할 것이기 때문에 buttonTapped() 함수를 작동시킴
    @objc func buttonTapped() {
        customBarItemConfig.handler()
    }
}
