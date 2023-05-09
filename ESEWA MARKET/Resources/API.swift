//
//  API.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 20/04/2023.

import Alamofire
import SwiftyJSON

protocol ProductProtocol {
  func didReceiveResult(results: JSON)
}




class ProductAPI {
    
    private let baseURL = "https://fakestoreapi.com"
    
//    func fetchProduct() {
//        getProducts { listOfFeaturedProducts in
////            self.delegate.didFetchedListOfProducts(with list: [featuredproducts])
//        }
//    }

    func getProducts(completion: @escaping ([FeaturedProduct]) -> Void) {
        let url = "\(baseURL)/products"

        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let products = json.arrayValue.map { FeaturedProduct(json: $0)}
                completion(products)
            case .failure(let error):
                print("Error: \(error)")
                completion([])
            }
        }
    }
}
