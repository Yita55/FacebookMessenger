//
//  ChatLogVC.swift
//  FacebookMessenger
//
//  Created by James Rochabrun on 2/28/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class ChatLogVC: UICollectionViewController {
    
    private let cellID = "cellID"
    
    var friend: Friend? {
        didSet {
            navigationItem.title = friend?.name
            messages = friend?.messages?.allObjects as? [Message]
            messages = messages?.sorted(by: {$0.date?.compare($1.date as! Date) == .orderedAscending})
        }
    }
    
    var messages: [Message]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(ChatMessageCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.alwaysBounceVertical = true
        collectionView?.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ChatMessageCell
        cell.message = messages?[indexPath.item]
        
        if let message = messages?[indexPath.item], let messageText = message.text, let imageName = message.friend?.profileImageName {
            
            cell.profileview.image = UIImage(named: imageName)
            let widthForBubble: CGFloat = 250.0
            let paddingExtra: CGFloat = 16.0
            let paddingSmall: CGFloat = 10.0
            let size = messageText.estimatedSizeBasedOn(width: widthForBubble, and: UIFont.systemFont(ofSize: 18))
            if message.isSender {

                cell.bubbleImageView.heightAnchor.constraint(equalToConstant: size.height).isActive = true
                cell.bubbleImageView.widthAnchor.constraint(equalToConstant: size.width + (paddingExtra * 2)).isActive = true
                cell.bubbleImageView.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
                cell.bubbleImageView.rightAnchor.constraint(equalTo: cell.rightAnchor, constant: -paddingExtra).isActive = true

                cell.textView.topAnchor.constraint(equalTo: cell.bubbleImageView.topAnchor).isActive = true
                cell.textView.leftAnchor.constraint(equalTo: cell.bubbleImageView.leftAnchor, constant: paddingSmall).isActive = true
                cell.textView.rightAnchor.constraint(equalTo: cell.bubbleImageView.rightAnchor, constant: -paddingSmall).isActive = true
                cell.textView.heightAnchor.constraint(equalTo: cell.bubbleImageView.heightAnchor).isActive = true
                
                cell.textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                cell.profileview.isHidden = true
                cell.bubbleImageView.image = ChatMessageCell.blueBubbleColorImage
                cell.bubbleImageView.tintColor = #colorLiteral(red: 0, green: 0.4566611071, blue: 1, alpha: 1)
            } else {

                cell.bubbleImageView.heightAnchor.constraint(equalToConstant: size.height).isActive = true
                cell.bubbleImageView.widthAnchor.constraint(equalToConstant: size.width + (paddingExtra * 2)).isActive = true
                cell.bubbleImageView.leftAnchor.constraint(equalTo: cell.profileview.rightAnchor, constant: paddingExtra).isActive = true
                cell.bubbleImageView.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
                
                cell.textView.topAnchor.constraint(equalTo: cell.bubbleImageView.topAnchor).isActive = true
                cell.textView.leftAnchor.constraint(equalTo: cell.bubbleImageView.leftAnchor, constant: paddingSmall).isActive = true
                cell.textView.rightAnchor.constraint(equalTo: cell.bubbleImageView.rightAnchor, constant: -paddingSmall).isActive = true
                cell.textView.heightAnchor.constraint(equalTo: cell.bubbleImageView.heightAnchor).isActive = true
        
                cell.profileview.isHidden = false
                cell.textView.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                cell.bubbleImageView.image = ChatMessageCell.grayBubbleColorImage
                cell.bubbleImageView.tintColor = UIColor(white: 0.9, alpha: 1)
            }
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = messages?.count {
            return count
        }
        return 0
    }
}

extension ChatLogVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let messageText = messages?[indexPath.item].text {
            let widthForBubble: CGFloat = 250.0
            let size = messageText.estimatedSizeBasedOn(width: widthForBubble, and: UIFont.systemFont(ofSize: 18))
            return CGSize(width: view.frame.width, height: size.height)
            
        }
        return CGSize(width: view.frame.width, height: 100)
    }
}

//find the height for the cell but also for the textview




