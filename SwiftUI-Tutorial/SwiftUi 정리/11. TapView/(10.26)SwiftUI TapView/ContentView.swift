//
//  ContentView.swift
//  (10.26)SwiftUI TapView
//
//  Created by Jae hyuk Yim on 2022/10/26.
//

import SwiftUI

struct ContentView: View {
    
    // 상태프로퍼티 값을 변경하면, 태그 값에 따라 해당 뷰로 전환된다!
    @State private var selection = 1
    
    var body: some View {
        
        TabView(selection: $selection) {
            Text("First Content View")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Screen One")
                }.tag(1)
            
            Text("Second Content View")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Screen Two")
                }.tag(2)
            
            Text("Third Content View")
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Screen Three")
                }.tag(3)
            
            Text("Fourth Content View")
                .tabItem {
                    Image(systemName: "4.circle")
                    Text("Screen Three")
                }.tag(4)
            
        }// ~~~ TabView
        .font(.largeTitle)

    }// ~~~ Body
    
} // ~~~~~ ContentView











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
