//
//  CustomCartableViewCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 18/04/2023.
//
import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "CustomCartableViewCell"
    var countChanged: ((Double)-> Void)?
//    var totalPrice: ((Int)-> Void)?
    
    var model: AddCartItemModel?
    
    var priceUpdated: ((Double) -> ())?

    var quantity = 1
    var productPrice =  2000.00


    // MARK: - Add ContainerView
    
    let itemContainerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 16
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowRadius = 10
        containerView.layer.shadowOpacity = 0.4
        containerView.layer.shadowOffset = .zero
        containerView.backgroundColor = .systemGray6
        return containerView
        
    }()
    
    let itemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    let itemName: UILabel = {
        let itemLabel = UILabel()
        itemLabel.textColor = .black
        itemLabel.font = .systemFont(ofSize: 17, weight: .bold)
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        itemLabel.textAlignment = .left
        return itemLabel
    }()
    
    let itemDescription: UILabel = {
        let desc = UILabel()
        desc.textColor = .gray
        desc.font = .systemFont(ofSize: 10, weight: .medium)
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.textAlignment = .left
        return desc
    }()
    
    let itemPrice: UILabel = {
        let price = UILabel()
        price.font = UIFont.systemFont(ofSize: 16)
        price.textAlignment = .left
        price.translatesAutoresizingMaskIntoConstraints = false
        price.textColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        return price
        
    }()
    
    
    // MARK: - Add CountView
    
    let itemCountView: UIView = {
        let countView = UIView()
        countView.translatesAutoresizingMaskIntoConstraints = false
        countView.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        countView.layer.cornerRadius = 16
        countView.layer.maskedCorners = [.layerMaxXMaxYCorner,
                                         .layerMinXMinYCorner, .layerMaxXMinYCorner]
        return countView
        
    }()
    
    let itemSubButton: UIButton = {
        let subButton = UIButton()
        subButton.contentMode = .scaleAspectFit
        subButton.setImage(UIImage(systemName: "minus"), for: .normal)
        subButton.translatesAutoresizingMaskIntoConstraints = false
        subButton.tintColor = .white
        subButton.isUserInteractionEnabled = true
        return subButton
    }()
    
    let itemCountLabel: UILabel = {
        let count = UILabel()
        count.font = UIFont.systemFont(ofSize: 14)
        count.textAlignment = .center
        count.translatesAutoresizingMaskIntoConstraints = false
        count.textColor = .white
        return count
    }()
    
    let itemAddButton: UIButton = {
        let addButton = UIButton()
        addButton.contentMode = .scaleAspectFit
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.tintColor = .white
        addButton.isUserInteractionEnabled = true
        return addButton
        
    }()
    
//    var quantity: Int = 0 {
//          didSet {
//              itemCountLabel.text = "\(quantity)"
//              itemSubButton.isEnabled = (quantity > 0)
//              totalPrice?(quantity)
//          }
//      }
//

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear//.systemBackground
        
        contentView.addSubview(itemContainerView)
        contentView.addSubview(itemImage)
        contentView.addSubview(itemName)
        contentView.addSubview(itemDescription)
        contentView.addSubview(itemPrice)
        
        contentView.addSubview(itemCountView)
        contentView.addSubview(itemSubButton)
        contentView.addSubview(itemCountLabel)
        contentView.addSubview(itemAddButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
//    @objc func subButtonTapped() {
//            if quantity > 0 {
//                quantity -= 1
//                let price = Double(itemPrice.text!.replacingOccurrences(of: "Rs", with: "")) ?? 0.0
//                let updatedPrice = price * Double(quantity)
//
//                priceUpdated?(updatedPrice)
//            }
//        }
        
//        @objc func addButtonTapped() {
//            if quantity >= 0 {
//                quantity += 1
//                let price = Double(itemPrice.text!.replacingOccurrences(of: "Rs", with: "")) ?? 0.0
//                let updatedPrice = price * Double(quantity)
//
//                priceUpdated?(updatedPrice)
//            }
//        }
    
    func configure(with model: AddCartItemModel) {
        itemImage.image = model.itemImage
        itemName.text = model.itemName
        itemDescription.text = model.itemDescription
        itemPrice.text = "Rs\(model.itemPrice ?? 00.00)"
        itemCountLabel.text = "Rs\(model.itemCount ?? 1)"
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    
    }
    
    private func setupViews() {
        
        // MARK: - Set Constraints to ContainerView
        // pin the container view
        
        NSLayoutConstraint.activate([
            
            itemContainerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            itemContainerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
            itemContainerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            itemContainerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            
            // pin image view inside containerview
            itemImage.topAnchor.constraint(equalTo: self.itemContainerView.topAnchor, constant: 8),
            itemImage.leadingAnchor.constraint(equalTo: self.itemContainerView.leadingAnchor, constant: 16),
            itemImage.bottomAnchor.constraint(equalTo: self.itemContainerView.bottomAnchor, constant: -8),
            itemImage.widthAnchor.constraint(equalToConstant: 100),
            itemImage.heightAnchor.constraint(equalToConstant: 100),
            
            // pin title label
            itemName.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 8),
            itemName.heightAnchor.constraint(equalToConstant: 80),
            
            // pin subtitle label
            itemDescription.leadingAnchor.constraint(equalTo: itemName.leadingAnchor),
            itemDescription.heightAnchor.constraint(equalToConstant: 120),
            
            // pin price label
            itemPrice.leadingAnchor.constraint(equalTo: itemDescription.leadingAnchor),
            itemPrice.heightAnchor.constraint(equalToConstant: 230),
            
            
            // MARK: - Add Constraints to CounterView
            
            // pin CounterView:
            itemCountView.topAnchor.constraint(equalTo: self.itemContainerView.topAnchor, constant: 0),
            itemCountView.leadingAnchor.constraint(equalTo: self.itemContainerView.trailingAnchor, constant: -38),
            itemCountView.bottomAnchor.constraint(equalTo: self.itemContainerView.bottomAnchor, constant: 0),
            itemCountView.widthAnchor.constraint(equalToConstant: 38),
            
            // pin mySubButton in myCountView
            itemSubButton.topAnchor.constraint(equalTo: itemCountView.topAnchor, constant: 10),
            itemSubButton.leadingAnchor.constraint(equalTo: itemCountView.leadingAnchor, constant: 10),
            itemSubButton.trailingAnchor.constraint(equalTo: itemCountView.trailingAnchor, constant: -10),
            itemSubButton.heightAnchor.constraint(equalToConstant: 20),
            
            // pin counter in myCountView
            itemCountLabel.leadingAnchor.constraint(equalTo: itemCountView.leadingAnchor, constant: 10),
            itemCountLabel.trailingAnchor.constraint(equalTo: itemCountView.trailingAnchor, constant: -10),
            itemCountLabel.heightAnchor.constraint(equalToConstant: 155),
            
            //pin addbutton
            itemAddButton.leadingAnchor.constraint(equalTo: itemSubButton.trailingAnchor, constant: -14),
            itemAddButton.trailingAnchor.constraint(equalTo: itemSubButton.leadingAnchor, constant:  14),
            itemAddButton.bottomAnchor.constraint(equalTo: itemCountView.bottomAnchor, constant: -8),
            itemAddButton.widthAnchor.constraint(equalToConstant: 10)
        ])
        
        itemAddButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        itemSubButton.addTarget(self, action: #selector(subButtonTapped), for: .touchUpInside)
    }
    func calculatePrice(quantity: Int) -> Double {
        let productQuantityLabel = productPrice * Double(quantity)
        return productQuantityLabel
        
    }
    
    func updatePriceLabel() {
        let updatedPrice = calculatePrice(quantity: quantity)
        itemPrice.text = "Rs\(updatedPrice)"
        countChanged?(Double(updatedPrice))
    }
    
    @objc func addButtonTapped() {
        quantity += 1
        updatePriceLabel()
        updateCount()

    }
    
    private func updateCount() {
        itemCountLabel.text = "\(quantity)"
    }

    @objc func subButtonTapped() {
        if quantity > 1 {
            quantity -= 1
            updatePriceLabel()
            updateCount()
        }
    }

}




