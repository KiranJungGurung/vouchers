// ProductDetailPresenter
//
//  ProductDetailPresenter.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 05/05/2023.
//
import Foundation
import UIKit

/*
protocol ProductDetailProtocolDelegate: NSObject {
    func displayProductDetailItems(model: [ProductDetail], productImage: [ProductImage], productInfo: [ProductInfo], productDescription: [ProductDescription], productCalculation: [ProductCalculation])
}


class ProductDetailPresenter {
    let sections: [ProductDetail] = [
        ProductDetail(section: Section(sectionName: "ProductImage")),
        ProductDetail(section: Section(sectionName: "ProductInfo")),
        ProductDetail(section: Section(sectionName: "Description")),
        ProductDetail(section: Section(sectionName: "ProductCalculation")),
    ]
    
    let productImage: [ProductImage] = [ProductImage(image: UIImage(named: "jacket"))]
    
    let productInfo: [ProductInfo] = [ProductInfo(productName: "Jacket In Nylong",price: 2500.00)]
    
    let productDescription: [ProductDescription] = [
        ProductDescription(productCheckMark: UIImage(systemName: "checkmark.circle"), productDesc: "Approx. model measurements: height:5'10, bust:31-1/2, waist: 24"),
        ProductDescription(productCheckMark: UIImage(systemName: "checkmark.circle"), productDesc: "V-neck"),
        ProductDescription(productCheckMark: UIImage(systemName: "checkmark.circle"), productDesc: "Created for Macy's")
    ]
    
    let productCalculation: [ProductCalculation] = [ProductCalculation(productName: "Jacket In Nylon - celene", totalPrice: 2500.00)]
    
    
    weak var delegate: ProductDetailProtocolDelegate?
    weak var view: ProductDetailViewController?

    init(delegate: ProductDetailProtocolDelegate?, view: ProductDetailViewController?) {
        self.delegate = delegate
        self.view = view
           
    }

    func updateView() {
        self.delegate?.displayProductDetailItems(model: sections, productImage: productImage, productInfo: productInfo, productDescription: productDescription, productCalculation: productCalculation)
        
           
       }
}


    

*/

protocol ProductDetailProtocolDelegate: NSObject {
    func displayProductList(model: [ProductDetail])
}

class ProductDetailPresenter {
    
    var productDetail = [ProductDetail(productImages: UIImage(named: "hoddie"), productName: "Jacket In Nylon", price: 2500, discountpriceLabel: 500, productDescription: "V-neck")]

    var delegate: ProductDetailProtocolDelegate?
    weak var view: ProductDetailViewController?

    init(delegate: ProductDetailProtocolDelegate, view: ProductDetailViewController) {
        self.delegate = delegate
        self.view = view
    }
    

    func updateView() {
        
        self.delegate?.displayProductList(model: productDetail)
        
        
        
        
        
        
    }
}
