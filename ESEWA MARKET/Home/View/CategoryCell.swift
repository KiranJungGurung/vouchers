
//  CategoryCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 26/04/2023.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let identifier = "CategoryCell"

    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "iphone.rear.camera")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemFill
        imageView.tintColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 14
        return imageView
        
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Mobile"
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 14
        contentView.addSubview(categoryImageView)
        contentView.addSubview(categoryLabel)
        
        NSLayoutConstraint.activate([
            categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            categoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            categoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            categoryImageView.heightAnchor.constraint(equalToConstant: 70),
            categoryLabel.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 10),
            categoryLabel.heightAnchor.constraint(equalToConstant: 20),
            categoryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
}
    


