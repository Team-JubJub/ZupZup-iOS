//
//  FetchStoreRepositoryImpl.swift
//  ZupZupNetwork
//
//  Created by YeongJin Jeong on 2022/12/15.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import RxSwift

public protocol FetchStoreRepository {
    func fetchStores(completion: @escaping (Result<[StoreDTO], Error>) -> Void)
}

public class FetchStoreRepositoryImpl: FetchStoreRepository {
    
    public init() {}
    
    let dataBase = Firestore.firestore()
    
    public func fetchStores(completion: @escaping (Result<[StoreDTO], Error>) -> Void){
        
        var stores = [StoreDTO]()
        
        let storeRef = dataBase.collection("Store")
        storeRef.getDocuments { querySnapshot, err in
            if let err = err {
                print(err.localizedDescription)
                completion(.failure(err))
            } else {
                for document in querySnapshot!.documents {
                    do {
                        let store = try document.data(as: StoreDTO.self)
                        stores.append(store)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                completion(.success(stores))
            }
        }
    }
}
