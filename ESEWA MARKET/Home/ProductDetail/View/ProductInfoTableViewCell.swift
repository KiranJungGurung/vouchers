//  ProductInfoTableViewCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 30/04/2023.
//

import UIKit

class ProductInfoTableViewCell: UITableViewCell {
    
    private let identifier = "ProductInfoTableViewCell"
    

    var productContainerView: UIView = {
        let myContainerView = UIView()
        myContainerView.translatesAutoresizingMaskIntoConstraints = false
        myContainerView.backgroundColor = .white
        return myContainerView
        
    }()
    
    var productTitleLabel: UILabel = {
        let productTitle = UILabel()
//        productTitle.text = "Jacket In Nylon"
        productTitle.translatesAutoresizingMaskIntoConstraints = false
        productTitle.textAlignment = .left
        productTitle.font = .systemFont(ofSize: 18, weight: .bold)
        productTitle.textColor = .black
        return productTitle
    }()
    
    var priceLabel: UILabel = {
        let pricelbl = UILabel()
//        pricelbl.text = "Rs.2500.00"
        pricelbl.translatesAutoresizingMaskIntoConstraints = false
        pricelbl.textAlignment = .left
        pricelbl.font = .systemFont(ofSize: 26, weight: .medium)
        pricelbl.textColor = .black
        return pricelbl
    }()
    
    var priceCrossedLabel: UILabel = {
        let crossedPricelbl = UILabel()
        crossedPricelbl.translatesAutoresizingMaskIntoConstraints = false
        crossedPricelbl.textAlignment = .left
        crossedPricelbl.font = .systemFont(ofSize: 16, weight: .medium)
        crossedPricelbl.textColor = .gray
        let attributedText = NSAttributedString(
            string: "Rs.500.00",
            attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        crossedPricelbl.attributedText = attributedText
        return crossedPricelbl
    }()
    
    

    static let reuseIdentifier = "ProductInfoTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        
        contentView.addSubview(productContainerView)
        productContainerView.addSubview(productTitleLabel)
        productContainerView.addSubview(priceLabel)
        productContainerView.addSubview(priceCrossedLabel)
        
        
        NSLayoutConstraint.activate([
            productContainerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            productContainerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            productContainerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            productContainerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            productContainerView.heightAnchor.constraint(equalToConstant: 120),
            
            productTitleLabel.topAnchor.constraint(equalTo: productContainerView.topAnchor, constant: 10),
            productTitleLabel.leadingAnchor.constraint(equalTo: productContainerView.leadingAnchor, constant: 10),
            productTitleLabel.trailingAnchor.constraint(equalTo: productContainerView.trailingAnchor, constant: -10),
            
            priceLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor, constant: -10),
            priceLabel.leadingAnchor.constraint(equalTo: productContainerView.leadingAnchor, constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: productContainerView.trailingAnchor, constant: -10),
            priceLabel.bottomAnchor.constraint(equalTo: productContainerView.bottomAnchor, constant: -50),
            
            priceCrossedLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: -16),
            priceCrossedLabel.centerYAnchor.constraint(equalTo: productContainerView.centerYAnchor, constant: 16),
            priceCrossedLabel.centerXAnchor.constraint(equalTo: productContainerView.centerXAnchor, constant: 16),
            priceCrossedLabel.bottomAnchor.constraint(equalTo: productContainerView.bottomAnchor, constant: -16),
            
            
        ])
        
     
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: ProductDetail) {
        productTitleLabel.text = model.productName
        priceLabel.text = "\(model.price ?? 00)"
        priceCrossedLabel.text = "\(model.discountpriceLabel ?? 00)"
        
      }
    
}
