//
//  API.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 20/04/2023.

//import Alamofire
//import SwiftyJSON
//
//struct Product {
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
//
//class ProductAPI {
//    private let baseURL = "https://fakestoreapi.com"
//
//    func getProducts(completion: @escaping ([Product]) -> Void) {
//        let url = "\(baseURL)/products"
//
//        AF.request(url).responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                let products = json.arrayValue.map { Product(json: $0) }
//                completion(products)
//            case .failure(let error):
//                print("Error: \(error)")
//                completion([])
//            }
//        }
//    }
//}
