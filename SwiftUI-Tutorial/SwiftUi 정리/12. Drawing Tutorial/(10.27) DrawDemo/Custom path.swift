//
//  Custom path.swift
//  (10.27) DrawDemo
//
//  Created by Jae hyuk Yim on 2022/10/27.
//

import SwiftUI

struct Custom_path: View {
    var body: some View {
        VStack {
            MyShape()
                
            }
    }
}

// 만약, 따로 도형을 정의한다면?
// 커스텀 도형을 만든다!!
struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x:5, y:50))
        path.addLine(to: CGPoint(x:50, y: 30))
        path.addLine(to: CGPoint(x:300, y: 300))
       
        // 연결 후, 닫아버림
        path.closeSubpath()
        
        return path
        
    }
}





struct Custom_path_Previews: PreviewProvider {
    static var previews: some View {
        Custom_path()
    }
}
