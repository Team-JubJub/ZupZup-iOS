//
//  FetchStoreUseCase.swift
//  App
//
//  Created by YeongJin Jeong on 2022/12/15.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation
import ZupZupNetwork
import CoreLocation

protocol FetchStoreUseCase {
    func fetchStore(completion: @escaping (Result<[Store], Error>) -> Void)
}

final class FetchStoreUseCaseImpl: FetchStoreUseCase {
    
    private let fetchStoreRepository: FetchStoreRepository
    
    init(fetchStoreRepository: FetchStoreRepository = FetchStoreRepositoryImpl()) {
        self.fetchStoreRepository = fetchStoreRepository
    }
    
    func fetchStore(completion: @escaping (Result<[Store], Error>) -> Void) {
        fetchStoreRepository.fetchStores { result in
            switch result {
            case .success(let storesDTO):
                let stores = self.convertToStores(storesDTO: storesDTO)
                completion(.success(stores))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func convertToStores(storesDTO: [StoreDTO]) -> [Store] {
        return storesDTO.map { StoreDTO in
            var items = [Item]()
            StoreDTO.merchandiseList.map { merchandise in
                let item = Item(
                    itemId: merchandise.itemId,
                    storeId: merchandise.storeId,
                    itemName: merchandise.itemName,
                    imgUrl: merchandise.imgUrl,
                    originPrice: merchandise.price,
                    discountPrice: merchandise.discounted,
                    stock: merchandise.stock
                )
                items.append(item)
            }
            return Store(
                storeId: StoreDTO.storeId,
                category: "카페",
                storeName: StoreDTO.name,
                openTime: StoreDTO.openTime,
                discountPercent: makeDiscountPercent(storeDTO: StoreDTO),
                discountTime: makeDiscountTime(storeDTO: StoreDTO),
                address: StoreDTO.address,
                location: CLLocationCoordinate2D(
                    latitude: StoreDTO.latitude,
                    longitude: StoreDTO.longitude
                ),
                items: items,
                eventList: StoreDTO.eventList
            )
        }
    }
    
    private func makeDiscountPercent(storeDTO: StoreDTO) -> Int {
        if storeDTO.merchandiseList.count != 0 {
            let discountArray = storeDTO.merchandiseList.map { Int(($0.price - $0.discounted) * 100 / $0.price)}
            let maxDiscount = discountArray.max()
            return maxDiscount ?? 0
        } else {
            return 0
        }
    }
    
    private func makeDiscountTime(storeDTO: StoreDTO) -> String {
        let startString = String(storeDTO.saleTimeStart)
        let endString = String(storeDTO.saleTimeEnd)
        let startTime = startString.prefix(2)
        let startMinute = startString.suffix(2)
        let endTime = endString.prefix(2)
        let endMinute = endString.suffix(2)
        return "\(startTime):\(startMinute) ~ \(endTime):\(endMinute)"
    }
}
