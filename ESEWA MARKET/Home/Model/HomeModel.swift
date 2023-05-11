//
//  HomeModel.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 06/05/2023.
//

import Foundation
import UIKit
//import Alamofire
//import SwiftyJSON

struct Product: Decodable {
    let id: Int
    let title: String
    let price: Float
    let description:String
    let category: String
    let image: String
    let rating: Rate
    
    
}

struct Rate: Decodable {
    let rate: Float
    let count: Int
}
/*
struct Product {
    var category: Categories?
    //    var productImage: String?
    //    var productName: String?
    //    var productDesc: String?
    //    var price: Double?
    
    init(json: JSON) {
        self.category = Categories(json: json["category"])
    }
    
    
}

//struct Shop {
//    var category: Categories?
//    var featuredProduct: FeaturedProduct?
//    var hotDealsOfTheDay: HotDealsOfTheDay?
//    var popularBrand: PopularBrand?
//    var recommendedForYou: RecommendedForYou?
//}

struct Categories {
//    var categoryImage: String?
    var categoryName: String?
    
    init(json: JSON) {
        self.categoryName = json["categoryName"].string
    }
}

struct FeaturedProduct {
    var productName: String?
    var productDesc: String?
    var price: Double?
    
    init(json: JSON) {
        self.productName = json["title"].string
        self.productDesc = json["description"].string
        self.price = json["price"].double
    }
    
}

struct HotDealsOfTheDay {
    var productName: String?
    var productDesc: String?
    var price: Double?

}
struct HotDealBanner {
    var image: String?
}


struct PopularBrand {
    var productName: String?
    var productDesc: String?
    var price: Double?
}

struct RecommendedForYou {
    var productName: String?
    var productDesc: String?
    var price: Double?
}

*/
