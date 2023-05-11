//
//  APIManager.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 10/05/2023.
//
/*
import Foundation

import Alamofire
import SwiftyJSON

protocol NetworkManagerProtocol {
    func fetchDataFromAPI(completion: @escaping (Result<[String: Any], Error>) -> Void)
}


class NetworkManager: NetworkManagerProtocol {
    
    
//    weak var delegate: NetworkManagerProtocol?
//
//    init(delegate: NetworkManagerProtocol? = nil) {
//        self.delegate = delegate
//
//    }
//
    func fetchDataFromAPI(completion: @escaping (Result<[String: Any], Error>) -> Void) {
        
        let url = "\(baseURL)/products"
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
 
                completion(.success(json.dictionaryObject ?? [:]))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
        
    }
}
*/

//
//import UIKit
//
//enum DataError: Error {
//    case invalidResponse
//    case invalidURL
//    case invalidData
//    case network(Error?)
//}
//
//typealias Handler = (Result<[Product], DataError>) ->Void
//
//final class APIManager {
//    static let shared = APIManager()
//    private init() {}
//
//
//    func fetchProducts(completion: @escaping Handler) {
//        guard let url = URL(string: Constant.API.productURL) else {
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data, error == nil else {
//                completion(.failure(.invalidData))
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse,
//                  200 ... 299 ~= response.statusCode else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//
//            do {
//                let products = try JSONDecoder().decode([Product].self, from: data)
//                completion(.success(products))
//
//            } catch {
//                completion(.failure(.network(error)))
//
//            }
//        }
//        .resume()
//
//    }
//
//}


import Foundation
import UIKit
import Alamofire
import SwiftyJSON

protocol HomeProtocolDelegate: NSObject {
    func didFetchProduct(model:Product?)
}

class FetchProduct {
    
    var delegate: HomeProtocolDelegate? 
    
    init(delegate: HomeProtocolDelegate? = nil) {
        self.delegate = delegate
        
    }
    func fetch() {
        fetchProducts {[weak self] result in
            switch result {
            case .success(let model):
                print(model)
            case .failure(let error):
                print(error.localizedDescription)
                
            }
            
        }
    }
    
    func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        let url = "https://fakestoreapi.com/products"
        
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let products = Product(json: json)
                self.delegate?.didFetchProduct(model:products)
                
//
//                for i in 0..<arrayCount {
//
//                    let title = json["title"].string ?? "N/A"
//                    print("Product Name: \(title)")
//
//                    let price = json["price"].float ?? "N/A"
//                    print("Product Price: \(price)")
//
//                    let category = json["category"].string ?? "N/A"
//                    print("Product Category: \(category)")
//
//                }
            
                
//                
//                let products = Product(json: json)
//
            case .failure(let error):
                print(error)
                
        }
    }
       
}
