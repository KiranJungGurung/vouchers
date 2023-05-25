
//
//
//  DescriptionView.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 03/05/2023.
//

import UIKit

class DescriptionView: UITableViewCell {
    
    var containerView = UIView()
    
    let checkImage: UIImageView = {
        let checkImage = UIImageView()
        checkImage.image = UIImage(systemName: "checkmark.circle.fill")
        checkImage.contentMode = .scaleAspectFit
        checkImage.clipsToBounds = true
        checkImage.translatesAutoresizingMaskIntoConstraints = false
        checkImage.tintColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        return checkImage
    }()
    
    let descLabel: UILabel = {
        let desclbl = UILabel()
        desclbl.translatesAutoresizingMaskIntoConstraints = false
        desclbl.font = .systemFont(ofSize: 16, weight: .medium)
        desclbl.textColor = .black
        desclbl.numberOfLines = 2
        
        return desclbl
    }()
    
    static let reuseIdentifier = "DescriptionView"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
 
    func setupView() {
        self.selectionStyle = .none
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(containerView)
        
        self.addSubview(checkImage)
        self.addSubview(descLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            
            checkImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            checkImage.widthAnchor.constraint(equalToConstant: 24),
            checkImage.heightAnchor.constraint(equalToConstant: 24),
            checkImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0),
            
            descLabel.centerYAnchor.constraint(equalTo: checkImage.centerYAnchor, constant: 0),
            descLabel.leadingAnchor.constraint(equalTo: checkImage.trailingAnchor, constant: 4),
            descLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -4),
        ])
    
    }
    func configure(with model: FeaturedProduct) {
        descLabel.text = model.description
      }
    
}

