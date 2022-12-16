//
//  ContentView.swift
//  (11.2) SwiftUI_WebMapDemo
//
//  Created by Jae hyuk Yim on 2022/11/02.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var tabSelection: Int = 2
    
    var body: some View {
        
        TabView(selection: $tabSelection) {
            
            WebTapView()
                .tabItem {
                    Image(systemName: "safari.fill")
                    Text("Web")
                }.tag(1)
            
            
            MapTabView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }.tag(2)
            
        } // --- TabView
        
    } // ---- body
    
} // ---- ContentView







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
