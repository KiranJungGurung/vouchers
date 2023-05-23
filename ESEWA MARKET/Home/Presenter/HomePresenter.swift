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
//        let url = "\(baseURL)products"
        let url = URL(string: "https://fakestoreapi.com/products")
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


protocol CategoryProtocolDelegate: AnyObject {
    func displayCategory(model: [Categories])
    
}

class CategoryPresenter {
    
    var categories = [Categories(categoryImage: UIImage(named: "iphone"), categoryName: "mobile"),
                      Categories(categoryImage: UIImage(named: "j"), categoryName: "jewelery"),
                      Categories(categoryImage: UIImage(named: "fashion"), categoryName: "men's cloth"),
                      Categories(categoryImage: UIImage(named: "womencloth"), categoryName: "women's cloth"),
]

    var delegate: CategoryProtocolDelegate?
    weak var view: HomeViewController?

    init(delegate: CategoryProtocolDelegate, view: HomeViewController) {
        self.delegate = delegate
        self.view = view
    }
    
    func updateView() {
        self.delegate?.displayCategory(model: categories)
        
    }
}

