//
//  ChatListCollectionViewCell.swift
//  Practice
//
//  Created by Jae hyuk Yim on 2023/03/21.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnails: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    
    func configure(_ chat: Chat) {
        thumbnails.image = UIImage(named: chat.name)!
        name.text = chat.name
        message.text = chat.chat
        
        date.text = chat.date
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        thumbnails.layer.cornerRadius = 10
    }
    
    func dateFormatter(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: date) {
            dateFormatter.dateFormat = "M/d"
            
            return dateFormatter.string(from: date)
        } else {
            return ""
        }
    }
}
