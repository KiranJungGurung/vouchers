
//  PhotoTableViewCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 30/04/2023.
//
import Kingfisher
import UIKit

class PhotoTableViewCell: UITableViewCell {
    private let identifier = "PhotoTableViewCell"
        
    lazy var photoContainerView: UIView = {
        let photoContainerView = UIView()
        photoContainerView.translatesAutoresizingMaskIntoConstraints = false
        return photoContainerView
    }()
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    static let reuseIdentifier = "PhotoTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        contentView.backgroundColor = .clear
        contentView.addSubview(photoContainerView)
        photoContainerView.addSubview(productImageView)
        
        NSLayoutConstraint.activate([
            photoContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoContainerView.heightAnchor.constraint(equalToConstant: 320),
            
            productImageView.topAnchor.constraint(equalTo: photoContainerView.topAnchor, constant: 4),
            productImageView.leadingAnchor.constraint(equalTo: photoContainerView.leadingAnchor, constant: 16),
            productImageView.trailingAnchor.constraint(equalTo: photoContainerView.trailingAnchor, constant: -16),
            productImageView.bottomAnchor.constraint(equalTo: photoContainerView.bottomAnchor, constant: 4)
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: FeaturedProduct) {
        if let url = URL(string: model.image ?? "") {
            productImageView.kf.setImage(with: url)
        }
    }
}


