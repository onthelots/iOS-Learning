//
//  SwiftUIFrame.swift
//  (10.19) SwiftUI_Stack&frame
//
//  Created by Jae hyuk Yim on 2022/10/19.
//

import SwiftUI

struct SwiftUIFrame: View {
    var body: some View {
        Text("Hello World,\nhow are you?\nThank you and you?")
            .font(.largeTitle)
//            .border(Color.black)
        // 여기까지만 작성하면, 알아서 테두리 크기가 정해져버림!
        
//            .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 300, alignment: .center)
//        // frame을 활용하여 테두리 크기를 아예 정해버린다!
        
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .border(Color.blue, width: 10)
        // 최소, 최대값을 0과 무한대로 설정하여 모든 영역을 차지하게 할 수도 있다!
        
    }
}

struct SwiftUIFrame_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIFrame()
    }
}
