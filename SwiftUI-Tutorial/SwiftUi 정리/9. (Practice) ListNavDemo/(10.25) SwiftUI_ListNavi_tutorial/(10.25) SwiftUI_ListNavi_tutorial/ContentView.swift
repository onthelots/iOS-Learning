//
//  ContentView.swift
//  (10.25) SwiftUI_ListNavi_tutorial
//
//  Created by Jae hyuk Yim on 2022/10/25.
//

import SwiftUI

struct ContentView: View {
    
    // 구독객체 - 바인딩
    // CarStore() 구조체 안에 Json carData의 내용을 받아오는거지
    // 왜? 이미 carStore의 배열은 초기화가 되어 있기 때문에?
    @ObservedObject var carStore: CarStore = CarStore(cars: carData)
    
    
    var body: some View {
       
        
        
        NavigationView {
            List {
                ForEach(carStore.cars) { car in
                    
                    ListCell(car: car) // ~ HStack
                    
                } // ~~ ForEach
                
                // List를 지우거나, 움직일 동작에 대해 선언한다
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
                
                
            } // ~~~ List
            .navigationTitle(Text("EV Cars"))
            .navigationBarItems(leading: NavigationLink(destination: AddNewCar(carStore: self.carStore)) {
                
                Text("Add")
                    .foregroundColor(.blue)
            }, trailing: EditButton())
                            
            
        } // ~~~ NavigationView
        
    } // ~~~ body
    
    // list의 특정 사항을 지우는 동작함수
    func deleteItems(at offsets: IndexSet) {
        carStore.cars.remove(atOffsets: offsets)
    }
    
    // list를 이동시키는 함수
    func moveItems(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
    
    
    
} // ~~~~ContentView



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





struct ListCell: View {
    
    // 객체선언을 통해 car 객체가 전달될 수 있도록
    // Struct Car 내 객체를 -> car로 전달
    var car: Car
    
    var body: some View {
        
        NavigationLink(destination: CarDetail(selectedCar: car)) {
            HStack {
                Image(car.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                Text(car.name)
                
            } // ~ HStack
            
        } // ~~ NavigationLink
    }
}
