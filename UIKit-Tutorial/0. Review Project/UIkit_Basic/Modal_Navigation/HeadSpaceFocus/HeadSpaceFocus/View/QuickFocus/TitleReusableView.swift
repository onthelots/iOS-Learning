//
//  TitleReusableView.swift
//  HeadSpaceFocus
//
//  Created by Jae hyuk Yim on 2023/03/30.
//

import UIKit

class TitleReusableView: UICollectionReusableView {
    
    let sectionTitle: [String] = ["Breathing excercises" , "Mindful walks"]
    
    @IBOutlet weak var selectedTitleLabel: UILabel!
    
    func configure(title: String) {
        selectedTitleLabel.text = selectedTitleLabel.text
    }
}
