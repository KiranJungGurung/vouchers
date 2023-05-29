//
//  APIManager.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 29/05/2023.
//

import Alamofire
import Foundation
import SwiftyJSON
import UIKit

class APIManager {
    static func fetchProducts(completion: @escaping (Result<[FeaturedProduct], Error>) -> Void) {
        let url = URL(string: getProductURL)
        AF.request(url!).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let products = json.arrayValue.map { FeaturedProduct(json: $0) }
                completion(.success(products))
            case .failure(let error):
                print("Error: \(error)")
                completion(.failure(error))
            }
        }
    }
}



