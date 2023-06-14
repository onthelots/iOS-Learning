//
//  FeedTableViewCell.swift
//  Social_Media_With_Table_View
//
//  Created by Jae hyuk Yim on 2023/06/14.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    private var imageRatioConstraint: NSLayoutConstraint!
    
    var feed: Feed! {
        didSet {
            profileImageView?.image = feed.author.profileImage
            authorLabel?.text = feed.author.name
            timeLabel?.text = feed.time
            contentTextLabel?.text = feed.contents.text
            contentImageView?.image = feed.contents.image
            likesLabel?.text = "\(feed.likes)"
            
            contentTextLabel?.isHidden = contentTextLabel?.text?.isEmpty == true
            contentImageView?.isHidden = contentImageView?.image == nil
            
            if let contentImageRatioConstraint = imageRatioConstraint {
                contentImageRatioConstraint.isActive = false
                contentImageView.removeConstraint(contentImageRatioConstraint)
            }
            
            if let image = contentImageView.image {
                imageRatioConstraint = contentImageView.heightAnchor.constraint(equalTo: contentImageView.widthAnchor,
                                                                                multiplier: image.size.height / image.size.width)
            }
        }
    }
    
    private var profileImageView: UIImageView!
    private var authorLabel: UILabel!
    private var timeLabel: UILabel!
    private var contentTextLabel: UILabel!
    private var contentImageView: UIImageView!
    private var likesLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        
        drawCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension FeedTableViewCell {
    
    private func drawCell() {
        selectionStyle = .none
        
        // Profile Image View
        profileImageView = UIImageView(image: UIImage(systemName: "person.fill"))
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFit
        
        // Author Label
        authorLabel = UILabel()
        authorLabel.adjustsFontForContentSizeCategory = true
        authorLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        authorLabel.textColor = .black
        authorLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        authorLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        authorLabel.setContentHuggingPriority(.required, for: .horizontal)
        authorLabel.text = "Lime"
        
        // Time Label
        timeLabel = UILabel()
        timeLabel.adjustsFontForContentSizeCategory = true
        timeLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        timeLabel.textColor = .lightGray
        timeLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        timeLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        timeLabel.text = "2시간 전"
        
        let profileStack = UIStackView(arrangedSubviews: [profileImageView, authorLabel, timeLabel])
        profileStack.axis = .horizontal
        profileStack.spacing = UIStackView.spacingUseSystem // System Spacing
        
        // ContentLabel
        contentTextLabel = UILabel()
        contentTextLabel.adjustsFontForContentSizeCategory = true
        contentTextLabel.font = UIFont.preferredFont(forTextStyle: .body)
        contentTextLabel.textColor = .darkGray
        contentTextLabel.numberOfLines = 0
        contentTextLabel.text = """
Hello, world Hello, world Hello, world Hello, world
Hello, world Hello, world Hello, world Hello, world
Hello, world Hello, world Hello, world Hello, world
"""
        
        // Content Image View
        contentImageView = UIImageView(image: UIImage(systemName: "photo"))
        contentImageView.clipsToBounds = true
        contentImageView.contentMode = .scaleAspectFill
        
        // user interaction
        contentImageView.isUserInteractionEnabled = true
        
        
        // Likes Image View (Static)
        let likesImageView = UIImageView(image: UIImage(systemName: "hand.thumbsup.fill"))
        likesImageView.tintColor = .systemBlue
        likesImageView.contentMode = .scaleAspectFit
        likesImageView.setContentHuggingPriority(.required, for: .horizontal)
        
        // Likes Label
        likesLabel = UILabel()
        likesLabel.adjustsFontForContentSizeCategory = true
        likesLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        likesLabel.textColor = .darkGray
        likesLabel.numberOfLines = 1
        likesLabel.text = "2"
        
        let likeStack = UIStackView(arrangedSubviews: [likesImageView, likesLabel])
        likeStack.axis = .horizontal
        likeStack.spacing = UIStackView.spacingUseSystem
        likeStack.alignment = .center
        likeStack.distribution = .fill
        
        // Button Stack
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.distribution = .fillEqually
        buttonStack.alignment = .center
        
        ["좋아요", "댓글달기", "공유하기"].forEach { (title) in
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.tintColor = .darkGray
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.gray.cgColor
    
            buttonStack.addArrangedSubview(button)
        }
        
        // All Content Stack(Vertical)
        let contentStack = UIStackView(arrangedSubviews: [profileStack,
                                                          contentTextLabel,
                                                          contentImageView,
                                                          likeStack,
                                                          buttonStack])
        
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        contentStack.axis = .vertical
        contentStack.alignment = .fill
        contentStack.distribution = .fill
        contentStack.spacing = UIStackView.spacingUseSystem
        
        // contentView in contentStack(View)
        contentView.addSubview(contentStack)
        
        // Constraints
        NSLayoutConstraint.activate([
            contentStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contentStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            contentStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            contentStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
        ])
        
        // profileImageView
        profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor, multiplier: 1).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1).isActive = true
        
        // contentImageView
        let squareConstraint = contentImageView.widthAnchor.constraint(equalTo: contentImageView.heightAnchor)
        squareConstraint.isActive = true
        squareConstraint.priority = .defaultHigh
        
        // likeImageView
        let likesHeight = likesImageView.heightAnchor.constraint(lessThanOrEqualTo: likesLabel.heightAnchor)
        likesHeight.isActive = true
        likesHeight.priority = .defaultHigh
        
        likesImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        likesImageView.widthAnchor.constraint(equalTo: likesImageView.heightAnchor).isActive = true
        
        let tabGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(tapImageView(_ :))) // Function Notation
        contentView.addGestureRecognizer(tabGesture)
    }
    
    @objc private func tapImageView(_ sender: UITapGestureRecognizer) {
        guard let constraint = imageRatioConstraint else {
            return
        }
        constraint.isActive.toggle()
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
        
        NotificationCenter.default.post(name: Notification.Name("NeededUpdateLayout"),
                                        object: nil)
    }
}
