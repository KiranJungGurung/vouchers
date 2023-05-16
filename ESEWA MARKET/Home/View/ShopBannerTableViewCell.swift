
//  ShopBannerTableViewCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 25/04/2023.
//

import UIKit

class ShopBannerTableViewCell: UITableViewCell, UICollectionViewDelegate {
    
    private let cellReuseIdentifier = "ShopBannerTableViewCell"
    
    let pageControl = UIPageControl()
    
    var model = [HotDealBanner]()


    // Add collectionView
    private let homeCollectionView: UICollectionView = {
        
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
    
    static let reuseIdentifier = "ShopBannerTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(homeCollectionView)
        
        
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = .black
        pageControl.currentPageIndicatorTintColor = .red
        contentView.addSubview(pageControl)
        
        
        // add datasource and delegate protocol
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            homeCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            homeCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            homeCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            homeCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            homeCollectionView.heightAnchor.constraint(equalToConstant: 150),
            
            
            // pin pagecontrol to homeCollectionView
            pageControl.topAnchor.constraint(equalTo: homeCollectionView.bottomAnchor),
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            
        ])
        
        homeCollectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ShopBannerTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        return cell
    }
    
}


extension ShopBannerTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}



