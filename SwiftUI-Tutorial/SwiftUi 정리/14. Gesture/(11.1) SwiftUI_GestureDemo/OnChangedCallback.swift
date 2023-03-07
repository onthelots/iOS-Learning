//
//  OnChangedCallback.swift
//  (11.1) SwiftUI_GestureDemo
//
//  Created by Jae hyuk Yim on 2022/11/01.
//

import SwiftUI

struct OnChangedCallback: View {
    
    // 상태 프로퍼티를 지정해놓고,
    @State private var magnification: CGFloat = 1.0
    
    
    var body: some View {
        
        let magnificationGesture = MagnificationGesture(minimumScaleDelta: 0)
        
        // 여기서 콜백액션을 추가한다면, 처음 작동을 할 시 동작을 감지하여 메세지를 바로 출력함!
            .onChanged({ value in
                print("Magnifying \(value)")
                // value 인자값을 magnification 상태 프로퍼티 값으로 할당함
                self.magnification = value
            })
            
            
            
            .onEnded { _ in
                print("Gesture Ended")
            }
        
        
        return VStack {
            Image(systemName: "hand.point.right.fill")
                .resizable()
                .font(.largeTitle)
                .scaleEffect(magnification)
                .gesture(magnificationGesture)
                .frame(width: 100, height: 90)
            
            
            
        } // ---- VStack
    } // ---- body
} // ---- View


struct OnChangedCallback_Previews: PreviewProvider {
    static var previews: some View {
        OnChangedCallback()
    }
}
