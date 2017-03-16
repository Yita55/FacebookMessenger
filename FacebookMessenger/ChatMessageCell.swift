//
//  ChatMessageCell.swift
//  FacebookMessenger
//
//  Created by James Rochabrun on 3/1/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class ChatMessageCell: BaseCell {
    
    var message: Message? {
        didSet {
            textView.text = message?.text
        }
    }
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 18)
        tv.backgroundColor = .clear
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let bubbleImageView: UIImageView = {
        let v = UIImageView()
        v.image = ChatMessageCell.grayBubbleColorImage
        v.tintColor = UIColor(white: 0.95, alpha: 1)
        v.backgroundColor = .clear
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let profileview: UIImageView = {
        let v = UIImageView()
        v.contentMode = .scaleAspectFill
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 20
        v.clipsToBounds = true
        return v
    }()
    
    static let blueBubbleColorImage =  #imageLiteral(resourceName: "bluechat").resizableImage(withCapInsets: UIEdgeInsetsMake(22, 26, 22, 26)).withRenderingMode(.alwaysTemplate)
    static let grayBubbleColorImage = #imageLiteral(resourceName: "graychat").resizableImage(withCapInsets: UIEdgeInsetsMake(22, 26, 22, 26)).withRenderingMode(.alwaysTemplate)
    
    override func setUpViews() {
        super.setUpViews()
        
        addSubview(profileview)
        
        profileview.heightAnchor.constraint(equalToConstant: 40).isActive = true
        profileview.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileview.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        profileview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        profileview.backgroundColor = .yellow
        
        addSubview(bubbleImageView)
        addSubview(textView)
    }
}









