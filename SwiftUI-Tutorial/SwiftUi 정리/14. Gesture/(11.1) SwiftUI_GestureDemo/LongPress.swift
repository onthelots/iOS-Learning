//
//  LongPress.swift
//  (11.1) SwiftUI_GestureDemo
//
//  Created by Jae hyuk Yim on 2022/11/01.
//

import SwiftUI

struct LongPress: View {
    var body: some View {
        
        // Long Press
        // 장시간 터치하고 있을 때 감지되도록!
        // 디폴트 시간 이상 롱프레스를 감지하도록 조절할 수 있음
        
        let longPress = LongPressGesture(minimumDuration: 2, maximumDistance: 5)
            .onEnded { _ in
                    print("Long Press")
                }
            
            
            return Image(systemName: "hand.point.right.fill")
                .gesture(longPress)
            
        
        
    } // ---- body
} // ---- View

struct LongPress_Previews: PreviewProvider {
    static var previews: some View {
        LongPress()
    }
}
