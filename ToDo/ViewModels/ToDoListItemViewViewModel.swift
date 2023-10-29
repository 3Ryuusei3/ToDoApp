//
//  ToDoListItemViewViewModel.swift
//  ToDo
//
//  Created by Manuel Atance on 30/9/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

// ViewModel for single to do item view (each row in items list)
class ToDoListItemViewViewModel: ObservableObject {
    init() {
        
    }
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todo")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
