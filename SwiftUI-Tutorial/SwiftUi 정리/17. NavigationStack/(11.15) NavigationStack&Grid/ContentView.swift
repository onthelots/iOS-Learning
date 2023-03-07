//
//  ContentView.swift
//  (11.15) NavigationStack&Grid
//
//  Created by Jae hyuk Yim on 2022/11/15.
//

import SwiftUI

struct ContentView: View {
    // 시작하자마자 특정 번호로 가고 싶다면?
    // 네비게이션은 배열밖에 받지 못하므로, 아래와 같이 상태프로퍼티 선언
//    @State private var previousNumbers: [Int] = [3]
    
    // NavigationPath()란 구조체를 선언하면?
    @State private var previousNumbers = NavigationPath()
    
    // NavigationPath()
    
    var body: some View {
        
        
        // previousNumbers가 먼저 나오기 위해, NavigationStack의 인자로 previousNumber를 선언! (path : )
        NavigationStack(path: $previousNumbers) {
            NavigationLink(value: "Bob") {
                Text("CEO")
            }
            
            
            
            
            List(1..<30) { index in
                NavigationLink(value: index) {
                    Label("Employee No. \(index))",
                             systemImage: "\(index).square")
                    
                }
            }
            .navigationDestination(for: Int.self) { index in
                Text("Hello, Employee No. \(index)")
            }
            .navigationDestination(for: String.self) { name in
                Text("CEO \(name) is specical one.")
            }
            
            .navigationTitle("Like Lion")
            
        } // NavigationStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
