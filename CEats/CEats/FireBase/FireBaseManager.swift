//
//  FireBaseManager.swift
//  CEats
//
//  Created by 박범수 on 2023/09/07.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

protocol CEatsIdentifiable {
    var id: String { get set }
}

///CEatsFBManager의 메서드는 CEatsIdentifiable을 따르는 객체들만 사용할 수 있습니다.
///**CEatsIdentifiable 프로토콜을 채택한 Struct: User, Restaurant**
/// ```
/// let fbManager = CEatsFBManager()
/// ```
final class CEatsFBManager {
    private let db = Firestore.firestore()
    
    ///[Order]객체들을 실시간 추적하기 위한 함수 - 미완성
    func addOrderSnapshot(user: User, completion: @escaping ([Order]) -> ()) {
        let collectionRef: CollectionReference = db.collection("\(type(of: user))")
        
        DispatchQueue.global().async {
            collectionRef.document(user.id).addSnapshotListener { snapshot, error in
                self.printError(error: error)
                guard let data = snapshot?.data() else {
                    print(#function + ": fail to optional bind - [String: Any]")
                    return
                }
                guard let a = data["orderHistory"] else {
                    print(#function + ": fail to optional bind - Any")
                    return
                }
                let b = try? JSONSerialization.data(withJSONObject: a)
                guard let b else {
                    print(#function + ": fail to optional bind - Data")
                    return
                }
                let c = try? JSONDecoder().decode([Order].self, from: b)
                guard let c else {
                    print(#function + ": fail to optional bind - [Order]")
                    return
                }
                DispatchQueue.main.async {
                    completion(c)
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
            try collectionRef.addDocument(from: data) { error in
                self.printError(error: error)
            }
        } catch {
            print(#function + "fail to try collectionRef.addDocument()")
        }
    }
    
    func create<T: CEatsIdentifiable>(data: T, completion: @escaping () -> ()) where T: Encodable {
        let collectionRef: CollectionReference = db.collection("\(type(of: data))")
        
        do {
            try collectionRef.addDocument(from: data) { error in
                self.printError(error: error)
                completion()
            }
        } catch {
            print(#function + "fail to try collectionRef.addDocument()")
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
    func update<T: CEatsIdentifiable>(data: T) {
        let documentID = data.id
        guard !documentID.isEmpty else {
            print(#function + "ERROR!!! documentID is Empty")
            return
        }
        
        let docRef = db.collection("\(type(of: data))").document(documentID)
        
        let dataDic = [String: Any]()
        
        docRef.updateData(dataDic) { error in
            self.printError(error: error)
        }
    }
    
    func update<T: CEatsIdentifiable>(data: T, completion: @escaping () -> ()) {
        let documentID = data.id
        guard !documentID.isEmpty else {
            print(#function + "ERROR!!! documentID is Empty")
            return
        }
        
        let docRef = db.collection("\(type(of: data))").document(documentID)
        
        let dataDic = [String: Any]()
        
        docRef.updateData(dataDic) { error in
            self.printError(error: error)
            completion()
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
            self.printError(error: error)
            completion()
        }
    }
    
    private func printError(error: Error?) {
        if let error {
            print(#function + ": \(error.localizedDescription)")
        }
    }
}

/*
 
 ///   onAppear()에서 호출바랍니다.
 ///서버에서 가져올 데이터를 담을 구조체( 데이터 객체 )의 배열을 클로저 매개변수로 반환
 ///Data의 필드명이 데이터객체의 프로퍼티명과 일치하지 않거나 없을 경우 런타임 에러가 나기때문에 사용을 비추천 ->> 프로퍼티를 옵셔널로 처리하면 에러 안남.
 /// - collection: 컬렉션명 Enum
 /// - whereField: 조건을 입력할 Field명 ( String? )
 /// - whereType: 조건 타입 ex) equalTo( == ), lessThan( < ) etc...
 /// - whereData: 조건 값 ( Any? )
 /// - orderField: 정렬 Field명 ( String? )
 /// - orderType: 정렬 (오름차순, 내림차순) Enum
 /// - limitCount: 데이터 fetch개수 ==> 0이면 전체조회
 /// - completion: [ T ] -> Void  ==> 실제 데이터배열 Return
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
 
 
 ///Dictionary 형식으로 결과값 반환
 ///where는 데이터를 가져오는 조건이지 검색용필터가 아닙니당
 ///배열로 가져옴 [[String : Any]] //
 ///   onAppear()에서 호출바랍니다.
 /// - collection: 컬렉션명 Enum
 /// - whereField: 조건을 입력할 Field명 ( String? )
 /// - whereType: 조건 타입 ex) equalTo( == ), lessThan( < ) etc...
 /// - whereData: 조건 값 ( Any? )
 /// - orderField: 정렬 Field명 ( String? )
 /// - orderType: 정렬 (오름차순, 내림차순) Enum
 /// - limitCount: 데이터 fetch개수 ==> 0 이면 전체조회
 /// - completion: [[String : Any]] -> Void  ==> 실제 데이터배열 Return
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
 
 .getDocuments { [weak self] snapshot, _ in
 if let snapshot = snapshot {
 self?.selectedPerfumes = snapshot.documents.compactMap {
 try? $0.data(as: Perfume.self)
 }
 }
 }
 */
