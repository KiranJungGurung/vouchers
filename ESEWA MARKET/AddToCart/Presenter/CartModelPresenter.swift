
//
//  CartPresenter.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 05/05/2023.
//

import Foundation
import UIKit

protocol AddItemToCartProtocol: AnyObject {
    func displayCartItemList(model: [AddCartItemModel])

}
class AddCartItemPresenter {
    
    var cartItemsList: [AddCartItemModel] = [
        
        AddCartItemModel(itemImage: UIImage(named: "inductionStove"),itemName: "Induction Stove", itemDescription: "IN STOCK - BALTRA", itemCount: 1, itemPrice: 3987.0),
        
        AddCartItemModel(itemImage: UIImage(named: "nike"),itemName: "Nike Air Monrch", itemDescription: "IN STOCK - NIKE", itemCount: 1, itemPrice: 8200.0),
        
        AddCartItemModel(itemImage: UIImage(named: "Oppo"),itemName: "Oppo A74 (6GB)", itemDescription: "IN STOCK - OPPO", itemCount: 1, itemPrice: 27_800.0),
        AddCartItemModel(itemImage: UIImage(named: "Oppo"),itemName: "Oppo A74 (6GB)", itemDescription: "IN STOCK - OPPO", itemCount: 1, itemPrice: 27_800.0),
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




