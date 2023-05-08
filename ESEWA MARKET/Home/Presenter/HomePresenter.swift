//
//  HomePresenter.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 06/05/2023.
//

import Foundation
//
//import UIKit
//
//protocol HomeProtocolDelegate: NSObject {
//    func displayProductList(model: [Product])
//    func displayFeaturedProduct(model: [FeaturedProduct])
//}
//
//class HomePresenter{
//    let productList: [Product] = [
//
//        Product(productName: "50 T-shirt",productDesc: "IN STOCK - 99SHOP", price: 530.00),
//        Product(productName: "Oppo A74(6GB)",productDesc: "IN STOCK - OPPO", price: 840.00),
//        Product(productName: "Induction Stove", productDesc: "IN STOCK - BALTRA", price: 39.87),
//        Product(productName: "Induction Stove", productDesc: "IN STOCK - BALTRA", price: 39.87),]
//
//        var featuredProduct: [FeaturedProduct] = [FeaturedProduct(productName: "Oppo A74(6GB)",productDesc: "IN STOCK - OPPO", price: 840.00), FeaturedProduct(productName: "Apple A74(6GB)",productDesc: "IN STOCK - OPPO", price: 840.00), FeaturedProduct(productName: "Xiaomi A74(6GB)",productDesc: "IN STOCK - OPPO", price: 840.00), FeaturedProduct(productName: "Samsung",productDesc: "IN STOCK - OPPO", price: 840.00), FeaturedProduct(productName: "LG",productDesc: "IN STOCK - OPPO", price: 840.00)],
//
//
//    var delegate: HomeProtocolDelegate?
//    weak var view: HomeViewController?
//
//    init(delegate: HomeProtocolDelegate? = nil, view: HomeViewController?) {
//        self.delegate = delegate
//        self.view = view
//
//    }
//
//    func updateView() {
//        self.delegate?.displayProductList(model: productList)
//        self.delegate?.displayFeaturedProduct(model: featuredProduct)
//    }
//
//}

import Foundation
import UIKit

protocol HomeProtocolDelegate: NSObject {
    func displayCategoryAndProduct(model: [Product], featuredProduct: [FeaturedProduct], hotDeals: [HotDealsOfTheDay], hotDealBanner: [HotDealBanner], popularBrand: [PopularBrand], recommendedForYou: [RecommendedForYou])
    
}

class HomePresenter {
    let sections: [Product] = [
        Product(category: Categories(categoryName: "Fashion")),
        Product(category: Categories(categoryName: "Category")),
        Product(category: Categories(categoryName: "Featured Products")),
        Product(category: Categories(categoryName: "Hot Deals")),
        Product(category: Categories(categoryName: "Hot Deals Banner")),
        Product(category: Categories(categoryName: "Popular Brand")),
        Product(category: Categories(categoryName: "Recommended for you"))
    ]

    //let shop = [Shop]()
    
    let featuredProduct: [FeaturedProduct] = [
        FeaturedProduct(productName: "50 T-Shirt", productDesc: "IN STOCK - 99 SHOP", price: 840.00),
        FeaturedProduct(productName: "Nike Air Monarch", productDesc: "IN STOCK - NIKE", price: 8200.00),
//        FeaturedProduct(productName: "Xiaomi A74(6GB)", productDesc: "IN STOCK - OPPO", price: 840.00),
//        FeaturedProduct(productName: "Samsung", productDesc: "IN STOCK - OPPO", price: 840.00),
//        FeaturedProduct(productName: "LG", productDesc: "IN STOCK - OPPO", price: 840.00)
    ]
    let hotDealsOfTheDay: [HotDealsOfTheDay] = [
        HotDealsOfTheDay(productName: "Dell Latitude 13", productDesc: "IN STOCK - DELL", price: 8200.00),
        HotDealsOfTheDay(productName: "Oppo A74(6GB)", productDesc: "IN STOCK - OPPO", price: 840.00),
        HotDealsOfTheDay(productName: "Xiaomi A74(6GB)", productDesc: "IN STOCK - OPPO", price: 840.00),
        HotDealsOfTheDay(productName: "Samsung", productDesc: "IN STOCK - OPPO", price: 840.00),
        HotDealsOfTheDay(productName: "LG", productDesc: "IN STOCK - OPPO", price: 840.00)
  
    ]
    let hotDealBanner: [HotDealBanner] = [
        HotDealBanner(image: "banner1"), HotDealBanner(image: "banner2"), HotDealBanner(image: "banner3")]
    
    let popularBrand: [PopularBrand] = [
        PopularBrand(productName: "Oppo A74(6GB)", productDesc: "IN STOCK - OPPO", price: 840.00),
        PopularBrand(productName: "Apple A74(6GB)", productDesc: "IN STOCK - OPPO", price: 840.00),
        PopularBrand(productName: "Xiaomi A74(6GB)", productDesc: "IN STOCK - OPPO", price: 840.00),
        PopularBrand(productName: "Samsung", productDesc: "IN STOCK - OPPO", price: 840.00),
        PopularBrand(productName: "LG", productDesc: "IN STOCK - OPPO", price: 840.00)
    ]
    
    let recommendedForYou: [RecommendedForYou] = [
        RecommendedForYou(productName: "Riva Floral Dohar", productDesc: "BLUE - RIVER", price:3200.00),
        RecommendedForYou(productName: "Induction Stove", productDesc: "IN STOCK - BALTRA", price: 3987.00),
        RecommendedForYou(productName: "Xiaomi A74(6GB)", productDesc: "IN STOCK - OPPO", price:840.00),
        RecommendedForYou(productName: "Samsung", productDesc: "IN STOCK - OPPO", price: 840.00),
        RecommendedForYou(productName: "LG", productDesc: "IN STOCK - OPPO", price: 840.00)
    ]
    

    weak var delegate: HomeProtocolDelegate?
    weak var view: HomeViewController?

    init(delegate: HomeProtocolDelegate?, view: HomeViewController?) {
        self.delegate = delegate
        self.view = view
    }

    func updateView() {
        self.delegate?.displayCategoryAndProduct(model: sections, featuredProduct: featuredProduct, hotDeals: hotDealsOfTheDay, hotDealBanner: hotDealBanner, popularBrand: popularBrand, recommendedForYou: recommendedForYou)
    }
}
