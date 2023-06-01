

//  PopularBrandTableViewCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 28/04/2023.

import UIKit

class PopularBrandTableViewCell: UITableViewCell {
    
    private let cellReuseIdentifier = "PopularBrandTableViewCell"
    
    var model : [FeaturedProduct]?
    var productClicked: ((FeaturedProduct) -> ())?
    var addItemsToCart: ((FeaturedProduct) -> Void)?
    var addToWishList: ((FeaturedProduct) -> Void)?
    
    lazy var brandCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()
    
    static let reuseIdentifier = "PopularBrandTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        contentView.addSubview(brandCollectionView)
        
        // add datasource and delegate protocol
        brandCollectionView.delegate = self
        brandCollectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            brandCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            brandCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            brandCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            brandCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            brandCollectionView.heightAnchor.constraint(equalToConstant: 300),
           ])
        
        brandCollectionView.register(FeaturedCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
    }
 
    func configure(model: [FeaturedProduct]) {
        self.model = model
        brandCollectionView.reloadData()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension PopularBrandTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! FeaturedCell
        if let item = model?[indexPath.row] {
            cell.configure(with: item)
            
            cell.addItemsToCart = { [weak self] item in
                self?.addItemsToCart?(item)
                
            cell.addToWishList = { [weak self] item in
                self?.addToWishList?(item)
                }
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let item = model?[indexPath.row]
            if let item = item {
                self.productClicked?(item)
            }
        }
}
extension PopularBrandTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 300)
    }
}







