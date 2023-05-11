//
//  HomePresenter.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 06/05/2023.
//


/*
 import Foundation
 import UIKit
 import Alamofire
 import SwiftyJSON
 
 protocol HomeProtocolDelegate: NSObject {
 func didFetchProduct(model:[Product])
 
 
 //                                featuredProduct: [FeaturedProduct], hotDeals: [HotDealsOfTheDay], hotDealBanner: [HotDealBanner], popularBrand: [PopularBrand], recommendedForYou: [RecommendedForYou])
 //
 }
 
 class HomePresenter {
 //     let sections: [Product] = [
 ////     Product(category: Categories(categoryName: "Fashion")),
 ////     Product(category: Categories(categoryName: "Category")),
 ////     Product(category: Categories(categoryName: "Featured Products")),
 ////     Product(category: Categories(categoryName: "Hot Deals")),
 ////     Product(category: Categories(categoryName: "Hot Deals Banner")),
 ////     Product(category: Categories(categoryName: "Popular Brand")),
 ////     Product(category: Categories(categoryName: "Recommended for you"))
 //     ]
 
 // let shop = [Shop]()
 //
 // let featuredProduct: [FeaturedProduct] = [
 // FeaturedProduct(productName: "50 T-Shirt", productDesc: "IN STOCK - 99 SHOP", price: 840.00),
 // FeaturedProduct(productName: "Nike Air Monarch", productDesc: "IN STOCK - NIKE", price: 8200.00),
 //         FeaturedProduct(productName: "Xiaomi A74(6GB)", productDesc: "IN STOCK - OPPO", price: 840.00),
 //         FeaturedProduct(productName: "Samsung", productDesc: "IN STOCK - OPPO", price: 840.00),
 //         FeaturedProduct(productName: "LG", productDesc: "IN STOCK - OPPO", price: 840.00)
 // ]
 // let hotDealsOfTheDay: [HotDealsOfTheDay] = [
 // HotDealsOfTheDay(productName: "Dell Latitude 13", productDesc: "IN STOCK - DELL", price: 8200.00),
 // HotDealsOfTheDay(productName: "Oppo A74(6GB)", productDesc: "IN STOCK - OPPO", price: 840.00),
 // HotDealsOfTheDay(productName: "Xiaomi A74(6GB)", productDesc: "IN STOCK - OPPO", price: 840.00),
 // HotDealsOfTheDay(productName: "Samsung", productDesc: "IN STOCK - OPPO", price: 840.00),
 // HotDealsOfTheDay(productName: "LG", productDesc: "IN STOCK - OPPO", price: 840.00)
 //
 // ]
 // let hotDealBanner: [HotDealBanner] = [
 // HotDealBanner(image: "banner1"), HotDealBanner(image: "banner2"), HotDealBanner(image: "banner3")]
 //
 // let popularBrand: [PopularBrand] = [
 // PopularBrand(productName: "Oppo A74(6GB)", productDesc: "IN STOCK - OPPO", price: 840.00),
 // PopularBrand(productName: "Apple A74(6GB)", productDesc: "IN STOCK - OPPO", price: 840.00),
 // PopularBrand(productName: "Xiaomi A74(6GB)", productDesc: "IN STOCK - OPPO", price: 840.00),
 // PopularBrand(productName: "Samsung", productDesc: "IN STOCK - OPPO", price: 840.00),
 // PopularBrand(productName: "LG", productDesc: "IN STOCK - OPPO", price: 840.00)
 // ]
 //
 // let recommendedForYou: [RecommendedForYou] = [
 // RecommendedForYou(productName: "Riva Floral Dohar", productDesc: "BLUE - RIVER", price:3200.00),
 // RecommendedForYou(productName: "Induction Stove", productDesc: "IN STOCK - BALTRA", price: 3987.00),
 // RecommendedForYou(productName: "Xiaomi A74(6GB)", productDesc: "IN STOCK - OPPO", price:840.00),
 // RecommendedForYou(productName: "Samsung", productDesc: "IN STOCK - OPPO", price: 840.00),
 // RecommendedForYou(productName: "LG", productDesc: "IN STOCK - OPPO", price: 840.00)
 // ]
 //
 
 weak var delegate: HomeProtocolDelegate?
 
 // weak var view: HomeViewController?
 
 init(delegate: HomeProtocolDelegate? = nil) {
 self.delegate = delegate
 //    self.view = view
 }
 
 func fetch() {
 fetchProducts {[weak self] result in
 switch result {
 case .success(let model):
 print(model)
 case .failure(let error):
 print(error.localizedDescription)
 
 }
 
 }
 }
 
 func fetchProducts(completion: @escaping (Result<[FeaturedProduct], Error>) -> Void) {
 
 let url = "\(baseURL)/products"
 AF.request(url).responseJSON { response in
 
 switch response.result {
 case .success(let value):
 let json = JSON(value)
 //                let products = json.arrayValue.map { FeaturedProduct(json: $0)}
 let products = Product(json: json)
 self.delegate?.didFetchProduct(model: )
 //                completion(products)
 case .failure(let error):
 print("Error: \(error)")
 
 }
 }
 .resume()
 }
 
 //     func updateView() {
 //         self.delegate?.displayCategoryAndProduct(model: sections)
 //    //                                              featuredProduct: featuredProduct, hotDeals: hotDealsOfTheDay, hotDealBanner: hotDealBanner, popularBrand: popularBrand, recommendedForYou: recommendedForYou)
 //        }
 //     }
 }
 
 /*
  
  
  import Foundation
  import Alamofire
  import SwiftyJSON
  
  
  // url: https://fakestoreapi.com/products
  
  protocol HomeProtocolDelegate: NSObject {
  func didFetch(with model: [FeaturedProduct])
  }
  
  class HomePresenter {
  //    let baseURL = "https://fakestoreapi.com"
  let apiClient = ProductAPI()
  weak var delegate: HomeProtocolDelegate?
  
  init(delegate: HomeProtocolDelegate? = nil) {
  self.delegate = delegate
  
  }
  
  func fetch() {
  apiClient.getProducts { list in
  
  func updateView() {
  self.delegate?.didFetch(with: featuredProduct)
  
  
  }
  
  
  
  
  // list ayo so delegate use garera pass gara vc ma ani in vc update view using the list
  //            self.delegate.did
  
  }
  
  func fetchProducts { [ self] result in
  switch result {
  case .success(let model):
  print(model)
  //                self?.delegate?.didFetchModel(with: model)
  case .failure(let error):
  print(error.localizedDescription)
  }
  }
  
  
  }
  */*
 */
/*
import Alamofire
import SwiftyJSON


let url = "https://fakestoreapi.com/products"

AF.request(url).responseJSON { response in
    switch response.result {
    case .success(let value):
        let id = json["id"].string ?? "N/A"
        print("ID: \(id)")
        let title = json["employee_name"].string ?? "N/A"
        print("Employee Name: \(employeeName)")
        let employeeSalary = json["employee_salary"].string ?? "N/A"
        print("Employee Salary: \(employeeSalary)")
        let employeeAge = json["employee_age"].string ?? "N/A"
        print("Employee Age: \(employeeAge)")
        print("Response: \(value)")
        
    case .failure(let error):
        print("Error: \(error)")
    }
}
*/
