//
//  API.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 20/04/2023.

import Alamofire
import SwiftyJSON


/*
protocol ProductProtocol:AnyObject {
  func didReceiveResult(model: Product?)
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
        .resume()
    }
}


*/

/*

import UIKit

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

typealias Handler = (Result<[Product], DataError>) ->Void

final class APIManager {
    static let shared = APIManager()
    private init() {}
    
    
    func fetchProducts(completion: @escaping Handler) {
        guard let url = URL(string: Constant.API.productURL) else {
            return
        }
 
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
                
            } catch {
                completion(.failure(.network(error)))
                
            }
        }
        .resume()
        
    }
    
}

*/


//AF.request("https://fakestoreapi.com/products").responseJSON { response in
//    debugPrint(response)
//
//    if let json = response.value {
//        print("JSON: \(json)")
//    }
//}

