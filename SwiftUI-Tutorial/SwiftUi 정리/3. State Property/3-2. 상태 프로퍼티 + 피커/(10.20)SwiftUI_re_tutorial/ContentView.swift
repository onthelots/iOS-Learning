//
//  ContentView.swift
//  (10.20)SwiftUI_re_tutorial
//
//  Created by Jae hyuk Yim on 2022/10/20.
//

import SwiftUI

struct ContentView: View {
    
    // 배열 하나 만들고..
    var colors: [Color] = [.green, .blue, .purple, .orange]
    
    // 해당 배열의 이름을 picker에서 나타나게 하도록..
    var pickerName = ["green", "blue", "purple", "orange"]
    
    
    // 2. Slider에 rotation란 value 값으로 주기 위해, 스테이츠 프로퍼티를 추가한다.
    // @State 프로퍼티는 되도록 초기값을 잡아줘야 함!
    @State private var rotation:Double = 0.0
    @State private var text:String = "Welcome to SWiftUI"
    
    @State private var colorIndex = 0
    
    
    var body: some View {
        VStack {
            
            
            // 4. 위에 표시된 텍스트도, 위 text를 참조해서 나타나게 할까?
            Text(text)
                .font(.largeTitle)
                .fontWeight(.heavy)
            // Text에 rotationEffect를 주고, 그 정도를 위 상태 프로퍼티인 rot   ation의 값으로
            // 여기서 rotation은 왜 $바인딩을 해주지 않았나???
            // Slider는 rotation 값을 바꾸지만, 여기는 단순히 참조하는 값이니까!
                .rotationEffect(.degrees(rotation))
                .animation(.easeInOut(duration: 5), value: rotation)
                .foregroundColor(colors[colorIndex])
            
            
            // 1. Slider를 만들어 준다!
            Slider(value: $rotation, in : 0...360, step: 0.1)
            
            // 3. 아래 textfield를 만드는데, 그 text 또한 $text 바인딩 해온다!
            TextField("Enter text here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            Picker(selection: $colorIndex, label: Text("Colors")) {
                ForEach (0..<pickerName.count, id: \.self) {
                    Text(pickerName[$0])
                        .foregroundColor(colors[$0])
                }
            }
            .pickerStyle(.wheel)
            .padding()
            

            
            
        }
        .padding()
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
