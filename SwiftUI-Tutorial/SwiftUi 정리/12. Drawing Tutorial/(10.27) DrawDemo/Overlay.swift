//
//  Overlay.swift
//  (10.27) DrawDemo
//
//  Created by Jae hyuk Yim on 2022/10/27.
//

import SwiftUI

struct Overlay: View {
    var body: some View {
        Ellipse()
        // fill 과 foregroundGround, strokes(외곽선)은 함께 사용할 수 없다! (겹치니까)
        // 그래서, overlay을 활용함
            .fill(Color.red)
        
            .overlay(Ellipse()
                .stroke(Color.blue, lineWidth: 10)
            )
        
            .frame(width:250, height: 150)
    }
}




struct Overlay_Previews: PreviewProvider {
    static var previews: some View {
        Overlay()
    }
}
