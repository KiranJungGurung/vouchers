
//
//  PhotoCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 30/04/2023.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    static let identifier = "PhotoCell"
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hoodie")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        return imageView

    
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(productImageView)
        contentView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
           
            productImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            productImageView.heightAnchor.constraint(equalToConstant: 300)
         ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupCollectionCell(with image: String) {
        productImageView.image = UIImage(named: image)
    }
}

