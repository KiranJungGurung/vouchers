
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
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 20
        return collectionView
    }()
    
    static let reuseIdentifier = "ShopBannerTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
        contentView.addSubview(homeCollectionView)
        configurePageControl()
        setupConstraints()
        
        // add datasource and delegate protocol
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }
    func configurePageControl() {
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .green
        contentView.addSubview(pageControl)
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let visibleCells = homeCollectionView.visibleCells
        guard let firstVisibleCell = visibleCells.first else { return }
        let visibleIndex = homeCollectionView.indexPath(for: firstVisibleCell)?.item ?? 0
        pageControl.currentPage = visibleIndex
    }
    
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            homeCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            homeCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            homeCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            homeCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            homeCollectionView.heightAnchor.constraint(equalToConstant: 190),
            
            
            // pin pagecontrol to homeCollectionView
//            pageControl.topAnchor.constraint(equalTo: homeCollectionView.bottomAnchor, constant: -4),
//            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            
            pageControl.topAnchor.constraint(equalTo: homeCollectionView.bottomAnchor),
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
        
        homeCollectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ShopBannerTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
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




