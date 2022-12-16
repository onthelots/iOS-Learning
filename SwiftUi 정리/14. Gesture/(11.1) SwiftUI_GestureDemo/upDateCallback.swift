//
//  upDateCallback.swift
//  (11.1) SwiftUI_GestureDemo
//
//  Created by Jae hyuk Yim on 2022/11/01.
//

import SwiftUI


// 새로운 프로퍼티래퍼 사용
/*
 1. offset을 먼저 프로퍼티 래퍼로 선언하고
 2.
 */


struct upDateCallback: View {
    
    // 제스처 상태 프로퍼티 (오프셋) -> 0.0
    @GestureState private var offset: CGSize = .zero
    
    // 제스처 상태 프로퍼티 추가!
    // longPress
    @GestureState private var longPress: Bool = false
    
    
    var body: some View {
        
        // 순차적인 제스처를 구성해야함!
        // 여기서, 먼저 longPressAndDrag가 완료된 후, 드래그 작업을 시작할 수 있음
        let longPressAndDrag = LongPressGesture(minimumDuration: 1.0)
            .updating($longPress) { value, state, transition in
                state = value
            }
            .simultaneously(with: DragGesture())
            .updating($offset) { value, state, transaction in
                state = value.second?.translation ?? .zero
            }
        
        
        
//        let drag = DragGesture()
//            .updating($offset) { dragValue, state, transaction in
//                state = dragValue.translation
//            }
//
        
        return Image(systemName: "hand.point.right.fill")
            .foregroundColor(longPress ? Color.red : Color.blue)
            .font(.largeTitle)
            .offset(offset)
            .gesture(longPressAndDrag)
        
        
    }
    
}









struct upDateCallback_Previews: PreviewProvider {
    static var previews: some View {
        upDateCallback()
    }
}
