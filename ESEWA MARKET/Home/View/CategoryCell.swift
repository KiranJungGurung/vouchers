
//
//  CategoryCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 26/04/2023.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    
    static let identifier = "CategoriesCell"

    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemGray6
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 14
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.font = .systemFont(ofSize: 12, weight: .medium)
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
            categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            categoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            categoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            categoryImageView.heightAnchor.constraint(equalToConstant: 70),
            
            categoryLabel.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 10),
            categoryLabel.leadingAnchor.constraint(equalTo: categoryImageView.leadingAnchor, constant: 4),
            categoryLabel.trailingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: -4),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            categoryLabel.heightAnchor.constraint(equalToConstant: 20),
            categoryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
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
    







