//
//  HotDealsOfTheTableViewCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 27/04/2023.
//

import UIKit

class HotDealsOfTheTableViewCell: UITableViewCell {

    private let cellReuseIdentifier = "HotDealsOfTheTableViewCell"
    
    private let hotDealsCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.backgroundColor = .white
            return collectionView
        
        }()
    
    static let reuseIdentifier = "HotDealsOfTheTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        contentView.addSubview(hotDealsCollectionView)
        

        
        // add datasource and delegate protocol
        
        hotDealsCollectionView.delegate = self
        hotDealsCollectionView.dataSource = self
        
        
        NSLayoutConstraint.activate([
              hotDealsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
               hotDealsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
               hotDealsCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
               hotDealsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
               hotDealsCollectionView.heightAnchor.constraint(equalToConstant: 170),
               
               
           ])
        
        hotDealsCollectionView.register(HotDealsCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)

    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    
    
}
extension HotDealsOfTheTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! HotDealsCell
        return cell
    }
    
}


extension HotDealsOfTheTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 200)
     }
    
}
