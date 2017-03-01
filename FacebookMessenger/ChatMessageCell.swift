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
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func setUpViews() {
        super.setUpViews()
        addSubview(textView)
        textView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
