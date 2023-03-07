//
//  ContentView.swift
//  (10.19) State, Observable, Environment
//
//  Created by Jae hyuk Yim on 2022/10/19.
//

import SwiftUI

struct ContentView: View {
    @State private var wifiEnable: Bool = true
    @State private var userName: String = ""
    
    var body: some View {
        VStack {
            
            Toggle(isOn: $wifiEnable) {
                Text("Wi-Fi 가능한가요?")
            }
            TextField("이름을 입력하세요", text: $userName)
            Text(userName)
            
            // 여기가 바로 아래 구조체인 WifiResultView의 객체를 받아 선언하는 곳이다!
            WifiResultView(wifiEnable: $wifiEnable)
   
        }
        .padding()
        .font(.title)
    }
}


struct WifiResultView: View {
    // 구조체 내 객체를 다른 View에 활용할 수 있도록, @Binding 키워드를 활용한다!
    // 이후, 다른 View에서 wifiResultView(wifiEnable: $wifiEnable)로 호출해준다.
    @Binding var wifiEnable : Bool
    
    var body: some View {
        Image(systemName: wifiEnable ? "wifi" : "wifi.slash")
        
        Text(wifiEnable ? "Wi-Fi 켜짐" : "Wi-Fi 꺼점")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
