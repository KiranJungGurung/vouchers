//
//  PopularBrandTableViewCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 28/04/2023.
//

import UIKit


class PopularBrandTableViewCell: UITableViewCell {

    private let cellReuseIdentifier = "PopularBrandTableViewCell"
    
    var model = [PopularBrand]()

    private let brandCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.backgroundColor = .white
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
            brandCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant:8),
            brandCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:8),
            brandCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            brandCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            brandCollectionView.heightAnchor.constraint(equalToConstant: 300),
               
           ])
        
        brandCollectionView.register(PopularBrandCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)

    }
    func configure(model: [PopularBrand]) {
            self.model = model
            brandCollectionView.reloadData()
        }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
extension PopularBrandTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! PopularBrandCell
        let item = model[indexPath.row]
        cell.productTitleLabel.text = item.productName
        cell.configure(with: item)
        return cell
    }
    
}


extension PopularBrandTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 300)
    }
}





