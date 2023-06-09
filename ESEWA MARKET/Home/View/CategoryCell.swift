
//
//  CategoryCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 26/04/2023.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    
    static let identifier = "CategoriesCell"

    lazy var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemGray6
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 14
        return imageView
    }()
    
   lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 14
        contentView.addSubview(categoryImageView)
        contentView.addSubview(categoryLabel)
        
        NSLayoutConstraint.activate([
            categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            categoryImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            categoryImageView.heightAnchor.constraint(equalToConstant: 50),
            categoryImageView.widthAnchor.constraint(equalToConstant: 50),
    
            categoryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            categoryLabel.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant:8),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

//            categoryLabel.contentCompressionResistancePriority(for: )
//            categoryLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        ])
 
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    func configure(with model: Categories) {
        categoryImageView.image = model.categoryImage
        categoryLabel.text = model.categoryName
      
    }
    
}
    







