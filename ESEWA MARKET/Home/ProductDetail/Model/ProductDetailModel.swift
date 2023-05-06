
// ProductDetailModel
//
//  ProductModel.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 21/04/2023.
//

import UIKit

struct ProductDetailModel {
    var productImages: [UIImage]
    var productName: String?
    var priceLabel: Double?
    var discountpriceLabel: Double?
    var productDescription: description?
    var totalPrice: Double?
    
}

struct description {
//    var checkImage: String?
    var descLabel: String?
    
    
}


//import Alamofire
//import SwiftyJSON
//
//struct product {
//    let id: Int
//    let title: String
//    let price: Double
//    let description: String
//    let category: String
//    let imageUrl: URL?
//
//    init(json: JSON) {
//        id = json["id"].intValue
//        title = json["title"].stringValue
//        price = json["price"].doubleValue
//        description = json["description"].stringValue
//        category = json["category"].stringValue
//        imageUrl = URL(string: json["image"].stringValue)
//    }
//}
