//
//  FirebaseManager.swift
//  CEats
//
//  Created by gnksbm on 2023/09/07.
//

import Foundation
import FirebaseFirestore

protocol CEatsIdentifiable {
    var id: String { get set }
}

struct ExampleStruct: CEatsIdentifiable {
    var id = UUID().uuidString
}

final class CEatsFBManager {
    let db = Firestore.firestore()
    
    func addNewData<T: CEatsIdentifiable>(collection: ServiceType.Collection, data: T) where T: Encodable {
        let collectionRef: CollectionReference = db.collection(collection.rawValue)
        
        collectionRef.addDocument(data: [data.id : T.self]) { error in
            self.printError(error: error)
        }
    }
    
    func fetchData<T: CEatsIdentifiable>(collection: ServiceType.Collection, data: T, _ completion: @escaping (T) -> ()) {
        let documentID = data.id

        let docRef: DocumentReference = db.collection(collection.rawValue).document(documentID)

        docRef.getDocument { snapshot, error in
            if let snapshot {
                
            }
        }
    }
    
    func update<T: CEatsIdentifiable>(collection: ServiceType.Collection, data: T) {
        let documentID = data.id
        
        let docRef = db.collection(collection.rawValue).document(documentID)
        
        var dataDic = [String: Any]()
        
        docRef.updateData(dataDic) { error in
            self.printError(error: error)
        }
    }
    
    func remove<T: CEatsIdentifiable>(collection: ServiceType.Collection, data: T) {
        let documentID = data.id
        
        let dbRef: DocumentReference = db.document("\(collection.rawValue)/\(documentID)")

        dbRef.delete() { error in
            self.printError(error: error)
        }
    }
    
    private func printError(error: Error?) {
        if let error {
            print(#function + ": \(error.localizedDescription)")
        } else {
            print(#function + "success")
        }
    }
}

struct ServiceType {
    enum Collection: String {
        case user
        case food
        case restaurant
        case review
        case order
        case restaurantInfo
    }
}
