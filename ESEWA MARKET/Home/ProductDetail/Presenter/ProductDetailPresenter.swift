// ProductDetailPresenter
//
//  ProductDetailPresenter.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 05/05/2023.
//

import UIKit


//class AddCartItemPresenter {
//    var itemList: [AddCartItemModel] = [AddCartItemModel(itemName: "Iphone", itemDescription: "This is my iphone", itemCount: 1, itemPrice: 2000.0),AddCartItemModel(itemName: "Airpods", itemDescription: "This is my airpods", itemCount: 1, itemPrice: 1000.0)]
//
////    var totalPrice = itemCount * itemPrice
//
//
//    var delegate: AddItemToCartProtocol?
//
//    // weak var view: SecondPageViewController?
//
//    init(delegate: AddItemToCartProtocol) {
//        self.delegate = delegate
//    }
//
//    func populateTableView() {
//        self.delegate?.displayItemList(model: itemList)
//    }
//
//}

protocol ProductDetailProtocol: AnyObject {
    func displayProductItems(model: [ProductDetailModel] )
}


class ProductDetailPresenter {
    var images = ["hoodie", "jacket", "nivea", "t-shirt"]
    
    var productDetails: [ProductDetailModel]  = [ProductDetailModel(productImages: [UIImage(named: "jacket")!],productName: "Jacket in Nylon", priceLabel: 230.0, discountpriceLabel: 50.0, productDescription: description(descLabel: "V-neck"), totalPrice: 5200.00)]
                                                 
                                                 
                                                 
    var delegate: ProductDetailProtocol?
    
    weak var view: ProductDetailViewController?
    
    init(delegate: ProductDetailProtocol? = nil, view: ProductDetailViewController? = nil) {
        self.delegate = delegate
        self.view = view
        
    }
    
    func populateTableView() {
        self.delegate?.displayProductItems(model: productDetails)
    }
}

//import Alamofire
//import SwiftyJSON
//
//class productAPI {
//    private let baseURL = "https://fakestoreapi.com"
//
//    func getProducts(completion: @escaping ([product]) -> Void) {
//        let url = "\(baseURL)/products"
//
//        AF.request(url).responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                let products = json.arrayValue.map { product(json: $0) }
//                completion(products)
//            case .failure(let error):
//                print("Error: \(error)")
//                completion([])
//            }
//        }
//    }
//}

