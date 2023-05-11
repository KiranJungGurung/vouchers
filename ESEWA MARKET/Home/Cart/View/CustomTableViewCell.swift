//
//  CustomCartableViewCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 18/04/2023.
//
import UIKit

//struct Cart {
//    var quanity: Int?
//    var productPrice: Double?
//    var itemCountLabel: Int?
//}


class CustomTableViewCell: UITableViewCell {
    
    
    static let identifier = "CustomCartableViewCell"
    
    var countChanged: ((Double)-> Void)?
    
    
    
    // MARK: - Add ContainerView
    
    private let itemContainerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 16
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowRadius = 10
        containerView.layer.shadowOpacity = 0.4
        containerView.layer.shadowOffset = .zero
        containerView.backgroundColor = .white
        return containerView
        
    }()
    
    private let itemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "jacket")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    private let itemName: UILabel = {
        let itemLabel = UILabel()
        //        itemLabel.text = "Jacket on Nylon"
        itemLabel.textColor = .black
        itemLabel.font = .systemFont(ofSize: 17, weight: .bold)
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        itemLabel.textAlignment = .left
        return itemLabel
    }()
    
    private let itemDescription: UILabel = {
        let desc = UILabel()
        //        desc.text = "Celeine"
        desc.textColor = .gray
        desc.font = .systemFont(ofSize: 10, weight: .medium)
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.textAlignment = .left
        return desc
    }()
    
    private let itemPrice: UILabel = {
        let price = UILabel()
        //        price.text = "Rs.19,500.00"
        price.font = UIFont.systemFont(ofSize: 16)
        price.textAlignment = .left
        price.translatesAutoresizingMaskIntoConstraints = false
        price.textColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        return price
        
    }()
    
    
    // MARK: - Add CountView
    
    private let itemCountView: UIView = {
        let countView = UIView()
        countView.translatesAutoresizingMaskIntoConstraints = false
        countView.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        countView.layer.cornerRadius = 16
        countView.layer.maskedCorners = [.layerMaxXMaxYCorner,
                                         .layerMinXMinYCorner, .layerMaxXMinYCorner]
        return countView
        
    }()
    
    private let itemSubButton: UIButton = {
        let subButton = UIButton()
        subButton.contentMode = .scaleAspectFit
        subButton.setImage(UIImage(systemName: "minus"), for: .normal)
        subButton.translatesAutoresizingMaskIntoConstraints = false
        subButton.tintColor = .white
        subButton.isUserInteractionEnabled = true
        return subButton
    }()
    
    private let itemCountLabel: UILabel = {
        let count = UILabel()
        //        count.text = "01"
        count.font = UIFont.systemFont(ofSize: 14)
        count.textAlignment = .center
        count.translatesAutoresizingMaskIntoConstraints = false
        count.textColor = .white
        return count
    }()
    
    private let itemAddButton: UIButton = {
        let addButton = UIButton()
        addButton.contentMode = .scaleAspectFit
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.tintColor = .white
        addButton.isUserInteractionEnabled = true
        return addButton
        
    }()
    
    //    var quantity = 1
    //    var productPrice =  19_500.00
    
    
    
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
//        itemAddButton.addTarget(self, action: #selector(addButtonTapped(_:)), for: .touchUpInside)
//        itemSubButton.addTarget(self, action: #selector(subButtonTapped(_:)), for: .touchUpInside)
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    func configure(with model: AddCartItemModel) {
        itemName.text = model.itemName
        itemDescription.text = model.itemDescription
        itemPrice.text = "\(model.itemPrice)"
        itemCountLabel.text = "\(model.itemCount)"
        
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
    }
}
    /*
//    func calculatePrice(quantity: Int) -> Double {
//        let productQuantityLabel = productPrice * Double(quantity)
//        return productQuantityLabel
//    }
    
    func updatePriceLabel() {
        let updatedPrice = calculatePrice(quantity: quantity)
        itemPrice.text = "$\(updatedPrice)"
        countChanged?(Double(updatedPrice))
    }

    @objc func addButtonTapped(_ sender: UIButton) {
        quantity += 1
        updatePriceLabel()
        updateCount()
    }
    
    private func updateCount() {
        itemCountLabel.text = "\(quantity)"
    }

    @objc func subButtonTapped(_ sender: UIButton) {
        if quantity > 1 {
            quantity -= 1
            updatePriceLabel()
        }
    }
    
    
}

*/
