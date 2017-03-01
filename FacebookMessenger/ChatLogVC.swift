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
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ChatMessageCell
        cell.message = messages?[indexPath.item]
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
        return CGSize(width: view.frame.width, height: 100)
    }
}









