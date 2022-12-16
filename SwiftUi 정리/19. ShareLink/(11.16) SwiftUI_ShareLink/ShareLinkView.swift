//
//  ShareLinkView.swift
//  (11.16) SwiftUI_ShareLink
//
//  Created by Jae hyuk Yim on 2022/11/16.
//

import SwiftUI


struct SharingPhoto: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.image)
    }
    
    public var image: Image
    public var caption: String
    
    
}



struct ShareLinkView: View {
    
    private let likeLionURL = URL(string: "https://likelion.net")!
    private let photo = SharingPhoto(image: Image(systemName: "flame"), caption: "This is a flame!")
    
    var body: some View {
        VStack {
            ShareLink(item: likeLionURL) {
                Label("Share", systemImage: "link.icloud")
            }
            .padding(20)
            Divider()
            
            photo.image
                .font(.largeTitle)
            
            ShareLink(item: photo,
            subject: Text("Flame Photo"),
                      message: Text("Check it out!"),
                      preview: SharePreview(photo.caption, image: photo.image))
        }
    }
}

struct ShareLinkView_Previews: PreviewProvider {
    static var previews: some View {
        ShareLinkView()
    }
}
