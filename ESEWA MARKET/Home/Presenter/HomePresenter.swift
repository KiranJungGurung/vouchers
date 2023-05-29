//
//  HomePresenter.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 06/05/2023.
//
import Alamofire
import Foundation
import SwiftyJSON
import UIKit

 protocol HomeProtocolDelegate: AnyObject {
 func didFetchProduct(model:[FeaturedProduct])
 }

class HomePresenter {
    weak var delegate: HomeProtocolDelegate?
    init(delegate: HomeProtocolDelegate? = nil) {
        self.delegate = delegate
    }
    
    func fetch() {
        fetchProducts {[weak self] result in
            switch result {
            case .success(let model):
                print(model)
                self?.delegate?.didFetchProduct(model: model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func fetchProducts(completion: @escaping (Result<[FeaturedProduct], Error>) -> Void) {
        let url = URL(string: getProductURL)
        AF.request(url!).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let products = json.arrayValue.map { FeaturedProduct(json: $0)}
                completion(.success(products))
            case .failure(let error):
                print("Error: \(error)")
                completion(.failure(error))
            }
        }
    }
}
