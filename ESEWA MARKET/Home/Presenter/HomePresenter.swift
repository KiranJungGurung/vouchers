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
        APIManager.fetchProducts { [weak self] result in
            switch result {
            case .success(let model):
                print(model)
                self?.delegate?.didFetchProduct(model: model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
