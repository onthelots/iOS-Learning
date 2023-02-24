//
//  ContentView.swift
//  (10.18)SwiftUI_intro
//
//  Created by Jae hyuk Yim on 2022/10/18.
//

import SwiftUI

struct ContentView: View {
    
    // 인사말 함수 만들기!
    func sayHello () {
        print("안녕하세요!")
    }
    
    // body 내부에는 Stack 단일한 하나만 들어가야 함!!!
    var body: some View {
        /*
         VStack은 수직정렬 (Vertical) / HSTack은 수평정렬 (Horizon) (10번째까지만 가능함)
         그래서, list를 함께 활용함!
         */
        VStack(alignment: .center, spacing: 0.0) {
            TitleView()
                .padding(.vertical, 30.0)
            NamesView()
                .padding(.bottom, 7.0)
            
            
            
            // 일반 클로저
//            Button("Hello", action : {
//                sayHello()
//            })

            // 이벤트 처리! (Button을 예시로,..)
            // 후행 클로저
//            Button("Hello") {
//                sayHello()
//            }

            
            // 일반 클로저 (이미지)
//            Button(action:  {
//                print("앱스쿨 1기, 8조입니다!")
//            }, label : { Image(systemName: "mic.fill")
//
//            })
                
//            // 후행 클로저 (이미지)
//            Button(action:  {
//                print("앱스쿨 1기, 8조입니다!")
//            }) {
//                Image(systemName: "mic.fill")}
            
        }
        
        // 레이아웃 내 뷰가 나타나거나, 사라질 때 초기화 작업과 해제작업을 수행하기 위한 액션메서드를 선언할 수 있다!
        .onAppear(perform: {
            print("나타났어요")
        })
        .onDisappear(perform: {
            print("사라졌어요")
        })
    }
}






// Previews? 여러대가 함께 preview를 할 수 있기 때문!
// 다른 preview를 만드려면 그룹으로 감싸주기
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}

