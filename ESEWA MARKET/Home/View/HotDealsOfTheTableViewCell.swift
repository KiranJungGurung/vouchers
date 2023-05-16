

//
//  HotDealsOfTheTableViewCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 26/04/2023.
//

import UIKit

class HotDealsTableViewCell: UITableViewCell {
    
    private let cellReuseIdentifier = "HotDealsTableViewCell"
    
    var model : [FeaturedProduct]?
    
//    var productClicked: ((FeaturedProduct) -> ())?
    
    
    private let HotDealsTableViewCell: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.backgroundColor = .white
            return collectionView
        
        }()
    
    static let reuseIdentifier = "HotDealsTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        contentView.addSubview(HotDealsTableViewCell)
        
        
        // add datasource and delegate protocol
        
        HotDealsTableViewCell.delegate = self
        HotDealsTableViewCell.dataSource = self
        
        
        NSLayoutConstraint.activate([
            HotDealsTableViewCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            HotDealsTableViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            HotDealsTableViewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            HotDealsTableViewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            HotDealsTableViewCell.heightAnchor.constraint(equalToConstant: 300),
           ])
        
        HotDealsTableViewCell.register(HotDealsCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)

    }
 
    func configure(model: [FeaturedProduct]) {
        self.model = model
        HotDealsTableViewCell.reloadData()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension HotDealsTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! HotDealsCell
        if let item = model?[indexPath.row] {
            cell.configure(with: item)
            
        }
        
//        let item = model[indexPath.row]
//        cell.configure(with: item)
        return cell
    }
    
    
}


extension HotDealsTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 300)
    }
}

