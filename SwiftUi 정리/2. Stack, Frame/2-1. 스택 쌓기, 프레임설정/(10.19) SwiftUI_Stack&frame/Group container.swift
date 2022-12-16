//
//  Group container.swift
//  (10.19) SwiftUI_Stack&frame
//
//  Created by Jae hyuk Yim on 2022/10/19.
//

import SwiftUI

struct Group_container: View {
    var body: some View {
        
        // Group 활용하기!
        // 10개 까지만 자식 뷰를 담을 수 있도록 제한되어 있다!
        // 하지만.. 아래와 같이 2개의 Group으로 묶는다면?
        // VStack은 2개 그룹만 자식 뷰로 여기게 된다!!
        VStack {
            Group {
                Text("Sample Text 1")
                Text("Sample Text 2")
                Text("Sample Text 3")
                Text("Sample Text 4")
                Text("Sample Text 5")
                Text("Sample Text 6")
                Text("Sample Text 7")
                Text("Sample Text 8")
                Text("Sample Text 9")
                Text("Sample Text 10")
            }
            
            Group {
                Text("Sample Text 1")
                Text("Sample Text 2")
                Text("Sample Text 3")
                Text("Sample Text 4")
                Text("Sample Text 5")
                Text("Sample Text 6")
                Text("Sample Text 7")
                Text("Sample Text 8")
                Text("Sample Text 9")
                Text("Sample Text 10")
            }
        }
    }
}




struct Group_container_Previews: PreviewProvider {
    static var previews: some View {
        Group_container()
    }
}
