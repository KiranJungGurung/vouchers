//
//  PromotionBannerTableViewCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 27/04/2023.
//

import UIKit

class PromotionBannerTableViewCell: UITableViewCell, UICollectionViewDelegate {
 
    private let cellReuseIdentifier = "PromotionBannerTableViewCell"
//    private var list: [BannerModel]?

   
    // Add collectionView
    private let BannerCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: 100, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        collectionView.collectionViewLayout = layout
        return collectionView
        
       
        
    }()
    
    
    
    static let reuseIdentifier = "PromotionBannerTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        contentView.addSubview(BannerCollectionView)
        
        // add datasource and delegate protocol
        
        BannerCollectionView.delegate = self
        BannerCollectionView.dataSource = self
        
        NSLayoutConstraint.activate([
                BannerCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                BannerCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                BannerCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
                BannerCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                BannerCollectionView.heightAnchor.constraint(equalToConstant: 800),
               
               
            ])
        
        BannerCollectionView.register(PromotionBannerCell.self, forCellWithReuseIdentifier: PromotionBannerCell.identifier)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
extension PromotionBannerTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PromotionBannerTableViewCell", for: indexPath) as! PromotionBannerCell
        cell.setupCollectionCell(with: "banner\(indexPath.row + 1)")
        return cell
    }
    
}


extension PromotionBannerTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 300)
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
