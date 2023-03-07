//
//  Text constraint.swift
//  (10.19) SwiftUI_Stack&frame
//
//  Created by Jae hyuk Yim on 2022/10/19.
//

import SwiftUI

struct Text_constraint: View {
    var body: some View {
        HStack {
            Image(systemName: "airplane")
            Text("Flight times")
            Text("London").layoutPriority(1)
            // 뒤 괄호안의 값은 0 (디폴트 값) 이상이면 가능하다!
        }
        .font(.largeTitle)
        .lineLimit(1)
        // 1줄로 제한한다!
        
        
    }
}

struct Text_constraint_Previews: PreviewProvider {
    static var previews: some View {
        Text_constraint()
    }
}
