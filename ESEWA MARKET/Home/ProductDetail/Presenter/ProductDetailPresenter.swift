// ProductDetailPresenter
//
//  ProductDetailPresenter.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 05/05/2023.
//
//import Foundation
//import UIKit
//
//protocol ProductDetailProtocolDelegate: NSObject {
//    func displayProductList(model: [ProductDetail])
//}
//
//class ProductDetailPresenter {
//    
//    var productDetail = [ProductDetail(productImages: UIImage(named: "hoddie"), productName: "Jacket In Nylon", price: 2500, discountpriceLabel: 500, productDescription: "V-neck")]
//
//    var delegate: ProductDetailProtocolDelegate?
//    weak var view: ProductDetailViewController?
//
//    init(delegate: ProductDetailProtocolDelegate, view: ProductDetailViewController) {
//        self.delegate = delegate
//        self.view = view
//    }
//    
//
//    func updateView() {
//        
//        self.delegate?.displayProductList(model: productDetail)
//
//        
//    }
//}
//
