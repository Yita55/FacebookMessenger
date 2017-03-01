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
    let context = CoredataStack.sharedInstance.persistentContainer.viewContext


    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(MessageCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.alwaysBounceVertical = true
        setUPdata()
    }
    
    func setUPdata() {
        
        clearData()
        
        let leo = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
        leo.name = "messi"
        leo.profileImageName = "messi"
        createMessageWith(text: "Hola que haces", friend: leo, context: context)
        
        let luis = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
        luis.name = "suarez"
        luis.profileImageName = "suarez"
        createMessageWith(text: "nada boludo", friend: luis, context: context)
        createMessageWith(text: "y ney?", friend: luis, context: context)
        createMessageWith(text: "SALE ", friend: luis, context: context)
        
        CoredataStack.sharedInstance.saveContext()
        
        //        do {
        //            try context.save()
        //        } catch let error {
        //            print(error)
        //        }
        loadData()
    }
    
    func clearData() {
        
        do {
            let entityNames = ["Friend", "Message"]
            let fetchRequest = entityNames.map{NSFetchRequest<NSFetchRequestResult>(entityName: $0)}
            let objects = try fetchRequest.map{try context.fetch($0) as? [NSManagedObject]}
            _ = objects.map{$0.map{$0.map{context.delete($0)}}}
        } catch let error {
            print(error)
        }
    }
    
    func loadData() {
        
        guard let friends = fetchFriends() else {
            print("FRIENDS ARRAY IS NIL")
            return
        }
        messagesArray = [Message]()
        _ = friends.map{setFetchFor(friend: $0)}
        
        messagesArray = messagesArray?.sorted(by: {$0.date?.compare($1.date as! Date) == .orderedDescending})
    }
    
    private func setFetchFor(friend: Friend) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Message")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        if let name = friend.name {
            print(name)
            fetchRequest.predicate = NSPredicate(format: "friend.name == %@", name)
        }
        fetchRequest.fetchLimit = 1
        do {
            let fetchedMessages = try context.fetch(fetchRequest) as? [Message]
            _ = fetchedMessages.map{$0.map{messagesArray?.append($0)}}
        } catch let error {
            print(error)
        }
    }
    
    private func createMessageWith(text: String, friend: Friend, context: NSManagedObjectContext) {
        let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
        message.friend = friend
        message.text = text
        message.date = NSDate()
    }
    
    private func fetchFriends() -> [Friend]? {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Friend")
        do {
            return try context.fetch(request) as? [Friend]
        } catch let error {
            print(error)
        }
        return nil
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let layout = UICollectionViewFlowLayout()
        let controller = ChatLogVC(collectionViewLayout: layout)
        controller.friend = messagesArray?[indexPath.row].friend
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension FriendsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
}








