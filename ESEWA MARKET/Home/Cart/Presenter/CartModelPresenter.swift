//
//  CartPresenter.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 05/05/2023.
//

import UIKit

protocol AddItemToCartProtocol: AnyObject {
    func displayItemList(model: [AddCartItemModel])

}
class AddCartItemPresenter {
    var itemList: [AddCartItemModel] = [AddCartItemModel(itemName: "Iphone", itemDescription: "This is my iphone", itemCount: 1, itemPrice: 2000.0),AddCartItemModel(itemName: "Airpods", itemDescription: "This is my airpods", itemCount: 1, itemPrice: 1000.0)]
    
//    var totalPrice = itemCount * itemPrice
    
    
    var delegate: AddItemToCartProtocol?
    
    // weak var view: SecondPageViewController?
    
    init(delegate: AddItemToCartProtocol) {
        self.delegate = delegate
    }
    
    func populateTableView() {
        self.delegate?.displayItemList(model: itemList)
    }
    
}

//import Alamofire
//import SwiftyJSON
//
//class CartPresenter {
//    func fetchCarts() {
//        AF.request("https://fakestoreapi.com/carts").responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                var cartsArray: [Cart] = []
//                let cartsJSON = json.arrayValue
//                for cartJSON in cartsJSON {
//                    let cart = Cart(json: cartJSON)
//                    cartsArray.append(cart)
//                }
//                // Pass the array of carts to the view
//                // or delegate method to display the data
//                // on the screen.
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//}

