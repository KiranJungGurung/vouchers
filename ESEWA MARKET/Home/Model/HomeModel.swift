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
    var categoryImage: UIImage?
    var categoryName: String?

//    init(json: JSON) {
//    self.categoryName = json["categoryName"].string
//      
//    }
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

struct HomeTexts {
    static let marketTitle = "Market"
    static let searchBarPlaceholder = "What are you searching for?"
    static let footerHomeButtonImage = "house"
    static let footerCartButtonImage = "cart"
    static let footerLikeButtonImage = "heart"
    static let footerMenuButtonImage = "ellipsis"
    static let cartViewControllerTitle = "My Cart"
}

struct TableViewHeaderText {
    static let section0 = ""
    static let section1 = "Categories"
    static let section2 = "Featured Products"
    static let section3 = "Hot Deals Of The Day"
    static let section4 = ""
    static let section5 = "Popular Brands"
    static let defaultSection = "Recommended for you"
}
