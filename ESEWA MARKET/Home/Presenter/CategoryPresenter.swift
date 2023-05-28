//
//  CategoryPresenter.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 28/05/2023.
//

import Foundation
import UIKit

protocol CategoryProtocolDelegate: AnyObject {
    func displayCategory(model: [Categories])
    
}

class CategoryPresenter {
    
    var categories = [Categories(categoryImage: UIImage(named: "iphonec"), categoryName: "mobile"),
                      Categories(categoryImage: UIImage(named: "j"), categoryName: "jewelery"),
                      Categories(categoryImage: UIImage(named: "fashion"), categoryName: "men's cloth"),
                      Categories(categoryImage: UIImage(named: "womencloth"), categoryName: "women's cloth"),
]

    var delegate: CategoryProtocolDelegate?
    weak var view: HomeViewController?

    init(delegate: CategoryProtocolDelegate, view: HomeViewController) {
        self.delegate = delegate
        self.view = view
    }
    
    func updateView() {
        self.delegate?.displayCategory(model: categories)
        
    }
}

