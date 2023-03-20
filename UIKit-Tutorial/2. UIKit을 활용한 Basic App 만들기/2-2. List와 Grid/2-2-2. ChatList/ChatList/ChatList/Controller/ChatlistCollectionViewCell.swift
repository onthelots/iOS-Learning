//
//  CharlistCollectionViewCell.swift
//  ChatList
//
//  Created by Jae hyuk Yim on 2023/03/20.
//

import UIKit

class ChatlistCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Components 연결하기
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Model(chat)의 데이터 할당하기
    func configure(_ chat: Chat) {
        thumbnail.image = UIImage(named: chat.name) // assets내 있는 이미지(이름)을 불러올 수 있음
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        dateLabel.text = fomattedDateString(dateString: chat.date)
    }
    
    // MARK: awakeFromNib() 메서드
    // CollcectionViewCell의 경우, ChatlistViewController에서 dequeueResuableCell을 활용해서 사용하고 있는데..
    // 여기 ChatlistCollectionViewCell란 Controller에서 불러올 때 사실 아래와 같은 메서드가 동시에 실행되고 있음
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 따라서, ChatlistCollectionViewCell에서 관리하고 있는 다양한 컴포넌트는
        // 여기서 코드를 통해 Custom할 수 있음! (아래 예시는, thumbnail의 cornerRadius를 매긴 것)
        thumbnail.layer.cornerRadius = 10
    }
    
    
    
    // MARK: - Dataformatter
    func fomattedDateString(dateString: String) -> String {
        
        // MARK: - 현재는, 2xxx-xx-xx 이지만, 이걸 xx/xx으로 변경하고자 함
        
        // 1. DateFormatter() 인스턴스 변수를 생성한 후,
        let formatter = DateFormatter()
        
        // 2. 현재 dateFormat(2xxx-xx-xx)을 정해진 형식("yyyy-MM-dd")에 맞춰서 할당해줌
        formatter.dateFormat = "yyyy-MM-dd"
        
        // 3. 'date' 변수를 생성한 후, 앞서 formatter변수의 date 값으로 매개변수(dateString)을 할당하고 나서
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "M/d" // 정해진 date 형식을 "M/d"로 바꾸도록 조건문을 만든다.
            
            return formatter.string(from: date) // 4. date는 현재 'Date'타입이므로, string 형태로 가공해서 반환한다.
        } else {
            return ""
        }
    }
}
