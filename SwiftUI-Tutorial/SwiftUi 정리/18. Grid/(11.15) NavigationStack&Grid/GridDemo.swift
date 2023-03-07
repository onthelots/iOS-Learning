//
//  Grid.swift
//  (11.15) NavigationStack&Grid
//
//  Created by Jae hyuk Yim on 2022/11/15.
//

import SwiftUI

struct GridDemo: View {
    
    @State private var koreaScore: Int = 0
    @State private var UruguayScore : Int = 0
    
    var body: some View {
        
        Grid {
            GridRow {
                Text("Korea")
                
                ForEach(0..<koreaScore, id: \.self) { _ in
                    Circle()
                        .fill(.red)
                        .frame(width: 20, height: 20)
                }
            
            }
            
            GridRow {
                Text("Uruguay")
                
                ForEach(0..<UruguayScore, id: \.self) { _ in
                    Circle()
                        .fill(.blue)
                        .frame(width: 20, height: 20)
                    
                    
                }
                
            }
            
            Button {
                koreaScore += 1
            } label: {
                Text("korea")
            }
            
            Button {
                UruguayScore += 1
            } label: {
                Text("korea")
            }


            
            
            
            
        }
        
        
    } // ------------ body
    
} // ------------ Grid








struct GridDemo_Previews: PreviewProvider {
    static var previews: some View {
        GridDemo()
    }
}
