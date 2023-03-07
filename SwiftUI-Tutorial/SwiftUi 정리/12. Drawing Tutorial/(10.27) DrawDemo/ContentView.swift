//
//  ContentView.swift
//  (10.27) DrawDemo
//
//  Created by Jae hyuk Yim on 2022/10/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Rectangle!")
            Rectangle()
                .fill(Color.green)
                .frame(width: 200, height: 100)
            
            
            // Circle()의 경우, 가로세로가 없기 때문에 width로 조정한다.
            // 타원형이 아니다!
            Text("Hello, Rectangle!")
            Circle()
                .fill(Color.cyan)
                .frame(width: 200, height: 100)
            
            Text("Capsule")
            Capsule()
                .stroke(lineWidth: 10)
                .foregroundColor(.blue)
                .frame(width: 200, height : 100)
            
            
            // RoundRectangle은 반드시 conerRadius 인자가 포함되어 있어야 함
            Text("RoundRectangle")
            RoundedRectangle(cornerRadius: CGFloat(20))
                .stroke(style: StrokeStyle(lineWidth: CGFloat(8), dash: [CGFloat(10), CGFloat(5)]))
                .frame(width: 200, height: 100)
            
            
            //Ellipse()는 타원!!
            Text("Ellipse")
            Ellipse()
                .stroke(style: StrokeStyle(lineWidth: CGFloat(8), dash: [CGFloat(10), CGFloat(5), CGFloat(2)], dashPhase: CGFloat(10)))
                .foregroundColor(.brown)
                .frame(width: 200, height: 100)
            
        }
        .padding()
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
