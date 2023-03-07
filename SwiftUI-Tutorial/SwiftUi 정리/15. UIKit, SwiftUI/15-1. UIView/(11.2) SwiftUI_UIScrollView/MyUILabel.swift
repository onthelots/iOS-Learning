//
//  MyScrollView.swift
//  (11.2) SwiftUI_UIScrollView
//
//  Created by Jae hyuk Yim on 2022/11/02.
//

/*
 UIScrollView를
  -> SwiftUI 프로젝트에 통합하기 위해
  -> UIViewRepresentable 프로토콜을 사용하는 프로젝트
 */





import SwiftUI


// 기존 UIKit에서 제공되는 다양한 컴포넌트(하위 기능)을 SwiftUI에서 사용하기 위해,
// 1. 먼저, UIViewReprestable 프로토콜을 받아옴으로서 구조체를 래핑한다.
// 2. 여기서, 최소한으로 구현되어야 할 메소드는 다음과 같다.
// makeUIView() : UIView 기반 컴포넌트의 인스턴스를 생성하고, 초기화 작업을 수행 -> 반환하는 역할
// updateView() : UIView 자체에 대한 업데이트(변경)사항이 -> SwiftUI 뷰에서 생길 때 마다 호출
struct MyUILabel: UIViewRepresentable {
    
    
    // 구현해야 하는 text 프로퍼티를 미리 생성
    var text: String
    
    // 최소구현 메소드 1. makeUIView
    // context란 인자는, UIViewRepresentableContext 구조체를 참조하며, 래핑된 구조체인 <MyScrollView>에서 구현한다.
    // 반환값은 UIView (라벨형태)
    func makeUIView(context: UIViewRepresentableContext<MyUILabel>) -> UILabel {
        
        // 인스턴스를 생성하고,
        let myLabel = UILabel()
        
        // 초기화 하고 (구조체 내부에 선언된 프로퍼티)
        myLabel.text = self.text
        
        // UILabel을 반환한다.
        return myLabel
        
    }
    
    
    func updateUIView(_ uiView: UILabel, context: UIViewRepresentableContext<MyUILabel>) {
        // 필요한 업데이트 작업
    }
    
    
}








struct MyUILabel_Previews: PreviewProvider {
    static var previews: some View {
        
        // 더미값을 준다
        MyUILabel(text: "Hello")
    }
}
