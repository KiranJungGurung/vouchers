
//  BannerCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 25/04/2023.
//
import UIKit

class BannerCell: UICollectionViewCell {
    
    //    private let imageNames = ["eBanner", "banner2", "ecommerce"]
    
    
    static let identifier = "BannerCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ebanner")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 14
        return imageView
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    func setupCollectionCell(with image: String) {
        imageView.image = UIImage(named: image)
    }
}
