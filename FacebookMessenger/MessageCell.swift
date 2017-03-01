//
//  FriendCell.swift
//  FacebookMessenger
//
//  Created by James Rochabrun on 2/28/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit


class MessageCell: BaseCell {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            nameLabel.textColor = isHighlighted ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            messageLabel.textColor = isHighlighted ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            timeLabel.textColor = isHighlighted ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }
    }
    
    var message: Message? {
        didSet {
            if let friend = message?.friend {
                nameLabel.text = friend.name
                if let profileImageName = friend.profileImageName {
                    profileImageview.image = UIImage(named: profileImageName)
                    hasReadImageview.image = UIImage(named: profileImageName)
                }
            }
            if let date = message?.date {
                timeLabel.text = date.stringFormat()
            }
            if let text = message?.text {
                messageLabel.text = text
            }
        }
    }
    
    let profileImageview: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        //iv.backgroundColor = .orange
        iv.image = #imageLiteral(resourceName: "messi")
        iv.layer.cornerRadius = 34
        iv.clipsToBounds = true
        return iv
    }()
    
    let dividerLineView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return v
    }()
    
    let nameLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        //l.backgroundColor = .green
        l.textColor = UIColor.darkGray
        l.font = UIFont.systemFont(ofSize: 18)
        return l
    }()
    
    let messageLabel: UILabel = {
        let l = UILabel()
        //l.backgroundColor = .red
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.darkGray
        l.font = UIFont.systemFont(ofSize: 14)
        return l
    }()
    
    let timeLabel: UILabel = {
        let l = UILabel()
        //l.backgroundColor = .blue
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor.darkGray
        l.font = UIFont.systemFont(ofSize: 14)
        l.textAlignment = .right
        return l
    }()
    
    let hasReadImageview: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        //iv.backgroundColor = .orange
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "messi")
        return iv
    }()
    
    override func setUpViews() {
        addSubview(profileImageview)
        addSubview(dividerLineView)
        
        profileImageview.widthAnchor.constraint(equalToConstant: 68).isActive = true
        profileImageview.heightAnchor.constraint(equalToConstant: 68).isActive = true
        profileImageview.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImageview.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
        
        setUpContainerView()
        
        dividerLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        dividerLineView.leftAnchor.constraint(equalTo: profileImageview.rightAnchor).isActive = true
        dividerLineView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        dividerLineView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    private func setUpContainerView() {
        
        let containerView = UIView()
        //containerView.backgroundColor = .yellow
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: profileImageview.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: profileImageview.bottomAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: profileImageview.rightAnchor, constant: 14).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        containerView.addSubview(timeLabel)
        containerView.addSubview(nameLabel)
        containerView.addSubview(messageLabel)
        containerView.addSubview(hasReadImageview)
        
        timeLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/2).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -14).isActive = true
        timeLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/2).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: timeLabel.leftAnchor).isActive = true
        
        hasReadImageview.widthAnchor.constraint(equalToConstant: 20).isActive = true
        hasReadImageview.heightAnchor.constraint(equalToConstant: 20).isActive = true
        hasReadImageview.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -14).isActive = true
        hasReadImageview.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: hasReadImageview.leftAnchor).isActive = true
        messageLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/2).isActive = true
        
    }
    
}


extension NSDate {
    
    func stringFormat() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let elapsedTimeInSeconds = NSDate().timeIntervalSince(self as Date)
        let secondsInDays: TimeInterval = 60 * 60 * 24
        if elapsedTimeInSeconds > 7 * secondsInDays {
            dateFormatter.dateFormat = "MM/dd/yy"
        } else if elapsedTimeInSeconds > secondsInDays {
            dateFormatter.dateFormat = "EEE"
        }
        return dateFormatter.string(from: self as Date)
    }
}
















