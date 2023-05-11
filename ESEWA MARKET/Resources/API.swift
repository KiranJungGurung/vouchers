//
//  API.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 20/04/2023.
//
//import Alamofire
//import SwiftyJSON


/*
protocol ProductProtocol:NSObject {
  func didReceiveResult(model: Product?)
}

class ProductAPI {
    
     let baseURL = "https:fakestoreapi.com"
    
//    func fetchProduct() {
//        getProducts { listOfFeaturedProducts in
//            self.delegate.didFetchedListOfProducts(with list: [featuredproducts])
//        }
    }

    func getProducts(completion: @escaping ([FeaturedProduct]) -> Void) {
        let url = "\(baseURL)/products"
        
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                
                let json = try! JSON(data: data)
                let arrayCount = json.array?.count ?? 0
                for i in 0..<arrayCount {
                    // ID
                    let id = json[i]["id"].string ?? "N/A"
                    print("ID: \(id)")
                    
                    // Employee Name
                    let employeeName = json[i]["employee_name"].string ?? "N/A"
                    print("Employee Name: \(employeeName)")
                    
                    // Employee Salary
                    let employeeSalary = json[i]["employee_salary"].string ?? "N/A"
                    print("Employee Salary: \(employeeSalary)")
                    
                    // Employee Age
                    let employeeAge = json[i]["employee_age"].string ?? "N/A"
                    print("Employee Age: \(employeeAge)")
                    
                    
                    // Save data using your Model
                    
                    // Reload data of TableView/CollectionView
                }
                let json = JSON(value)
                let arrayCount = json.arrayValue.map { FeaturedProduct(json: $0)}
                for i in 0..<arrayCount {
                    // ID
                    let id = json[i]["id"].string ?? "N/A"
                    print("ID: \(id)")
                    
                    // Employee Name
                    let employeeName = json[i]["employee_name"].string ?? "N/A"
                    print("Employee Name: \(employeeName)")
                    
                    // Employee Salary
                    let employeeSalary = json[i]["employee_salary"].string ?? "N/A"
                    print("Employee Salary: \(employeeSalary)")
                    
                    // Employee Age
                    let employeeAge = json[i]["employee_age"].string ?? "N/A"
                    print("Employee Age: \(employeeAge)")
                    
                    
                    // Save data using your Model
                    
                    // Reload data of TableView/CollectionView
                }
                let
                
                completion(products)
            case .failure(let error):
                print("Error: \(error)")
                completion([])
            }
        }
        .resume()
    }
}

*/


/*

import UIKit

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

typealias Handler = (Result<[Product], DataError>) ->Void

final class APIManager {
    static let shared = APIManager()
    private init() {}
    
    
    func fetchProducts(completion: @escaping Handler) {
        guard let url = URL(string: Constant.API.productURL) else {
            return
        }
 
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
                
            } catch {
                completion(.failure(.network(error)))
                
            }
        }
        .resume()
        
    }
    
}



