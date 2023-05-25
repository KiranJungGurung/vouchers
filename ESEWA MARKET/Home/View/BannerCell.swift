
/
//  BannerCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 25/04/2023.
//
import UIKit

class BannerCell: UICollectionViewCell {
    
    static let identifier = "BannerCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"ebanner")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 12
        return imageView
    
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    
        NSLayoutConstraint.activate([
                 imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                 imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:0),
                 imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
                 imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
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

