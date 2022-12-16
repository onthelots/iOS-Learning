//
//  AddNewCar.swift
//  (10.25) SwiftUI_ListNavi_tutorial
//
//  Created by Jae hyuk Yim on 2022/10/25.
//

import SwiftUI

struct AddNewCar: View {
    
    @ObservedObject var carStore: CarStore
    
    @State var name: String = ""
    
    @State var description: String = ""
    
    @State var isHybrid: Bool = false
    
    
    var body: some View {
        
        Form {
            Section(header: Text("Car Details")) {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                DataInput(title: "Model", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                
                Toggle(isOn: $isHybrid) {
                    Text("Hybrid")
                        .font(.headline)
                }
                .padding()
            }
            
            
            Button(action: addNewCar) {
                Text("Add Car")
                
                
            } // ~ Section
        } // ~~ Form
        
        
    } // ~~~ body
    
    
    // ------ 버튼을 누르면 새롭게 작성된 차 정보를 carStore.cars 배열에 추가한다! ------
    func addNewCar () {
        let newCar = Car(id: UUID().uuidString,
                         name: name, description: description,
                         isHybrid: isHybrid,imageName: "tesla_model_3")
        
        carStore.cars.append(newCar)
        
        
        
    } // ~~~ body
    
} // ~~~~ AddNewCar







// 새로운 자동차에 대한 상세정보 입력
// @Binding 상태바인딩 필요

struct DataInput: View {
    
    
    var title: String
    
    // 뭘 바인딩하는거지?
    // 앞서 선언된 상태 프로퍼티가 없는데
    @Binding var userInput: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            
        }
        .padding()// ~ VStack
   
        
    } // ~~ body
    
} // ~~~~ DataInput








struct AddNewCar_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCar(carStore: CarStore(cars:carData))
        
    }
    
}
