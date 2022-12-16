//
//  NamesView.swift
//  (10.18)SwiftUI_intro
//
//  Created by Jae hyuk Yim on 2022/10/18.
//

import SwiftUI

struct NamesView: View {
    var body: some View {
        
        // VStack 인자로 활용되는 속성은 Spacing(간격)과 Alignment(정렬) 이며,
        VStack(alignment: .center, spacing: 15.0) {
            
            Text("🐣혜지")
            Text("🐣제균")
            Text("🐣현준")
            Text("🐣수현")
            Text("🐣현기")
            Text("🐣재혁")
            Text("🐣수만")
        }
        // 아래 메서드는 색상이나 폰트 등을 설정한다!
        // 근데 이렇게 하지 말고, '커스텀 수정자'를 활용하면 어떨까??
//        .font(.callout)
//        .foregroundColor(.orange)
        
        // 커스텀 수정자로 만든 구조체, StandardName을 참조(설정)하면??
        .modifier(StandardName())
        
    }
    
}

// 그런데, 텍스트의 모양을 수정할 때 마다 위와 같이 계속 '수정자'를 계속 적용해야 할까?
// 커스텀 수정자 (ViewModifier)
// 묶어서 필요할때마다 참조해라!!

struct StandardName: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
        .foregroundColor(.orange)
    }
}


struct NamesView_Previews: PreviewProvider {
    static var previews: some View {
        NamesView()
    }
}
