//
//  HomeModel.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 06/05/2023.


import Alamofire
import Foundation
import SwiftyJSON
import UIKit

struct Product {
    let id: Int?
    let title: String?
    let price: Float?
    let description:String?
    let category: String?
    let image: String?
    let rating: Rate

    init(json: JSON) {
        self.id = json["id"].int
        self.title = json["title"].string
        self.price = json["price"].float
        self.description = json["description"].string
        self.category = json["category"].string
        self.image = json["image"].string
        self.rating = Rate(json: json["rate"])
    }
}

struct Rate {
    let rate: Float?
    let count: Int?

    init(json: JSON) {
        self.rate = json["rate"].float
        self.count = json["count"].int
    }
}

struct Categories {
    //    var categoryImage: String?
    var categoryName: String?

    init(json: JSON) {
    self.categoryName = json["categoryName"].string
      
    }
}

struct FeaturedProduct {
    let id: Int?
    let title: String?
    let price: Float?
    let description:String?
    let category: String?
    let image: String?
    let rating: Rate

    init(json: JSON) {
        self.id = json["id"].int
        self.title = json["title"].string
        self.price = json["price"].float
        self.description = json["description"].string
        self.category = json["category"].string
        self.image = json["image"].string
        self.rating = Rate(json: json["rate"])
        
    }
}

struct HotDealsOfTheDay {
    let id: Int?
    let title: String?
    let price: Float?
    let description:String?
    let category: String?
    let image: String?
    let rating: Rate
    
    init(json: JSON) {
        self.id = json["id"].int
        self.title = json["title"].string
        self.price = json["price"].float
        self.description = json["description"].string
        self.category = json["category"].string
        self.image = json["image"].string
        self.rating = Rate(json: json["rate"])
    }
}

struct HotDealBanner {
    var image: String?
}

struct PopularBrand {
    let id: Int?
    let title: String?
    let price: Float?
    let description:String?
    let category: String?
    let image: String?
    let rating: Rate
    
    init(json: JSON) {
        self.id = json["id"].int
        self.title = json["title"].string
        self.price = json["price"].float
        self.description = json["description"].string
        self.category = json["category"].string
        self.image = json["image"].string
        self.rating = Rate(json: json["rate"])
    }
}

struct RecommendedForYou {
    let id: Int?
    let title: String?
    let price: Float?
    let description:String?
    let category: String?
    let image: String?
    let rating: Rate
    
    init(json: JSON) {
        self.id = json["id"].int
        self.title = json["title"].string
        self.price = json["price"].float
        self.description = json["description"].string
        self.category = json["category"].string
        self.image = json["image"].string
        self.rating = Rate(json: json["rate"])
    }
}

