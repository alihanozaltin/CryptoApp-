//
//  ViewModel.swift
//  CryptoApp
//
//  Created by Alihan Özaltın on 22.03.2023.
//

import Foundation

struct CryptoListViewModel {
    let cryptoCurrencyList: [CryptoCurrency]
    
    func numberOfRowsInSection() -> Int {
         return self.cryptoCurrencyList.count
     }
     
     func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
         let crypto = self.cryptoCurrencyList[index]
         return CryptoViewModel(crypto)
     }
}

struct CryptoViewModel {
    let crytpoCurrency: CryptoCurrency
    
    init(_ crypto: CryptoCurrency) {
        self.crytpoCurrency = crypto
    }
    
    var name: String {
        return self.crytpoCurrency.currency
    }
    
    var price: String {
        return self.crytpoCurrency.price
    }
}

