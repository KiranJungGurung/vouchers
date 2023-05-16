//  PhotoTableViewCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 30/04/2023.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    private let identifier = "PhotoTableViewCell"
            
    var photoContainerView: UIView = {
        let photoContainerView = UIView()
        photoContainerView.translatesAutoresizingMaskIntoConstraints = false
        return photoContainerView
    }()
    
    var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    static let reuseIdentifier = "PhotoTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        contentView.addSubview(photoContainerView)
        photoContainerView.addSubview(productImageView)
    

        NSLayoutConstraint.activate([
            photoContainerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            photoContainerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            photoContainerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            photoContainerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            photoContainerView.heightAnchor.constraint(equalToConstant: 320),
            
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
         ])
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: ProductDetail) {
        
        imageView?.image = model.productImages
        
    }
}

