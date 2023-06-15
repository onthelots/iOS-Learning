//
//  ViewController.swift
//  Messaging_Table
//
//  Created by Jae hyuk Yim on 2023/06/15.
//

import UIKit

// Chat
struct Chat {
    let message: String
    
    // 내 메세지인지, 아닌지 (Boolean)
    let isMyMessage: Bool = Bool.random()
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageField: UITextField!
    
    // KeyboardUp -> 아래 메세지 입력영역이 [특정 간격]에 따라 올라올 수 있도록 -> 텍스트 입력 Field와 SafeArea간의 Bottom Constraints
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    // Chat 구조체 배열
    private var chats: [Chat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        // Notification -> keyboard Setting
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil,
                                               queue: .main) { (notification) in
            
            // UserInfo (notification과 관련된 일종의 '값')
            guard let userInfo = notification.userInfo else { return }
            
            // UserInfo 내부의 keyboardFrame값 (CGRect 타입)
            guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
                return }
            
            // 키보드의 frame에서부터 8정도 떨어진 값이, 텍스트를 작성하는 TextField <-> SafeArea 혹은 keyboardFrame 간의 간격으로 설정됨
            self.bottomConstraint.constant = keyboardFrame.height + 8
            
            // 키보드가 나타나는 애니메이션
            guard let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {
                return
            }
            
            // animation 설정 (layoutIfNeeded를 통해, 모든 Task보다 먼저 작업할 수 있도록 함)
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil,
                                               queue: .main) { (notification) in
            
            guard let userInfo = notification.userInfo else { return }
            
            // 그냥, 그대로의 값이었던 8로 변경(SafeArea와의 간격)
            self.bottomConstraint.constant = 8
            
            // 키보드가 사라지는 애니메이션
            guard let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {
                return
            }
            
            // animation 설정 (layoutIfNeeded를 통해, 모든 Task보다 먼저 작업할 수 있도록 함)
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func sendMessage() {
        guard let sendMessage = messageField.text,
              sendMessage.isEmpty == false else { return }
        
        // chats 구조체 배열에 messageField에서 작성되는 내용을 추가함
        chats.append(Chat(message: sendMessage))
        messageField.text = nil
        
        // indexPath는 -> chats 구조체 배열의 수에서 -1을 실시함 (즉, 행의 '위치'를 잡아주는 행위)
        // count '-1'을 하는 이유는 간단하다. 0 index이기 때문
        let indexPath = IndexPath(row: chats.count - 1,
                                  section: 0)
    
        // insertRows(at:with:) : 특정 Cell이 변경될 경우, 해당 Cell만 업데이트 시키는 메서드
        tableView.insertRows(at: [indexPath],
                             with: UITableView.RowAnimation.none)
        
        // scrollToRow(at:at:animated) : 특정 행으로 위치를 이동시키는 메서드
        // 메세지 상단에서 작성을 해도, 가장 endIndex, bottom으로 지정할 경우 자동으로 가장 아래 메세지가 위치한 행으로 이동함
        tableView.scrollToRow(at: indexPath,
                              at: UITableView.ScrollPosition.bottom,
                              animated: true)
    }
}
    
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return chats.count
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // chat의 index
        let chat = chats[indexPath.row]
        
        // message identifier (Bool Random값인 Chat 구조체 내 isMyMessage가 참일땐 RightCell, 거짓일 땐 LeftCell로
        let identifier = chat.isMyMessage ? "RightCell" : "LeftCell"
        
        // 그렇게 되면 'cell', 즉 화면에 연속으로 나타나는 셀의 identifier가 특정 Cell이 아닌 번갈아 가면서(random) 나타나게 됨
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                       for: indexPath) as? BubbleCell else {
            return UITableViewCell()
        }
        
        cell.label.text = chat.message
        return cell
    }

}
