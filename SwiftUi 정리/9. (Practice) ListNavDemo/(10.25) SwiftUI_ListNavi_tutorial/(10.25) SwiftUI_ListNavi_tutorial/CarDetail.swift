//
//  CarDetail.swift
//  (10.25) SwiftUI_ListNavi_tutorial
//
//  Created by Jae hyuk Yim on 2022/10/25.
//

import SwiftUI


// 상세 뷰를 나타내는 새로운 View 표시

struct CarDetail: View {
    
    // Car 해당 구조체에서 활용할 수 있도록 selectedCar를
    let selectedCar: Car
    
    var body: some View {
        
        // Form 컨테이너를 활용한다!
        Form {
            Section(header: Text("Car Details")) {
                
                Image(selectedCar.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(selectedCar.name)
                    .font(.headline)
                
                Text(selectedCar.description)
                    .font(.body)
                
                HStack {
                    Text("Hybrid")
                        .font(.headline)
                    Spacer()
                    Image(systemName: selectedCar.isHybrid ? "checkmark.circle" : "xmark.circle")
                    
                } // ~ HStack
                
        
            } // ~ Section
            
            
        } // ~~ Form
        
        
  
    } // ~~~ body
    
} // ~~~~ carDetail





struct CarDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        // CarData 배열에 첫번째 자동차 세부 내용이 포함될 수 있도록 구성한다!
        CarDetail(selectedCar: carData[0])
    }
}
