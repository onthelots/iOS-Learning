//
//  SheetDemo.swift
//  (11.15) NavigationStack&Grid
//
//  Created by Jae hyuk Yim on 2022/11/15.
//

import SwiftUI

struct SheetDemo: View {
    
    @State private var showingSheet = false
    
    // 새로운 모달, sheet 뷰 만들기
    var body: some View {
        NavigationStack {
            Button {
                showingSheet.toggle()
            } label: {
                Text("Show Sheet")
            }
        }
        .sheet(isPresented: $showingSheet) {
            SheetNavigationView()
            // presentationDetents 메서드를 통해 모달뷰의 크기를 조정할 수 있음
            // medium은 절반 이하로, large를 추가하면 끌어서 위로 올릴 수 있음
            // height를 통해 Frame을 설정할 수 있음
            // fraction을 통해
                .presentationDetents([.height(50), .medium, .large])
        }
        
    }
    
    
}


struct SheetNavigationView: View {
    // 새로운 모달, sheet 뷰 만들기
    var body: some View {
        VStack {
            Text("Hello")
        }
    }
    
    
}








struct SheetDemo_Previews: PreviewProvider {
    static var previews: some View {
        SheetDemo()
    }
}
