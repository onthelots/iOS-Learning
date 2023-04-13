//
//  UIBarButtonItem+CustomView.swift
//  CarrotHomeTab
//
//  Created by Jae hyuk Yim on 2023/04/11.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    static func generate(with config: CustomBarItemConfiguration, width: CGFloat? = nil) -> UIBarButtonItem {
        
        // 1. customView -> TabBarItem의 데이터를 할당
        let customView = CustomTabBarItem(config: config)
        
        // 2. customView의 레이아웃 초기값 할당 (NSLayoutConstraint.activate)
        // width가 할당될 때만 적용함
        if let width = width {
            NSLayoutConstraint.activate([
                customView.widthAnchor.constraint(equalToConstant: width)
            ])
        }
        
        // 3. barButtonItem -> UIBarButtonItem의 customView를 할당
        let barButtonItem = UIBarButtonItem(customView: customView)
        
        // 4. 반환
        return barButtonItem
    }
}
