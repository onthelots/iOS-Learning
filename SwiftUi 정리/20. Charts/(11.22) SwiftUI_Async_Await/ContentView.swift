//
//  ContentView.swift
//  (11.22) SwiftUI_Async_Await
//
//  Created by Jae hyuk Yim on 2022/11/22.
//

import SwiftUI

struct ContentView: View {
    
    var webService: WebService = WebService()
    let url = URL(string: "https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=10&serviceKey=IqV8U3oL39Xq5A1gSbKYKHnRESAPgGu397bHbKxmiAlqiHoR1Zkf5yNLne8Xtc%2B9MEt8XKceRDvE%2F%2Bu4%2Fn6rbQ%3D%3D")!
    
    var body: some View {
        VStack {
            Image(systemName: "stethoscope.circle.fill")
                .imageScale(.large)
                .font(.largeTitle)
                .foregroundColor(.accentColor)
            Text("Data")
            
            Spacer()
            
            Button("Fetch Data") {
                print("hello")
            }
            .font(.largeTitle)

            Spacer()
        }
        .padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
