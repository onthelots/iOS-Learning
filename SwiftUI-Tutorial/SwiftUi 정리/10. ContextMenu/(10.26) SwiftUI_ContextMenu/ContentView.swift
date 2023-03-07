//
//  ContentView.swift
//  (10.26) SwiftUI_ContextMenu
//
//  Created by Jae hyuk Yim on 2022/10/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var foregroundColor: Color = Color.black
    @State private var backgroundColor: Color = Color.white
    
    var body: some View {
        
        VStack {
            Text("Hello, world!")
                .font(.largeTitle)
                .padding()
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
            // 해당 텍스트를 길~게 누르면 나타남
                .contextMenu {
                    Button(action: {
                        self.foregroundColor = .black
                        self.backgroundColor = .white
                        
                    }){
                        Text("Normal Colors")
                        Image(systemName: "paintbrush")
                    }
                    Button(action: {
                        self.foregroundColor = .white
                        self.backgroundColor = .black
                        
                    }) {
                        Text("inverted Colors")
                        Image(systemName: "paintbrush.fill")
                    }
                } // -- contextMenu
            
        } // --- VStack
        
    } // ---- body
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
