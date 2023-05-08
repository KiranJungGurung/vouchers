//
//
//  HotDealsOfTheTableViewCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 27/04/2023.
//

import UIKit

class HotDealsTableViewCell: UITableViewCell {

    private let cellReuseIdentifier = "HotDealsTableViewCell"
    
    var model = [HotDealsOfTheDay]()
    
    private let hotDealsCollectionView: UICollectionView = {
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
        contentView.addSubview(hotDealsCollectionView)
        

        
        // add datasource and delegate protocol
        
        hotDealsCollectionView.delegate = self
        hotDealsCollectionView.dataSource = self
        
        
        NSLayoutConstraint.activate([
            hotDealsCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant:8),
            hotDealsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:8),
            hotDealsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            hotDealsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            hotDealsCollectionView.heightAnchor.constraint(equalToConstant: 300),
           ])
        
        hotDealsCollectionView.register(HotDealsCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)

    }
    func configure(model: [HotDealsOfTheDay]) {
            self.model = model
            hotDealsCollectionView.reloadData()
        }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension HotDealsTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! HotDealsCell
        let item = model[indexPath.row]
        cell.productTitleLabel.text = item.productName
        cell.configure(with: item)
        return cell
       
    }
}

extension HotDealsTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 300)
    }
}
