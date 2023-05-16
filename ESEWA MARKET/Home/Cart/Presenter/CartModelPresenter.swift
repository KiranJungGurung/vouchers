////
//  CartPresenter.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 05/05/2023.
//

import UIKit

protocol AddItemToCartProtocol: NSObject {
    func displayCartItemList(model: [AddCartItemModel])

}
class AddCartItemPresenter {
    var cartItemsList: [AddCartItemModel] = [
        
        AddCartItemModel(itemImage: UIImage(named: "inductionStove"),itemName: "Induction Stove", itemDescription: "IN STOCK - BALTRA", itemCount: 1, itemPrice: 3987.0),
        
        AddCartItemModel(itemImage: UIImage(named: "nike"),itemName: "Nike Air Monrch", itemDescription: "IN STOCK - NIKE", itemCount: 1, itemPrice: 8200.0),
        
        AddCartItemModel(itemImage: UIImage(named: "Oppo"),itemName: "Oppo A74 (6GB)", itemDescription: "IN STOCK - OPPO", itemCount: 1, itemPrice: 27_800.0)
        
    ]
    
    var delegate: AddItemToCartProtocol?
    weak var view: CartViewController?
    
    init(delegate: AddItemToCartProtocol, view: CartViewController) {
        self.delegate = delegate
        self.view = view
    }
    
    func updateView() {
        self.delegate?.displayCartItemList(model: cartItemsList)
    }
}


    


/*

import Alamofire
import SwiftyJSON

class CartPresenter {
    func fetchCarts() {
        AF.request("https://fakestoreapi.com/carts").responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                var cartsArray: [Cart] = []
                let cartsJSON = json.arrayValue
                for cartJSON in cartsJSON {
                    let cart = Cart(json: cartJSON)
                    cartsArray.append(cart)
                }
                // Pass the array of carts to the view
                // or delegate method to display the data
                // on the screen.
            case .failure(let error):
                print(error)
            }
        }
    }
}
*/
