//
//  PromotionBannerCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 27/04/2023.
//

import UIKit

class PromotionBannerCell: UICollectionViewCell {
    
    static let identifier = "PromotionBannerCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ecommerce")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30
        return imageView
    
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        
        NSLayoutConstraint.activate([
                 imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                 imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                 imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                 imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
                 imageView.heightAnchor.constraint(equalToConstant: 800)
             ])
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupCollectionCell(with image: String) {
        imageView.image = UIImage(named: image)
    }
}
