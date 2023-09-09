//
//  FireBaseManager.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

enum CEatsError: Error {
    case propertyError
}

protocol CEatsIdentifiable: Identifiable {
    var id: String { get set }
    
    func getPropertyName<T: CEatsIdentifiable, U>(_ keyPath: KeyPath<T, U>) -> Result<String, CEatsError>
}

extension CEatsIdentifiable {
    func getPropertyName<T: CEatsIdentifiable, U>(_ keyPath: KeyPath<T, U>) -> Result<String, CEatsError> {
        guard let propertyName = "\(keyPath.debugDescription)".split(separator: ".").last else { return .failure(.propertyError)}
        return .success(String(propertyName))
    }
}

///CEatsFBManager의 메서드는 CEatsIdentifiable을 따르는 객체들만 사용할 수 있습니다.
///**CEatsIdentifiable 프로토콜을 채택한 Struct: User, Restaurant**
/// ```
/// let fbManager = CEatsFBManager()
/// ```
final class CEatsFBManager {
    static let shared = CEatsFBManager()
    
    private let db = Firestore.firestore()
    
    private init() { }
    
    func addSnapshot<T: CEatsIdentifiable, U: Decodable>(data: T, value keyPath: KeyPath<T, U>, completion: @escaping (U) -> ()) {
        let collectionRef: CollectionReference = db.collection("\(type(of: data))")
        let propertyName: String
        switch data.getPropertyName(keyPath) {
        case .success(let result):
            propertyName = result
        case .failure(let error):
            print(error.localizedDescription)
            return
        }
        
        DispatchQueue.global().async {
            collectionRef.document(data.id).addSnapshotListener { snapshot, error in
                self.printError(error: error)
                guard let fbDic = snapshot?.data() else {
                    print(#function + ": fail to optional bind - [String: Any]")
                    return
                }
                guard let fbAny = fbDic[propertyName] else {
                    print(#function + ": fail to optional bind - Any")
                    return
                }
                guard let uType = fbAny as? U else {
                    print(#function + ": fail to optional bind - [Order]")
                    return
                }
                DispatchQueue.main.async {
                    completion(uType)
                }
            }
        }
    }
    
    func addSnapshotArray<T: CEatsIdentifiable, U: Decodable>(data: T, value keyPath: KeyPath<T, U>, completion: @escaping ([U]) -> ()) {
        let collectionRef: CollectionReference = db.collection("\(type(of: data))")
        let propertyName: String
        switch data.getPropertyName(keyPath) {
        case .success(let result):
            propertyName = result
        case .failure(let error):
            print(error.localizedDescription)
            return
        }
        
        DispatchQueue.global().async {
            collectionRef.document(data.id).addSnapshotListener { snapshot, error in
                self.printError(error: error)
                guard let fbDic = snapshot?.data() else {
                    print(#function + ": fail to optional bind - [String: Any]")
                    return
                }
                guard let fbAny = fbDic[propertyName] else {
                    print(#function + ": fail to optional bind - Any")
                    return
                }
                guard let uType = fbAny as? [U] else {
                    print(#function + ": fail to optional bind - [Order]")
                    return
                }
                DispatchQueue.main.async {
                    completion(uType)
                }
            }
        }
    }
    
    func addSnapshot<T: CEatsIdentifiable, U: Decodable>(data: T, propertyName: String, completion: @escaping (U) -> ()) {
        let collectionRef: CollectionReference = db.collection("\(type(of: data))")
        
        DispatchQueue.global().async {
            collectionRef.document(data.id).addSnapshotListener { snapshot, error in
                self.printError(error: error)
                guard let fbDic = snapshot?.data() else {
                    print(#function + ": fail to optional bind - [String: Any]")
                    return
                }
                guard let fbAny = fbDic[propertyName] else {
                    print(#function + ": fail to optional bind - Any")
                    return
                }
                guard let data = try? JSONSerialization.data(withJSONObject: fbAny) else {
                    print(#function + ": fail to optional bind - Data")
                    return
                }
                guard let uType = try? JSONDecoder().decode(U.self, from: data) else {
                    print(#function + ": fail to optional bind - [Order]")
                    return
                }
                DispatchQueue.main.async {
                    completion(uType)
                }
            }
        }
    }
    
    func addSnapshotArray<T: CEatsIdentifiable, U: Decodable>(data: T, propertyName: String, completion: @escaping ([U]) -> ()) {
        let collectionRef: CollectionReference = db.collection("\(type(of: data))")
        
        DispatchQueue.global().async {
            collectionRef.document(data.id).addSnapshotListener { snapshot, error in
                self.printError(error: error)
                guard let fbDic = snapshot?.data() else {
                    print(#function + ": fail to optional bind - [String: Any]")
                    return
                }
                guard let fbAny = fbDic[propertyName] else {
                    print(#function + ": fail to optional bind - Any")
                    return
                }
                guard let data = try? JSONSerialization.data(withJSONObject: fbAny) else {
                    print(#function + ": fail to optional bind - Data")
                    return
                }
                guard let uArray = try? JSONDecoder().decode([U].self, from: data) else {
                    print(#function + ": fail to optional bind - [Order]")
                    return
                }
                DispatchQueue.main.async {
                    completion(uArray)
                }
            }
        }
    }
    /// - create: Firestore의 data의 타입이름인 Collection에 data가 생성됩니다.
    /// - Document의 key는 data의 id 프로퍼티입니다.
    /// ```
    /// fbManager.create(data: User())
    /// ```
    func create<T: CEatsIdentifiable>(data: T) where T: Encodable {
        let collectionRef: CollectionReference = db.collection("\(type(of: data))")
        
        do {
            try collectionRef.document(data.id).setData(from: data) { error in
                self.printError(error: error)
            }
        } catch {
            print(#function + "fail to .setData()")
        }
    }
    
    /// - read: Firestore의 type인 Collection에서 입력된 id값을 가진 프로퍼티를 반환합니다.
    /// ```
    /// let user: User
    ///
    /// fbManager.read(type: User.self, id: "") { result in
    ///     user = result
    /// }
    /// ```
    func read<T: CEatsIdentifiable>(type: T.Type, id: String, completion: @escaping (T) -> Void) where T: Decodable {
        guard !id.isEmpty else {
            print(#function + "ERROR!!! documentID is Empty")
            return
        }
        
        let docRef = db.collection("\(type)").document(id)
        
        docRef.getDocument(as: T.self) { result in
            switch result {
            case .success(let success):
                completion(success)
            case .failure(let error):
                self.printError(error: error)
            }
        }
    }
    
    /// - update: Firestore의 data의 타입이름인 Collection에서 같은 id를 가진 data를 변경합니다.
    /// ```
    /// let user = User()
    ///
    /// fireManager.update(data: user)
    /// ```
    /// 
    func update<T: CEatsIdentifiable, U: Decodable>(data: T, value keyPath: KeyPath<T, U>, to: U, completion: @escaping () -> ()) {
        let collectionRef: CollectionReference = db.collection("\(type(of: data))")
        let propertyName: String
        switch data.getPropertyName(keyPath) {
        case .success(let result):
            propertyName = result
        case .failure(let error):
            print(error.localizedDescription)
            return
        }
        collectionRef.document(data.id).updateData([propertyName: to]) { error in
            self.printError(error: error, completion: completion)
        }
    }
    
    /// - delete: Firestore의 data의 타입이름인 Collection에서 같은 id를 가진 data를 제거합니다.
    /// ```
    /// let user = User()
    ///
    /// fireManager.delete(data: user)
    /// ```
    func delete<T: CEatsIdentifiable>(data: T) {
        let documentID = data.id
        guard !documentID.isEmpty else {
            print(#function + "ERROR!!! documentID is Empty")
            return
        }
        
        let dbRef: DocumentReference = db.document("\(type(of: data))/\(documentID)")
        
        dbRef.delete() { error in
            self.printError(error: error)
        }
    }
    
    func delete<T: CEatsIdentifiable>(data: T, completion: @escaping () -> ()) {
        let documentID = data.id
        guard !documentID.isEmpty else {
            print(#function + "ERROR!!! documentID is Empty")
            return
        }
        
        let dbRef: DocumentReference = db.document("\(type(of: data))/\(documentID)")
        
        dbRef.delete() { error in
            self.printError(error: error, completion: completion)
        }
    }
    
    private func printError(error: Error?) {
        if let error {
            print(#function + ": \(error.localizedDescription)")
        }
    }
    
    private func printError(error: Error?, completion: () -> ()) {
        if let error {
            print(#function + ": \(error.localizedDescription)")
        } else {
            completion()
        }
    }
}

/*
 func fetchAll<T: Codable>( collection col: ServiceType.ColName,
                            whereField condition: String? = nil,
                            whereType type: ServiceType.Where? = nil,
                            whereData: Any? = nil,
                            orderField orderby: String? = nil,
                            orderType: ServiceType.Sort = .asc,
                            limitCount: Int = 0,
                            completion: @escaping ([T]) -> Void ) {

     var colRef: Query

     if let condition {
         if let whereData, let type {
             switch type {
             case .equal:
                 colRef = db.collection("\(col.rawValue)").whereField("\(condition)", isEqualTo: whereData)
             case .lessThan:
                 colRef = db.collection("\(col.rawValue)").whereField("\(condition)", isLessThan: whereData)
             case .overThan:
                 colRef = db.collection("\(col.rawValue)").whereField("\(condition)", isGreaterThan: whereData)
             case .lessOrEqual:
                 colRef = db.collection("\(col.rawValue)").whereField("\(condition)", isLessThanOrEqualTo: whereData)
             case .overOrEqual:
                 colRef = db.collection("\(col.rawValue)").whereField("\(condition)", isGreaterThanOrEqualTo: whereData)
             case .notEqual:
                 colRef = db.collection("\(col.rawValue)").whereField("\(condition)", isNotEqualTo: whereData)
             }
         } else {
             print("Err: 매개변수 whereData에 값을 입력하지 않았습니다.")
             return
         }

     } else {
         colRef = db.collection("\(col.rawValue)")
     }


     //정렬
     if let orderby {
         switch orderType {
         case .asc:
             colRef = colRef.order(by: orderby)
         case .desc:
             colRef = colRef.order(by: orderby, descending: true)
         }

     }


     if limitCount != 0 {
         colRef = colRef.limit(to: limitCount)
     }


     colRef.getDocuments() { [self] snapShot, error in
         if let error {
             print("문서번호 못가져옴 : \(error)")
             completion([])

         } else {
             var fetchedDatas: [T] = []   //초기화

             if let snapShot {
                 for document in snapShot.documents {

                     let docID = document.documentID

//                        print("문서ID :  \(document)")

                     db.collection("\(col.rawValue)").document(docID).getDocument(as: T.self) { result in
                         switch result {
                         case .success(let success):
//                                print("Fetch 성공 : \(success)")
                             fetchedDatas.append(success)

                             completion(fetchedDatas)

                         case .failure(let error):
                             print("Fetch중 에러 : \(error.localizedDescription)")

                         }
                     }

                 }

             }

         }

     }

 }
 func fetchAll( collection col: ServiceType.ColName,
                whereField condition: String? = nil,
                whereType type: ServiceType.Where? = nil,
                whereData: Any? = nil,
                orderField orderby: String? = nil,
                orderType: ServiceType.Sort = .asc,
                limitCount: Int = 0,
                completion: @escaping ([[String : Any]]) -> Void ) async {


     var colRef: Query


     if let condition {
         if let whereData, let type {
             switch type {
             case .equal:
                 colRef = db.collection("\(col.rawValue)").whereField("\(condition)", isEqualTo: whereData)
             case .lessThan:
                 colRef = db.collection("\(col.rawValue)").whereField("\(condition)", isLessThan: whereData)
             case .overThan:
                 colRef = db.collection("\(col.rawValue)").whereField("\(condition)", isGreaterThan: whereData)
             case .lessOrEqual:
                 colRef = db.collection("\(col.rawValue)").whereField("\(condition)", isLessThanOrEqualTo: whereData)
             case .overOrEqual:
                 colRef = db.collection("\(col.rawValue)").whereField("\(condition)", isGreaterThanOrEqualTo: whereData)
             case .notEqual:
                 colRef = db.collection("\(col.rawValue)").whereField("\(condition)", isNotEqualTo: whereData)
             }
         } else {
             print("Err: 매개변수 whereData에 값을 입력하지 않았습니다.")
             return
         }

     } else {
         colRef = db.collection("\(col.rawValue)")
     }

     //정렬
     if let orderby {
         switch orderType {
         case .asc:
             colRef = colRef.order(by: orderby)
         case .desc:
             colRef = colRef.order(by: orderby, descending: true)
         }

     }

     //데이터 갯수제한
     if limitCount != 0 {
         colRef = colRef.limit(to: limitCount)
     }

     //문서의 변화가 생기면 감지.
     colRef.addSnapshotListener { snapShot, error in
         if let error {
             print("문서번호 못가져옴 : \(error.localizedDescription)")
             completion([[:]])

         } else {
             var fetchedDatas = [[String : Any]]()   //초기화

             if let snapShot {

                 for document in snapShot.documents {

                     let documentData = document.data()

                     fetchedDatas.append(documentData)


                 }
                 print("데이터 개수 \(fetchedDatas.count)")
                 completion(fetchedDatas)

             }

         }
     }

 }
 */
