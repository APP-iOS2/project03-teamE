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

///Firebase의 Document의 key는 String이어야 하기 때문에 Firebase함수를 이용하는 타입에 프로토콜로 규칙을 부여합니다.
protocol CEatsIdentifiable: Identifiable {
    var id: String { get }
}

extension CEatsIdentifiable {
    func getPropertyName<T: CEatsIdentifiable, U>(_ keyPath: KeyPath<T, U>, completion: (String) -> Void) {
        guard let propertyName = "\(keyPath.debugDescription)".split(separator: ".").last
        else {
            print(#function + ": fail to optional bind")
            return
        }
        completion(String(propertyName))
    }
}

///CEatsFBManager의 메서드는 CEatsIdentifiable을 따르는 객체들만 사용할 수 있습니다.
///**CEatsIdentifiable 프로토콜을 채택한 Struct: User, Seller, Restaurant, Order**
/// ```
/// let fbManager = CEatsFBManager()
/// ```
final class CEatsFBManager {
    static let shared = CEatsFBManager()
    
    private let db = Firestore.firestore()
    
    private init() { }
    
    func updateValue<T: CEatsIdentifiable, U: Decodable>(data: T, value keyPath: WritableKeyPath<T, U>, to: U, completion: @escaping (T) -> Void) where T: Codable {
        let collectionRef: CollectionReference = db.collection("\(type(of: data))")
        
        read(type: T.self, id: data.id) { result in
            DispatchQueue.global().async {
                do {
                    var updateData = result
                    updateData[keyPath: keyPath] = to
                    try collectionRef.document(data.id).setData(from: updateData) { error in
                        guard error == nil else {
                            self.printError(error: error!)
                            return
                        }
                        DispatchQueue.main.async {
                            completion(updateData)
                        }
                    }
                } catch {
                    print(#function + ": fail to .setData()")
                }
            }
        }
    }
    
    func updateValueInArray<T: CEatsIdentifiable, U: Decodable>(data: T, value keyPath: WritableKeyPath<T, [U]>, to: U, completion: @escaping (T) -> Void) where T: Codable, U: CEatsIdentifiable {
        let collectionRef: CollectionReference = db.collection("\(type(of: data))")
        
        read(type: T.self, id: data.id) { result in
            DispatchQueue.global().async {
                do {
                    var updateData = result
                    let values = updateData[keyPath: keyPath]
                    guard let index = values.firstIndex(where: { $0.id == to.id }) else {
                        print(#function + ": fail to optional bind - index")
                        return
                    }
                    updateData[keyPath: keyPath][index] = to
                    try collectionRef.document(data.id).setData(from: updateData) { error in
                        guard error == nil else {
                            self.printError(error: error!)
                            return
                        }
                        DispatchQueue.main.async {
                            completion(updateData)
                        }
                    }
                } catch {
                    print(#function + ": fail to .setData()")
                }
            }
        }
    }
    
    func uploadDummyData<T: CEatsIdentifiable>(datas: T...) where T: Encodable {
        datas.forEach { data in
            let collectionRef = db.collection("\(type(of: data))")
            
            DispatchQueue.global().async {
                do {
                    try collectionRef.document(data.id).setData(from: data) { error in
                        guard error == nil else {
                            self.printError(error: error!)
                            return
                        }
                    }
                } catch {
                    print(#function + ": fail to .setData(from:)")
                }
            }
        }
    }
    
    func uploadDummyArray<T: CEatsIdentifiable>(datas: [T]) where T: Encodable {
        datas.forEach { data in
            let collectionRef = db.collection("\(type(of: data))")
            
            DispatchQueue.global().async {
                do {
                    try collectionRef.document(data.id).setData(from: data) { error in
                        guard error == nil else {
                            self.printError(error: error!)
                            return
                        }
                    }
                } catch {
                    print(#function + ": fail to .setData(from:)")
                }
            }
        }
    }
    
    ///동작하지 않음
    func updateAndaddSnapshot<T: CEatsIdentifiable, U: Decodable>(data: T, value keyPath: WritableKeyPath<T, U>, to: U, completion: @escaping (U) -> ()) {
        let collectionRef = db.collection("\(type(of: data))")
        
        update(data: data, value: keyPath, to: to) { result in
            data.getPropertyName(keyPath) { propertyName in
                DispatchQueue.global().async {
                    collectionRef.document(data.id).addSnapshotListener { snapshot, error in
                        guard error == nil else {
                            self.printError(error: error!)
                            return
                        }
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
        }
    }
    
    func addCollectionSnapshotForRest<T: CEatsIdentifiable>(type: T.Type, completion: @escaping ([T]) -> ()) where T: Decodable {
        let collectionRef = db.collection("\(type)")
        
        collectionRef.addSnapshotListener { snapshot, error in
            guard error == nil else {
                self.printError(error: error!)
                return
            }
            guard let returnArray = snapshot?.documents.map({
                do {
                    return try $0.data(as: T.self)
                } catch {
                    fatalError()
                }
            }) else { return }
            completion(returnArray)
        }
    }
    func addCollectionSnapshot<T: CEatsIdentifiable, U: Decodable>(data: T, value keyPath: KeyPath<T, U>, completion: @escaping (U) -> ()) where T: Decodable {
        let collectionRef = db.collection("\(type(of: data))")
        var listener: ListenerRegistration?
        DispatchQueue.global().async {
            listener = collectionRef.addSnapshotListener { snapshot, error in
                guard error == nil else {
                    self.printError(error: error!)
                    return
                }
                guard let docs = snapshot?.documents else {
                    print(#function + ": fail to optional bind - docs")
                    return
                }
                let myChange = docs.filter {
                    do {
                       return try $0.data(as: T.self).id == data.id
                    } catch {
                        return false
                    }
                }
                if !myChange.isEmpty {
                    guard let result = try? myChange[0].data(as: T.self) else {
                        print(#function + ": fail to optional bind")
                        return
                    }
                    completion(result[keyPath: keyPath])
                } else {
                    listener?.remove()
                    print("listener is removed")
                }
            }
        }
    }
    
    func addSnapshot<T: CEatsIdentifiable, U: Decodable>(data: T, value keyPath: KeyPath<T, U>, completion: @escaping (U) -> ()) {
        let collectionRef = db.collection("\(type(of: data))")
        
        data.getPropertyName(keyPath) { propertyName in
            DispatchQueue.global().async {
                collectionRef.document(data.id).addSnapshotListener { snapshot, error in
                    guard error == nil else {
                        self.printError(error: error!)
                        return
                    }
                    guard let fbDic = snapshot?.data() else {
                        print(#function + ": fail to optional bind - [String: Any]")
                        return
                    }
                    guard let fbAny = fbDic[propertyName] else {
                        print(#function + ": fail to optional bind - Any")
                        return
                    }
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: fbAny) else {
                        print(#function + ": fail to optional bind - jsonData")
                        return
                    }
                    guard let uType = try? JSONDecoder().decode(U.self, from: jsonData) else {
                        print(#function + ": fail to optional bind - U")
                        return
                    }
                    DispatchQueue.main.async {
                        completion(uType)
                    }
                }
            }
        }
    }
    
    func addArraySnapshot<T: CEatsIdentifiable, U: Decodable>(data: T, value keyPath: KeyPath<T, U>, completion: @escaping ([U]) -> ()) {
        let collectionRef: CollectionReference = db.collection("\(type(of: data))")
        
        data.getPropertyName(keyPath) { propertyName in
            DispatchQueue.global().async {
                collectionRef.document(data.id).addSnapshotListener { snapshot, error in
                    guard error == nil else {
                        self.printError(error: error!)
                        return
                    }
                    guard let fbDic = snapshot?.data() else {
                        print(#function + ": fail to optional bind - [String: Any]")
                        return
                    }
                    guard let fbAny = fbDic[propertyName] else {
                        print(#function + ": fail to optional bind - Any")
                        return
                    }
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: fbAny) else {
                        print(#function + ": fail to optional bind - jsonData")
                        return
                    }
                    guard let uType = try? JSONDecoder().decode([U].self, from: jsonData) else {
                        print(#function + ": fail to optional bind - [U]")
                        return
                    }
                    DispatchQueue.main.async {
                        completion(uType)
                    }
                }
            }
        }
    }
    /// - create: Firestore의 data의 타입이름인 Collection에 data가 생성됩니다.
    /// - Document의 key는 data의 id 프로퍼티입니다.
    /// ```
    /// let user = User()
    ///
    /// fbManager.create(data: user)
    ///
    /// fbManager.create(data: user) {
    ///     db작업이 끝난 후 실행할 코드블럭
    ///     error 발생 시 블럭을 실행하지 않고 error를 print합니다.
    /// }
    /// ```
    func create<T: CEatsIdentifiable>(data: T) where T: Encodable {
        let collectionRef: CollectionReference = db.collection("\(type(of: data))")
        
        DispatchQueue.global().async {
            do {
                try collectionRef.document(data.id).setData(from: data) { error in
                    guard error == nil else {
                        self.printError(error: error!)
                        return
                    }
                }
            } catch {
                print(#function + ": fail to .setData(from:)")
            }
        }
    }
    
    func create<T: CEatsIdentifiable>(data: T, completion: @escaping () -> ()) where T: Encodable {
        let collectionRef: CollectionReference = db.collection("\(type(of: data))")
        
        DispatchQueue.global().async {
            do {
                try collectionRef.document(data.id).setData(from: data) { error in
                    guard error == nil else {
                        self.printError(error: error!)
                        return
                    }
                }
                completion()
            } catch {
                print(#function + ": fail to .setData()")
            }
        }
    }
    
    /// - read: Firestore의 type인 Collection에서 입력된 id값을 가진 프로퍼티를 반환합니다.
    /// ```
    /// let user: User
    /// let id: String = "SomeString" // login정보를 UserDefaults나 CoreData
    ///
    /// fbManager.read(type: User.self, id: "id값") { result in
    ///     user = result
    /// }
    /// ```
    func read<T: CEatsIdentifiable>(type: T.Type, id: String, completion: @escaping (T) -> Void) where T: Decodable {
        guard !id.isEmpty else {
            print(#function + "ERROR!!! documentID is Empty")
            return
        }
        
        let documentRef = db.collection("\(type)").document(id)
        
        DispatchQueue.global().sync {
            documentRef.getDocument(as: T.self) { result in
                switch result {
                case .success(let success):
                    DispatchQueue.main.async {
                        completion(success)
                    }
                case .failure(let error):
                    self.printError(error: error)
                }
            }
        }
    }
    
    func readProperty<T: CEatsIdentifiable, U>(data: T, value keyPath: KeyPath<T, U>, completion: @escaping (U) -> ()) {
        let collectionRef: CollectionReference = db.collection("\(type(of: data))")
        data.getPropertyName(keyPath) { propertyName in
            collectionRef.document(data.id).getDocument { snapshot, error in
                guard error == nil else {
                    self.printError(error: error!)
                    return
                }
                guard let fbdic = snapshot?.data() else {
                    print(#function + ": fail to optional bind - [String: Any]")
                    return
                }
                guard let uType = fbdic[propertyName] as? U else {
                    print(#function + ": fail to optional bind - [U]")
                    return
                }
                completion(uType)
            }
        }
    }
    
    func readAllDocument<T: CEatsIdentifiable>(type: T.Type, completion: @escaping (T) -> ()) where T: Decodable {
        let collectionRef = db.collection("\(type)")
        
        var idArray: [String] = []
        
        DispatchQueue.global().sync {
            collectionRef.getDocuments { snapshot, error in
                guard error == nil else {
                    self.printError(error: error!)
                    return
                }
                guard let allDocs = snapshot?.documents else {
                    print(#function + ": fail to optional bind - snapshot?.documents")
                    return
                }
                allDocs.forEach {
                    idArray.append($0.documentID)
                }
                idArray.forEach { id in
                    self.read(type: type, id: id) { result in
                        completion(result)
                    }
                }
            }
        }
    }
    
    /// - update: Firestore의 data의 타입이름인 Collection에서 같은 id를 가진 data를 변경합니다.
    /// ```
    /// let user = User()
    ///
    /// fireManager.update(data: user, value: \.cEatsMoney, to: 1000000) { result in
    ///     user = result
    /// }
    /// ```
    ///
    func update<T: CEatsIdentifiable, U: Decodable>(data: T, value keyPath: WritableKeyPath<T, U>, to: U, completion: @escaping (T) -> Void) {
        let collectionRef: CollectionReference = db.collection("\(type(of: data))")
        
        data.getPropertyName(keyPath) { propertyName in
            DispatchQueue.global().async {
                collectionRef.document(data.id).updateData([propertyName: to]) { error in
                    self.checkError(error: error) {
                        var result = data
                        result[keyPath: keyPath] = to
                        DispatchQueue.main.async {
                            completion(result)
                        }
                    }
                }
            }
        }
    }
    
    func insertValue<T: CEatsIdentifiable, U: Decodable>(data: T, insertAt: Int, value keyPath: WritableKeyPath<T, [U]>, to: U, completion: @escaping () -> Void) where T: Encodable {
        let collectionRef: CollectionReference = db.collection("\(type(of: data))")
        
        data.getPropertyName(keyPath) { propertyName in
            DispatchQueue.global().async {
                collectionRef.document(data.id).getDocument { snapshot, error in
                    guard error == nil else {
                        self.printError(error: error!)
                        return
                    }
                    var newData = data
                    newData[keyPath: keyPath].insert(to, at: insertAt)
                    do {
                        try collectionRef.document(data.id).setData(from: newData) { error in
                            guard error == nil else {
                                self.printError(error: error!)
                                return
                            }
                            completion()
                        }
                    } catch {
                        print(#function + ": Error - setData(from: newData)")
                    }
                }
            }
        }
    }
    
    func appendValue<T: CEatsIdentifiable, U: Decodable>(data: T, value keyPath: WritableKeyPath<T, [U]>, to: U, completion: @escaping (String) -> Void) where T: Encodable, U: CEatsIdentifiable {
        let collectionRef: CollectionReference = db.collection("\(type(of: data))")
        
        data.getPropertyName(keyPath) { propertyName in
            DispatchQueue.global().async {
                collectionRef.document(data.id).getDocument { snapshot, error in
                    guard error == nil else {
                        self.printError(error: error!)
                        return
                    }
                    var newData = data
                    newData[keyPath: keyPath].append(to)
                    do {
                        try collectionRef.document(data.id).setData(from: newData) { error in
                            guard error == nil else {
                                self.printError(error: error!)
                                return
                            }
                            completion(to.id)
                        }
                    } catch {
                        print(#function + ": Error - setData(from: newData)")
                    }
                }
            }
        }
    }
    
    
    func addSnapshot<T: CEatsIdentifiable, U: Decodable>(data: T, value keyPath: KeyPath<T, U>, resultCompletion: @escaping (U) -> (), completion: @escaping (ListenerRegistration?) -> ()) {
        let collectionRef = db.collection("\(type(of: data))")
        var listener: ListenerRegistration?
        
        data.getPropertyName(keyPath) { propertyName in
            DispatchQueue.global().async {
                listener = collectionRef.document(data.id).addSnapshotListener { snapshot, error in
                    guard error == nil else {
                        self.printError(error: error!)
                        return
                    }
                    guard let fbDic = snapshot?.data() else {
                        print(#function + ": fail to optional bind - [String: Any]")
                        return
                    }
                    guard let fbAny = fbDic[propertyName] else {
                        print(#function + ": fail to optional bind - Any")
                        return
                    }
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: fbAny) else {
                        print(#function + ": fail to optional bind - jsonData")
                        return
                    }
                    guard let uType = try? JSONDecoder().decode(U.self, from: jsonData) else {
                        print(#function + ": fail to optional bind - U")
                        return
                    }
                    DispatchQueue.main.async {
                        resultCompletion(uType)
                        completion(listener)
                    }
                }
            }
        }
    }
    
    func insertValueResult<T: CEatsIdentifiable, U: Decodable>(data: T, insertAt: Int, value keyPath: WritableKeyPath<T, [U]>, to: U, completion: @escaping (_ success : U) -> Void) where T: Encodable {
        let collectionRef: CollectionReference = db.collection("\(type(of: data))")
        
        data.getPropertyName(keyPath) { propertyName in
            DispatchQueue.global().async {
                collectionRef.document(data.id).getDocument { snapshot, error in
                    guard error == nil else {
                        self.printError(error: error!)
                        return
                    }
                    var newData = data
                    newData[keyPath: keyPath].insert(to, at: insertAt)
                    do {
                        try collectionRef.document(data.id).setData(from: newData) { error in
                            guard error == nil else {
                                self.printError(error: error!)
                                return
                            }
                            completion(to)
                        }
                    } catch {
                        print(#function + ": Error - setData(from: newData)")
                    }
                }
            }
        }
    }
    
    /// - delete: Firestore의 data의 타입이름인 Collection에서 같은 id를 가진 data를 제거합니다.
    /// ```
    /// let user = User.sampleData
    /// var userList = [user]
    ///
    /// delete(data: user) { result in
    ///     guard let index = userList.firstIndex(of: result) else {
    ///         print(#function + ": fail to optional bind")
    ///         return
    ///     }
    ///     userList.remove(at: index)
    /// }
    /// ```
    func delete<T: CEatsIdentifiable>(data: T, completion: @escaping (T) -> ()) {
        let documentID = data.id
        guard !documentID.isEmpty else {
            print(#function + ": documentID is Empty")
            return
        }
        
        let documentRef = db.document("\(type(of: data))/\(documentID)")
        
        documentRef.delete() { error in
            self.checkError(error: error) {
                completion(data)
            }
        }
    }
    
    private func printError(error: Error) {
        print(#function + ": \(error.localizedDescription)")
    }
    
    private func checkError(error: Error?, completion: () -> ()) {
        if let error {
            print(#function + ": \(error.localizedDescription)")
        } else {
            completion()
        }
    }
}
