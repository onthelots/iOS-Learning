//
//  explicit animation.swift
//  (10.31)SwiftUI_animationDemo
//
//  Created by Jae hyuk Yim on 2022/10/31.
//

import SwiftUI

struct explicit_animation: View {
    // rotation 상태 프로퍼티를 추가함
    @State private var rotation: Double = 0.0
    
    // 그래픽에 활용되는 CGFloat값의 크기값 프로퍼티 추가
    @State private var scale: CGFloat = 1
    
    var body: some View {
        
        VStack {
            
            // 명시적 애니메이션
            // 클로저 내에 변경된 프로퍼티만 애니메이션이 됨!
            Button (action: { withAnimation(.linear(duration: 2)) {
                
                // 여기 내부에 적용된 프로퍼티인 rotation 만 애니메이션이 적용 될 것임!
                self.rotation = (self.rotation < 360) ? (self.rotation + 60) : 0
            }
                
                
                // 즉, 명시적 애니메이션 클로저 구문 밖에 있는 scale은 적용이 되지 않음
                self.scale = (self.scale < 2.8 ? self.scale + 0.3 : 1)
                
                
            }) {
                Text("Click to animate")
                
                    .rotationEffect(.degrees(rotation))
                    .scaleEffect(scale)
                
                
                
                
                
            }
        }
    }
}










struct explicit_animation_Previews: PreviewProvider {
    static var previews: some View {
        explicit_animation()
    }
}
