//
//  safariView.swift
//  (11.2) SwiftUI_WebMapDemo
//
//  Created by Jae hyuk Yim on 2022/11/02.
//

import SwiftUI

// 사파리 웹을 받아오려면, 아래 사항을 Import 해야 함
import SafariServices



struct SafariView: UIViewControllerRepresentable {
 
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        
        return SFSafariViewController(url: URL(string: "https://naver.com")!)
    }
    
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        //
    }
}







struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView()
    }
}
