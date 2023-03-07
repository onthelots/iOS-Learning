//
//  ContentView.swift
//  (10.19) SwifUI tutorial
//
//  Created by Jae hyuk Yim on 2022/10/19.
//

import SwiftUI

struct ContentView: View {
    
    
    // 6. 사용자가 text뷰의 글자 색상을 선택할 수 있도록, 색상피커를 추가!
    // 우선, 색상이름 배열 [Color]과 색상 객체 배열을 함께 선언해주자.
    var colors: [Color] = [.red, .orange, .yellow, .green, .blue, .indigo, .purple]
    var colorNames = ["혜지", "제균", "현준", "수현", "현기", "재혁", "수만"]
    
    // 7. 추가로, 배열 인덱스 값을 저장하기 위해 인덱스 상태 프로퍼티를 추가한다
    
    
    @State private var colorIndex = 0
    // 1. 상태 프로퍼티 추가 (Text 뷰를 회전시키는 제어 기능)
    // Slider 뷰와 회전값을 저장하게 될 상태 프로퍼티 간의 바인딩 구축!
    @State private var rotation: Double = 0
    @State private var text: String = "Let's Start Coding!!"
    
    var body: some View {
        VStack {
            Spacer()
            Text(text)
                .font(.largeTitle)
                .fontWeight(.heavy)
            // 3. 회전 애니메이션 효과를 주기 위해, rotationEffect 메서드를 호출하고,
            // rotation 프로퍼티에 할당된 값을 읽기 위해 self.rotation값을 선언한다
            // 여기서, 단순히 값을 읽는것이기 때문에 $ 키워드는 붙이지 않는다.
                .rotationEffect(.degrees(self.rotation))
            
            // 4. 시간차 회전 애니메이션을 추가할 수도 있다.
                .animation(.easeInOut(duration: 5), value: self.rotation)
            
            // 9. text뷰 내 picker 뷰에 선택된 값으로 포그라운드 색상을 설정하도록 수정자를 추가한다!
                .foregroundColor(self.colors[self.colorIndex])
            
            Spacer()
            // 9. 뷰 사이를 명확하게 분리한다!
            Divider()
            
            AsyncImage(url: URL(string: "https://img.freepik.com/free-photo/cyber-security-programer-focused-writing-code-encounters-system-failure-while-parsing-algorithm-sitting-desk-system-engineer-having-unexpected-compiling-error-while-creating-software_482257-43989.jpg?w=826&t=st=1666169044~exp=1666169644~hmac=8d64f135b423311f88cbb06aadc3aadf6e2af4fb10374edeeb6eaf46a1a7fea2")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 430, height: 300)
            
            Divider()
            
            // 2. 슬라이더 뷰와 상태 프로퍼티를 바인딩함!
            // value의 상태는 프로퍼티인 'roration'을 바인딩 하므로, 앞에 $키워드를 붙인다!
            Slider(value: $rotation, in:0 ... 360, step:0.1)
                .padding()
            
            
            // 5. Text뷰에 표시가 되도록 TextField 뷰를 만들어 주자!
            // 현재는 text 상태 프로퍼티가 "Welcome to Swift UI"로 초기값이 작성되어 있으나,
            // 초기값을 모두 지우면 "Enter text here"이 상태 프로퍼티에 저장되어 있으므로 나타난다.
            TextField("Enter text here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // 8. Picker뷰는 아래와 같다!
            // colorIndex 상태 프로퍼티에서 선택된 것을 저장하고, ColorNames 배열에 있는 조원 이름이 표시되도록 한다.
            // 추가로, 조원의 이름별로 색상을 표시할 수 있도록 한다.
            Picker(selection: $colorIndex, label: Text("Color")) {
                ForEach (0 ..< colorNames.count, id: \.self) {
                    Text(self.colorNames[$0])
                        .foregroundColor(self.colors[$0])
                }
            }
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
