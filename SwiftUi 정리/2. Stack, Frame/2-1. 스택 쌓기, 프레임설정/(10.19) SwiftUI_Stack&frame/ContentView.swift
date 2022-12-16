//
//  ContentView.swift
//  (10.19) SwiftUI_Stack&frame
//
//  Created by Jae hyuk Yim on 2022/10/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // ---- V스택 전체
        VStack(spacing: 10.0) {
            Text("회계장부")
                .font(.title)
                .padding()
            
            // --- 내부 H스택
            HStack(alignment: .top) {
                Text("1분기")
                Spacer()
                // --1. 내부 V스택
                VStack(alignment: .trailing, spacing: 15.0) {
                    Text("1월")
                    Text("2월")
                    Text("3월")
                }
                Spacer()
                // --1.내부 V 스택
                
                // --2. 내부 V스택
                VStack(alignment: .trailing, spacing: 15.0) {
                    Text("1,000$")
                    Text("200$")
                    Text("3,000$"   )
                }
                .padding([.top, .bottom, .trailing], 5.0)
                // --2. 내부 V스택
                
            }
            // --- 내부 H 스택
            
        }
        // ---- V스택 전체
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
