
//  HotDealsCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 27/04/2023.
//
import Kingfisher
import UIKit

class HotDealsCell: UICollectionViewCell {
    
    static let identifier = "HotDealsCell"
    
   lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 10
        containerView.backgroundColor = .white
        containerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        containerView.layer.shadowOpacity = 0.4
        containerView.layer.shadowOffset = .zero
        return containerView
    }()
    
    lazy var hotDealsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return imageView
    }()
    
    lazy var productTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
     lazy var productSubTitleLabel: UILabel = {
        let subLabel = UILabel()
        subLabel.textColor = .gray
        subLabel.font = .systemFont(ofSize: 13, weight: .medium)
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.textAlignment = .left
        return subLabel
    }()
    
     lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = UIFont.systemFont(ofSize: 16)
        priceLabel.textAlignment = .left
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.textColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        return priceLabel
    }()
    
    lazy var likeButton: UIButton = {
        let likeButton = UIButton()
        likeButton.contentMode = .scaleAspectFill
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.tintColor = .gray
        return likeButton
    }()
    
    private let addContainerView: UIView = {
        let addView = UIView()
        addView.translatesAutoresizingMaskIntoConstraints = false
        addView.backgroundColor  = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        addView.layer.cornerRadius = 9
        addView.layer.maskedCorners = [.layerMinXMinYCorner]
        return addView
    }()
    
    private let addButton: UIButton = {
        let addButton = UIButton()
        addButton.contentMode = .scaleAspectFit
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.tintColor = .white
        addButton.isUserInteractionEnabled = true
        //            addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return addButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 14
        
        contentView.addSubview(hotDealsImageView)
        contentView.addSubview(containerView)
        containerView.addSubview(productTitleLabel)
        containerView.addSubview(productSubTitleLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(likeButton)
        containerView.addSubview(addContainerView)
        addContainerView.addSubview(addButton)

        NSLayoutConstraint.activate([
            
            hotDealsImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            hotDealsImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            hotDealsImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
            hotDealsImageView.heightAnchor.constraint(equalToConstant: 160),
        
            containerView.topAnchor.constraint(equalTo: hotDealsImageView.bottomAnchor, constant: 16),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            productTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            productTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            productTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            productSubTitleLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor, constant: 8),
            productSubTitleLabel.leadingAnchor.constraint(equalTo: productTitleLabel.leadingAnchor, constant: 0),
            productTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            priceLabel.topAnchor.constraint(equalTo: productSubTitleLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: productSubTitleLabel.leadingAnchor, constant: 0),
            priceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            priceLabel.heightAnchor.constraint(equalToConstant: 17),
            
            likeButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4),
            likeButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -110),
            likeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            likeButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            likeButton.widthAnchor.constraint(equalToConstant: 25),
            likeButton.heightAnchor.constraint(equalToConstant: 25),
            
            addContainerView.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: -20),
            addContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            addContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            addContainerView.widthAnchor.constraint(equalToConstant: 25),
            addContainerView.heightAnchor.constraint(equalToConstant: 35),
            
            addButton.topAnchor.constraint(equalTo: addContainerView.topAnchor, constant: 10),
            addButton.leadingAnchor.constraint(equalTo: addContainerView.leadingAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: addContainerView.trailingAnchor, constant: -8),
            addButton.bottomAnchor.constraint(equalTo: addContainerView.bottomAnchor, constant: -8),
            addButton.widthAnchor.constraint(equalToConstant: 40),
            addButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: FeaturedProduct) {
        if let url = URL(string: model.image ?? "") {
            hotDealsImageView.kf.setImage(with: url)
           }
        productTitleLabel.text = model.title
        productSubTitleLabel.text = model.category
        priceLabel.text = "Rs.\(model.price ?? 1)"
    } 
}

