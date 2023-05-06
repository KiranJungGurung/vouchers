//
//  Cart.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 06/05/2023.
//

//
//import Foundation
//import SwiftyJSON
//import Alamofire
//
//
//struct CartModel {
//    var id: Int?
//    var userId: Int?
//    var date: String?
//    var products: [product]
//
//    struct product {
//        var productId: Int?
//        var quantitity: Int?
//    }
//
//
//    init(json: JSON) {
//        id = json["id"].intValue
//        userId = json["userId"].intValue
//        date = json["date"].stringValue
//
//        var productsArray: [product] = []
//        let productsJSON = json["products"].arrayValue
//        for productJSON in productsJSON {
//            let product = product(json: productJSON)
//            productsArray.append(product)
//        }
//        products = productsArray
//    }
//}
//
//struct product {
//    let id: Int
//    let title: String
//    let price: Double
//    let description: String
//    let category: String
//    let image: String
//    let quantity: Int
//
//    init(json: JSON) {
//        id = json["productId"].intValue
//        title = json["title"].stringValue
//        price = json["price"].doubleValue
//        description = json["description"].stringValue
//        category = json["category"].stringValue
//        image = json["image"].stringValue
//        quantity = json["quantity"].intValue
//    }
//}
//
//
