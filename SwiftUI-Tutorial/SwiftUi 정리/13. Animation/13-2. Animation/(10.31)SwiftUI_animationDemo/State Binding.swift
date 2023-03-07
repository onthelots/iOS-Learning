//
//  State Binding.swift
//  (10.31)SwiftUI_animationDemo
//
//  Created by Jae hyuk Yim on 2022/10/31.
//

import SwiftUI

struct State_Binding: View {
    
    @State private var visibility: Bool = true
    
    
    var body: some View {
        
        VStack {
            
            // 여기서 Visibility 상태 프로퍼티를 바인딩 ($) !
            Toggle(isOn: $visibility.animation(.linear(duration: 5))) {
                Text("Toggle Text View")
            }
            .padding()
            
            
            
            if visibility {
                Text("Hello, World")
                    .font(.largeTitle)
            } else {
                Text("Goodbye, World")
                    .font(.largeTitle)
            }
            
            
        } // VStack
        
        
    } // body
    
} // View











struct State_Binding_Previews: PreviewProvider {
    static var previews: some View {
        State_Binding()
    }
}
