//
//  ChatlistViewController.swift
//  ChatList
//
//  Created by Jae hyuk Yim on 2023/03/20.
//

import UIKit

class ChatlistViewController: UIViewController, UICollectionViewDelegate {
    
    // MARK: - CollectionView의 업데이트를 위한 연결
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var chatData: [Chat] = Chat.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Data, Presentation, Layout
        
        // MARK: - dataSource, delegate는 일종의 protocol이므로, 준수해야 함
        collectionView.dataSource = self // 1
        collectionView.delegate = self // 2
        
        // MARK: - 채팅 리스트를 date 오름차순으로 변경
        chatData = chatData.sorted(by: { chat1, chat2 in
            return chat1.date > chat2.date
        })

    }
}

// MARK: - 1. dataSource 프로토콜 구현 (ICollectionViewDataSource)
extension ChatlistViewController: UICollectionViewDataSource {
    // MARK: - 데이터가 몇개인가?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatData.count
    }
    
    // MARK: - 셀을 어떻게 표현할것인가? ->
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatlistCollectionViewCell", for: indexPath) as? ChatlistCollectionViewCell else {
            return UICollectionViewCell()
        }
        // MARK: - 변수 'chat'에 chatData의 indexPath item 값을 할당
        let chat = chatData[indexPath.item]
        
        // MARK: - cell(ChatlistCollectionViewCell 타입)의 메서드 configure(Model의 데이터를 각각의 컴포넌트에 할당)의 매개변수로 chat(indexPath item)을 할당
        cell.configure(chat)
        return cell
    }
}

// MARK: - 2. Layout은 누가 위임을 받을 것인가? (UICollectionViewDelegateFlowLayout)
extension ChatlistViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
