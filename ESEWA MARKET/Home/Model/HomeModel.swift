//
//  HomeModel.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 06/05/2023.
//

import Foundation
import UIKit

struct Product {
    var category: Categories?
//    var productImage: String?
//    var productName: String?
//    var productDesc: String?
//    var price: Double?
    
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
}

struct FeaturedProduct {
    var productName: String?
    var productDesc: String?
    var price: Double?
    
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
