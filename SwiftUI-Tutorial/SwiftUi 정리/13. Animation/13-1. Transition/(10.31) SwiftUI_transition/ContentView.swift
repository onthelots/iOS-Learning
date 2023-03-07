//
//  ContentView.swift
//  (10.31) SwiftUI_transition
//
//  Created by Jae hyuk Yim on 2022/10/31.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isButtonVisiable: Bool = true
    
    
    var body: some View {
        VStack {
            
            // isbuttonvisiable의 Bool 값을 바꿔줌
            // true -> false -> true
            // animation 또한 추가
            Toggle(isOn: $isButtonVisiable.animation(
                .linear(duration: 1))) {
                Text("Show & Hide Button")
            }
            
            
            // 여기서의 조건문은 true일때 나오고, 아닐때는 버튼(Text)가 없어지는거지
            if isButtonVisiable {
                Button(action: {}) {
                    Text("Example Button")
                }
                .font(.largeTitle)
                .transition(.slide)
                
                
            }
            
            
        } // Vstack
        .padding()
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
