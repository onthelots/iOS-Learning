//
//  MapTabView.swift
//  (11.2) SwiftUI_WebMapDemo
//
//  Created by Jae hyuk Yim on 2022/11/02.
//

import SwiftUI

// 지도 불러오기 import

import MapKit


// 맵에 핀을 꽂아주기위해.. 구조체를 만들자!


struct MapTabView: View {
    
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.522858, longitude: 127.120276), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    
    
    var body: some View {
        
        NavigationStack {
            VStack {
                // Map을 이렇게 바로 호출할 수 있으며,
                // coordinateRegion을 통해 선언된 프로퍼티 래퍼를 호출함
                // 여기서, annotationItem
                Map(coordinateRegion: $region, annotationItems: pointOfInterest) {
                    item in MapMarker(coordinate: item.coordinate, tint: .accentColor)
                }
                    .navigationTitle("Map")
            }
        }
        
        
    } // --- body
    
    
    
} // ---- MapTabView


// 맵에 핀을 꽂아주기위해.. 구조체를 만들자!

struct AnnotatedItem : Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

var pointOfInterest = [
    
    AnnotatedItem(name: "Picnic Space", coordinate: .init(latitude: 37.524052, longitude: 127.122721))



]



struct MapTabView_Previews: PreviewProvider {
    static var previews: some View {
        MapTabView()
    }
}


