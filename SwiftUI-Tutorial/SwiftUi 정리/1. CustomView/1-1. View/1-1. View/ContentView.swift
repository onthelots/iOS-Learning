//
//  ContentView.swift
//  1-1. View
//
//

import SwiftUI

struct ContentView: View {
    var body: VStack<TupleView<(Text,Text)>> {
        VStack {
            Text("쉽고 재미있는")
            Text("알쏭달쏭 SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
