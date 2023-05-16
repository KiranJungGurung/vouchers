
//  FeaturedCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 26/04/2023.
//
import Kingfisher
import UIKit

class FeaturedCell: UICollectionViewCell {
    
    static let identifier = "FeaturedCell"
    
    private let containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    private let featuredImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(named: "jacket")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imageView.backgroundColor = .white
        return imageView
    }()
    
    var productTitleLabel: UILabel = {
        let label = UILabel()
//        label.text = "50 T-shirt"
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
     var productSubTitleLabel: UILabel = {
        let subLabel = UILabel()
//        subLabel.text = "IN STOCK - 99 SHOP"
        subLabel.textColor = .gray
        subLabel.font = .systemFont(ofSize: 10, weight: .medium)
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.textAlignment = .left
        return subLabel
    }()
    
     var priceLabel: UILabel = {
        let priceLabel = UILabel()
//        priceLabel.text = "Rs.840.00"
        priceLabel.font = UIFont.systemFont(ofSize: 16)
        priceLabel.textAlignment = .left
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.textColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        return priceLabel
    }()
    
    private let likeButton: UIButton = {
        let likeButton = UIButton()
        likeButton.contentMode = .scaleAspectFill
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.tintColor = .gray
        return likeButton
    }()
    
    
    //need to make separate uiview and pin add button there
    
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
        contentView.backgroundColor = .systemFill
        contentView.layer.cornerRadius = 10
        
        contentView.addSubview(featuredImageView)
        contentView.addSubview(containerView)
        containerView.addSubview(productTitleLabel)
        containerView.addSubview(productSubTitleLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(likeButton)
        containerView.addSubview(addContainerView)
        addContainerView.addSubview(addButton)
        containerView.backgroundColor = .white
        NSLayoutConstraint.activate([
            
            featuredImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            featuredImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            featuredImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
            featuredImageView.heightAnchor.constraint(equalToConstant: 160),
            
            //
            
            containerView.topAnchor.constraint(equalTo: featuredImageView.bottomAnchor, constant: 16),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            productTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            productTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            productTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            
            productSubTitleLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor, constant: 10),
            productSubTitleLabel.leadingAnchor.constraint(equalTo: productTitleLabel.leadingAnchor, constant: 0),
            productTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            priceLabel.topAnchor.constraint(equalTo: productSubTitleLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: productSubTitleLabel.leadingAnchor, constant: 0),
            priceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
            likeButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            likeButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -110),
            likeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            likeButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            
            
            // pin addContainerView
            
            addContainerView.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: -20),
            addContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            addContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            addContainerView.widthAnchor.constraint(equalToConstant: 25),
            addContainerView.heightAnchor.constraint(equalToConstant: 35),
            
            addButton.topAnchor.constraint(equalTo: addContainerView.topAnchor, constant: 10),
            addButton.leadingAnchor.constraint(equalTo: addContainerView.leadingAnchor, constant: 10),
            addButton.trailingAnchor.constraint(equalTo: addContainerView.trailingAnchor, constant: -10),
            addButton.bottomAnchor.constraint(equalTo: addContainerView.bottomAnchor, constant: -10),
            addButton.widthAnchor.constraint(equalToConstant: 20),
            addButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
//    func setupViewWithData(model: EmbeddedEvents) {
//
//            if let url = URL(string: model.images?.first?.url ?? "") {
//                eventImageView.kf.setImage(with: url)
//            }
//
//            titleLabel.text = model.name
//            dateLabel.text = model.dates?.start?.localDate
//            locationLabel.text = model.embedded?.venues?.first?.name
//            priceLabel.text = String("$\(model.priceRanges?.first?.min ?? 0.0)")
//        }
    
    func configure(with model: FeaturedProduct) {
        
        if let url = URL(string: model.image ?? "") {
               featuredImageView.kf.setImage(with: url)
           }
//        if let url = URL(string: model.image?.first?.url ?? "") {
//            featuredImageView.kf.setImage(with: url)
//        }
        productTitleLabel.text = model.title
        productSubTitleLabel.text = model.category
        priceLabel.text = "Price: \(model.price ?? 1)"
    }
    
    
    
}

