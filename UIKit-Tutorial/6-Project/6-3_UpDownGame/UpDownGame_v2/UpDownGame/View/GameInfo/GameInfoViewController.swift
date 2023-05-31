//
//  GameInfoViewController.swift
//  UpDownGame
//
//  Created by Jae hyuk Yim on 2023/05/26.
//

import UIKit

class GameInfoViewController: UIViewController {
    
    @IBOutlet weak var gameInfoTextView: UITextView!
    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gameInfoTextView.text = """
Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud exercitation ullamco
"""
        
        self.gameInfoTextView.alignTextViewVerticallyInContainer()
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true)
    }
}
