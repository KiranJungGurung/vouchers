

//
//  CategoriesTableViewCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 26/04/2023.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    private let cellReuseIdentifier = "CategoriesTableViewCell"
    
    var category: [Categories]?
    
    lazy var categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: 20))
        return collectionView
    }()
    
    static let reuseIdentifier = "CategoriesTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)

        contentView.addSubview(categoriesCollectionView)
        // add datasource and delegate protocol
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            categoriesCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            categoriesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            categoriesCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 120)
        
        ])
        //Register
        categoriesCollectionView.register(CategoriesCell.self, forCellWithReuseIdentifier:cellReuseIdentifier)

    }
    func configure(model: [Categories]?) {
        if let model = model {
            self.category = model
            categoriesCollectionView.reloadData()
        }
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CategoriesCell
        
        if let category = category {
            let item = category[indexPath.row]
            cell.configure(with: item)
        }
        return cell
    }
}
extension CategoriesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
  // trying make the category cell dynamic
        let item = category?[indexPath.row]
        let label = UILabel()
        label.numberOfLines = 0
        label.text = item?.categoryName
        let labelSize = label.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: 80))
        let calculateLabelWidth = labelSize.width
        return CGSize(width: calculateLabelWidth, height: 120)
    }
}

