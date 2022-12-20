//
//  Ho.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/06.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit
import RxSwift
import ZupZupNetwork

final class HomeViewModel {
    
    var coordinator: Coordinator
    
    private var fetchStoreUseCase: FetchStoreUseCase
    
    init(
        coordinator: Coordinator,
        fetchStoreUseCase: FetchStoreUseCase = FetchStoreUseCaseImpl()
    ) {
        self.coordinator = coordinator
        self.fetchStoreUseCase = fetchStoreUseCase
    }
}

extension HomeViewModel {
    func fetchData() -> Observable<[Store]> {
        return Observable.create { f in
            self.fetchStoreUseCase.fetchStore { result in
                switch result {
                case .success(let stores):
                    f.onNext(stores)
                case .failure(let error):
                    print(error.localizedDescription)
                    f.onError(error)
                }
                f.onCompleted()
            }
            return Disposables.create()
        }
    }
}

extension HomeViewModel {
    func pushStoreViewController(store: Store) {
        guard let coordinator = coordinator as? StoreViewCoordinating else { return }
        coordinator.pushStoreViewController(store: store)
    }
}
