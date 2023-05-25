////
////  FooterCell.swift
////  ESEWA MARKET
////
////  Created by Kiran Gurung on 03/05/2023.
////
//
//import UIKit
//
//class FooterCell: UITableViewCell {
//    
//    private let identifier = "FooterCell"
//
//    // MARK: - Add Custom FooterView
//    
//    var footerView: UIView = {
//        let myfooterView = UIView()
//        myfooterView.translatesAutoresizingMaskIntoConstraints = false
//        myfooterView.backgroundColor = .white
//        return myfooterView
//    }()
//    
//    var checkOutTotal: UILabel = {
//        let total = UILabel()
//        total.translatesAutoresizingMaskIntoConstraints = false
//        total.textAlignment = .left
//        total.font = .systemFont(ofSize: 16, weight: .bold)
//        total.textColor = .gray
//        return total
//    }()
//    
//    var totalPriceLabel: UILabel = {
//        let totalPrice = UILabel()
//        totalPrice.translatesAutoresizingMaskIntoConstraints = false
//        totalPrice.textAlignment = .left
//        totalPrice.font = .systemFont(ofSize: 18, weight: .medium)
//        totalPrice.textColor = .black
//        return totalPrice
//    }()
//    
//    var checkOutButton: UIButton = {
//        let checkOutButton = UIButton()
//        checkOutButton.translatesAutoresizingMaskIntoConstraints = false
//        checkOutButton.setTitle("ADD TO CART", for: .normal)
//        checkOutButton.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
//        checkOutButton.layer.cornerRadius = 16
//        checkOutButton.layer.masksToBounds = true
//        return checkOutButton
//    }()
//    
//    static let reuseIdentifier = "FooterCell"
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        contentView.backgroundColor = .clear
//        contentView.addSubview(footerView)
//        footerView.addSubview(checkOutTotal)
//        footerView.addSubview(totalPriceLabel)
//        footerView.addSubview(checkOutButton)
//        
//    //MARK: - ADD CONSTRAINTS INTO DESCRIPTION CONTAINERVIEW
//        
//        NSLayoutConstraint.activate([
//            footerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
//            footerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
//            footerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
//            footerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
//            footerView.heightAnchor.constraint(equalToConstant: 100),
//          
//            checkOutTotal.topAnchor.constraint(equalTo: self.footerView.topAnchor, constant: 8),
//            checkOutTotal.leadingAnchor.constraint(equalTo: self.footerView.leadingAnchor, constant:8),
//            checkOutTotal.trailingAnchor.constraint(equalTo: self.footerView.trailingAnchor, constant: -8),
//            
//            // totalPriceLabel
//            totalPriceLabel.topAnchor.constraint(equalTo: checkOutTotal.bottomAnchor),
//            totalPriceLabel.leadingAnchor.constraint(equalTo: checkOutTotal.leadingAnchor),
//            totalPriceLabel.heightAnchor.constraint(equalToConstant: 30),
//            
//            // pin Checkout button
//            checkOutButton.topAnchor.constraint(equalTo: self.footerView.topAnchor, constant: 16),
//            checkOutTotal.trailingAnchor.constraint(equalTo: self.footerView.trailingAnchor, constant: 16),
//            checkOutButton.trailingAnchor.constraint(equalTo: self.footerView.trailingAnchor, constant: -16),
//            checkOutButton.widthAnchor.constraint(equalToConstant: 170),
//            checkOutButton.heightAnchor.constraint(equalToConstant: 40),
//        ])
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    func configure(with model: ProductDetail) {
//        checkOutTotal.text = model.productName
//        totalPriceLabel.text = "\(model.price ?? 00)"
//
//      }
//}
//
