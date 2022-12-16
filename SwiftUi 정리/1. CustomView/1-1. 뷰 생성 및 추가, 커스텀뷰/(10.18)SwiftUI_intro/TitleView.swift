//
//  TitleView.swift
//  (10.18)SwiftUI_intro
//
//  Created by Jae hyuk Yim on 2022/10/18.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        HStack {
            Image(systemName: "square.stack.3d.down.forward.fill")
            // resizable()은 이미지의 크기를 변경할 수 있도록 한다는 메서드
                .resizable()
            
            // aspectRatio() -비율맞추기-는 자동적으로 크기를 맞춰주는 메서드이며,
            // fill은 화면에 꽉 차며, fit을 하게 된다면, 가장 긴 쪽을 기준으로
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.orange)
                .padding(.horizontal, 30.0)
            
            Text("Hello LIKELION")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.leading)
                .padding(.trailing, 30.0)
            
            // 수정자 순서
            // border padding을 활용해서 알아보자면..
            // padding을 먼저 사용한다면?
            
//                .padding()
//                .border(Color.orange)
            // padding 범위가 먼저 잡아지고, border가 그려진다!
            
            
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
