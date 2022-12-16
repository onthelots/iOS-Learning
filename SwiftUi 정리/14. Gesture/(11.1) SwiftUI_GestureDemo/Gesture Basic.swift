//
//  ContentView.swift
//  (11.1) SwiftUI_GestureDemo
//
//  Created by Jae hyuk Yim on 2022/11/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    
            // 제스처 인식기를 변수에 할당하고, 수정자에서 그 변수를 참조하면 깔끔하게 정리됨!
        let tap = TapGesture(count:2)
                .onEnded { _ in
                    print("Tapped1")
                }
            
            
            return Image(systemName: "hand.point.right.fill")
                .gesture(tap)
            
            
        
            
    } // ---- body
}// ---- View






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
