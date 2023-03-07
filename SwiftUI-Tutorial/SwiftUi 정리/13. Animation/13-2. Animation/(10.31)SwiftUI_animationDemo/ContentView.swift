//
//  ContentView.swift
//  (10.31)SwiftUI_animationDemo
//
//  Created by Jae hyuk Yim on 2022/10/31.
//




import SwiftUI

//

struct ContentView: View {
    
    // rotation 상태 프로퍼티를 추가함
    @State private var rotation: Double = 0.0
    
    // 그래픽에 활용되는 CGFloat값의 크기값 프로퍼티 추가
    @State private var scale: CGFloat = 1
    
    
    var body: some View {
        
        VStack {
            
            Button (action: {
                
                // 간단하게 정리!
                self.rotation = (self.rotation < 360) ? (self.rotation + 60) : 0
            
                
                self.scale = (self.scale < 2.8 ? self.scale + 0.3 : 1)
                
//                if rotation < 360 {
//                    rotation = rotation + 60
//                } else {
//                    rotation = 0
//                }
                
            }) {
                Text("Click to animate")
                // 돌아가는 이펙트 수정자인데, 정도는 rotation 값 정도로
//                    .scaleEffect(scale)
                    .rotationEffect(.degrees(rotation))
            
                // repeatCount()를 통해 지정된 횟수만큼 애니메이션을 반복함!
//                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: true),
//                               value: rotation)
//
                // animation() 수정자를 사용할 경우, animation() 수정자 이전에 적용된 수정자에게만 애니메이션이 암묵적으로 적용된다!
                // 이렇듯, 순서를 바꿔서 scaleEffect를 뒤로 뺀다면?
                // 그냥 툭툭 커지는 방식으로 작동된다 (즉, 애니메이션 적용이 되지 않는다)
                    .scaleEffect(scale)
                
            }
            
        } // ---- VStack
        
    }  // ---- body
    
} // ----- ContentView










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
