//
//  ViewModel.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 10/05/2023.
//
/*
import Foundation

final class ProductViewModel {
    
    var products: [Product] = []
    
    var eventHandler: ((_event: Event) -> Void)?
    
    
    func fetchProduct() {
        self.eventHandler?(.loading)
        APIManager.shared.fetchProducts { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case.success(let products):
                self.products = products
                self.eventHandler?(.dataLoaded)
            case.failure(let error):
                self.eventHandler?(.error(error?))
            }
            
        }
        
    }
}

extension ProductViewModel {

    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
//        case newProductAdded(product: AddProduct)
    }

}

*/
