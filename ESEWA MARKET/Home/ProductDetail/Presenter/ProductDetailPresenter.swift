// ProductDetailPresenter
//
//  ProductDetailPresenter.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 05/05/2023.
//
import Foundation
import UIKit

protocol ProductDetailProtocolDelegate: NSObject {
//    func displayProductItems(model: [ProductDetail]
    func displayProductDetailItems(model: [ProductDetail], productImage: [ProductImage], productInfo: [ProductInfo], productDescription: [ProductDescription], productCalculation: [ProductCalculation])
}



class ProductDetailPresenter {
    let sections: [ProductDetail] = [
        ProductDetail(section: Section(sectionName: "ProductImage")),
        ProductDetail(section: Section(sectionName: "ProductInfo")),
        ProductDetail(section: Section(sectionName: "Description")),
        ProductDetail(section: Section(sectionName: "ProductCalculation")),
    ]
    
    let productImage: [ProductImage] = [ProductImage(image: UIImage(named: "jacket"))]
    
    let productInfo: [ProductInfo] = [ProductInfo(productName: "Jacket In Nylong",price: 2500.00)]
    
    let productDescription: [ProductDescription] = [
        ProductDescription(productCheckMark: UIImage(systemName: "checkmark.circle"), productDesc: "Approx. model measurements: height:5'10, bust:31-1/2, waist: 24"),
        ProductDescription(productCheckMark: UIImage(systemName: "checkmark.circle"), productDesc: "V-neck"),
        ProductDescription(productCheckMark: UIImage(systemName: "checkmark.circle"), productDesc: "Created for Macy's")
    ]
    
    let productCalculation: [ProductCalculation] = [ProductCalculation(productName: "Jacket In Nylon - celene", totalPrice: 2500.00)]
    
    
    weak var delegate: ProductDetailProtocolDelegate?
       weak var view: ProductDetailViewController?

       init(delegate: ProductDetailProtocolDelegate?, view: ProductDetailViewController?) {
           self.delegate = delegate
           self.view = view
           
       }

       func updateView() {
           self.delegate?.displayProductDetailItems(model: sections, productImage: productImage, productInfo: productInfo, productDescription: productDescription, productCalculation: productCalculation)
           
           
           
       }
   }
    
    
    
    
    
    
    
    
    
    
    
//    var images = ["hoodie", "jacket", "nivea", "t-shirt"]
    
//    var productDetails: [ProductDetailModel]  = [ProductDetailModel(productImages: [UIImage(named: "jacket")!],productName: "Jacket in Nylon", priceLabel: 230.0, discountpriceLabel: 50.0, productDescription: description(descLabel: "V-neck"), totalPrice: 5200.00)]
//
//
                                                 
//    var delegate: ProductDetailProtocol?
//
//    weak var view: ProductDetailViewController?
//
//    init(delegate: ProductDetailProtocol? = nil, view: ProductDetailViewController? = nil) {
//        self.delegate = delegate
//        self.view = view
//
//    }
//
//    func populateTableView() {
//        self.delegate?.displayProductItems(model: productDetails)
//    }
//}

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

