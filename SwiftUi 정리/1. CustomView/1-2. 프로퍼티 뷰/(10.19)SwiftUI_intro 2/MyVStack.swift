//
//  MyVStack.swift
//  (10.19)SwiftUI_intro 2
//
//  Created by Jae hyuk Yim on 2022/10/19.
//

import SwiftUI

//struct MyVStack: View {
//    var body: some View {
//        VStack(alignment: .center, spacing : 10) {
//            Text("Text Contents 1")
//            Text("Text Contents 2")
//            Text("Text Contents 3")
//        }
//        .padding(.horizontal)
//        .font(.body)
//    }
//}
//
//struct MyVStack_Previews: PreviewProvider {
//    static var previews: some View {
//        MyVStack()
//    }
//}

struct MyVStack<Content:View> : View {
    let content: () -> Content
    init(@ViewBuilder  content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 10.0) {
            content()
        }
        .font(.largeTitle)
        
    }
}
