////
////  WishListTableViewCell.swift
////  ESEWA MARKET
////
////  Created by Kiran Gurung on 31/05/2023.
////
//
//import Kingfisher
//import UIKit
//
//class WishListTableViewCell: UITableViewCell {
//
//    private let cellReuseIdentifier = "WishListTableViewCell"
//    
//    var model: [FeaturedProduct]?
//
//    lazy var wishListCollectionView: UICollectionView = {
//            let layout = UICollectionViewFlowLayout()
//            layout.scrollDirection = .horizontal
//            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//            collectionView.translatesAutoresizingMaskIntoConstraints = false
//            collectionView.showsHorizontalScrollIndicator = false
//            collectionView.backgroundColor = .systemGray6
//            return collectionView
//        }()
//    
//    static let reuseIdentifier = "WishListTableViewCell"
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        contentView.backgroundColor = .clear
//        contentView.addSubview(wishListCollectionView)
//
//        // add datasource and delegate protocol
//        wishListCollectionView.delegate = self
//        wishListCollectionView.dataSource = self
//        
//        NSLayoutConstraint.activate([
//            wishListCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            wishListCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
//            wishListCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
//            wishListCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
//            wishListCollectionView.heightAnchor.constraint(equalToConstant: 300),
//           ])
//        
//        wishListCollectionView.register(WishListCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
//    }
//    func configure(model: [FeaturedProduct]) {
//        self.model = model
//        wishListCollectionView.reloadData()
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//extension WishListTableViewCell: UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return model?.count ?? 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! WishListCell
//        
////        if let item = model?[indexPath.row] {
//            cell.configure(with: item)
//        }
//        return cell
//    }
//}
//extension WishListTableViewCell: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 180, height: 300)
//    }
//}
//
//
//
