//
//  ViewController.swift
//  FacebookMessenger
//
//  Created by James Rochabrun on 2/28/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit
import CoreData

class FriendsVC: UICollectionViewController {
    
    fileprivate let cellID = "cellID"
    var messagesArray: [Message]?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(MessageCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.alwaysBounceVertical = true
        setUPdata()
    }
    
    func clearData() {
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
            
            do {
                let entityNames = ["Friend", "Message"]
                let fetchRequest = entityNames.map{NSFetchRequest<NSFetchRequestResult>(entityName: $0)}
                let objects = try fetchRequest.map{try context.fetch($0) as? [NSManagedObject]}
                let _ = objects.map{$0.map{$0.map{context.delete($0)}}}
            } catch let error {
                print(error)
            }
        }
    }
    
    func setUPdata() {
        
        clearData()
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.persistentContainer.viewContext {
            
            let messifriedn = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            messifriedn.name = "messi"
            messifriedn.profileImageName = "messi"
            
            let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            message.friend = messifriedn
            message.text = "helll whta s;kjsh ;kj wefh wef"
            
            do {
                try context.save()
            } catch let error {
                print(error)
            }
            loadData()
        }
    }
    
    func loadData() {
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
            
            
          let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Message")
            do {
                messagesArray = try context.fetch(fetchRequest) as? [Message]
            } catch let error {
                print(error)
            }
        }
    }
}



extension FriendsVC {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MessageCell
        if let message = messagesArray?[indexPath.item] {
            cell.message = message
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = messagesArray?.count {
            return count
        }
        return 0
    }
}

extension FriendsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
}

//
//class Friend: NSObject {
//    var name: String?
//    var profileImageName: String?
//}
//
//class Message: NSObject {
//    var text: String?
//    var date = NSDate()
//    var friend: Friend?
//}
//
//







