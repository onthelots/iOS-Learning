//
//  ContentView.swift
//  (10.19)SwiftUI_intro 2
//
//  Created by Jae hyuk Yim on 2022/10/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            
            MyVStack {
                Text("Hello")
                Text("Hello")
                Text("Hello")
            }
        }
        // 커스텀 수정자 (속성모음)
        .modifier(modifierView())
        
    }
}


struct modifierView : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .padding()
            .border(Color.gray, width: 1.0)

    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
