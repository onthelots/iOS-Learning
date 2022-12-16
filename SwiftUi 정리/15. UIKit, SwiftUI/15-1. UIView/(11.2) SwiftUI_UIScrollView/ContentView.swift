//
//  ContentView.swift
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

struct ContentView: View {
    var body: some View {
        VStack {
            
            
            // MYScrollView에서 생성한 래핑된 구조체를 여기서 나타낼 수 있다.
            // 하지만, 이는 단순히 UILabel 텍스트로 정적 컴포넌트 이므로,
            // 이벤트에 대한 반응을 위해 코디네이터(coordinator)를 구현함으로서 UIViewRepresentable 래퍼를 확장한다.
            MyUILabel(text: "Hello UIKit")
        }
        .padding()
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
