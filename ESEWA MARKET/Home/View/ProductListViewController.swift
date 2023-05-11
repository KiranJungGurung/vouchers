//
//  ProductListViewController.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 10/05/2023.
//
/*
 
 
import UIKit

class ProductListViewController: UIViewController {
    
    private var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        
        
    
    }
    
}

extension ProductListViewController {
    
    func configuration() {
        initViewModel()
        observeEvent()
        
    }
    
    func initViewModel() {
        viewModel.fetchProduct()
        
        
    }
    
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
        guard let self else { return }
            
            switch event {
            case.loading: break
                print("Product loading")
            case.stopLoading: break
                print("Stop loading")
            case.dataLoaded:
                print("Data loaded")
                print(self.viewModel.products)
            case.error(let error):
                print(error)
            }
        }
    }
}
*/

import UIKit
import Alamofire
import SwiftyJSON

class ProductListViewController: UIViewController {
    
    var products: Product?

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let url = "https://fakestoreapi.com/products"

    
        
        print("\(products)")
    }
    
}
