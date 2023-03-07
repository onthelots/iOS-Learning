//
//  WebTapView.swift
//  (11.2) SwiftUI_WebMapDemo
//
//  Created by Jae hyuk Yim on 2022/11/02.
//

import SwiftUI

struct WebTapView: View {
    
    @State private var isShowingSheet: Bool = false
    
    
    
    var body: some View {
        VStack {q
            Button(action: {
                isShowingSheet.toggle()
            }) {
                Text("Open Web Browser")
            }
        } // VStack
        
        // 모달뷰 만들어주기!
        .sheet(isPresented: $isShowingSheet, onDismiss: didDismiss) {
            SafariView()
            
        }

            
    } // --- body
    
    func didDismiss () {
        //handle the dissmissing action.
    }
}




struct TapModalView: View {
    
    var body: some View {
        Text("Hello")
    }
}





struct WebTapView_Previews: PreviewProvider {
    static var previews: some View {
        WebTapView()
    }
}
