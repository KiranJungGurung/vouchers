

//
//  CategoriesTableViewCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 26/04/2023.
//


import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    private let cellReuseIdentifier = "CategoriesTableViewCell"
    
    var model = [Categories]()
    
    private let categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    static let reuseIdentifier = "CategoriesTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        
        contentView.addSubview(categoriesCollectionView)
        // add datasource and delegate protocol
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            categoriesCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            categoriesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            categoriesCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 120),
        ])
        
        categoriesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension CategoriesTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        
        return cell
    }
    
}


extension CategoriesTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 120)
    }
    
}

