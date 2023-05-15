
//  RecommendedTableViewCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 28/04/2023.
//



import UIKit

class RecommendedTableViewCell: UITableViewCell {

    private let cellReuseIdentifier = "RecommendedTableViewCell"
    
    var model = [RecommendedForYou]()
    
    private let recommendedCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.backgroundColor = .white
            return collectionView
        
        }()
    
    static let reuseIdentifier = "RecommendedTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        contentView.addSubview(recommendedCollectionView)
        

        
        // add datasource and delegate protocol
        
        recommendedCollectionView.delegate = self
        recommendedCollectionView.dataSource = self
        
        
        NSLayoutConstraint.activate([
            recommendedCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            recommendedCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            recommendedCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            recommendedCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            recommendedCollectionView.heightAnchor.constraint(equalToConstant: 300),
               
               
           ])
        
        recommendedCollectionView.register(RecommendedCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)

    }
    func configure(model: [RecommendedForYou]) {
        self.model = model
        recommendedCollectionView.reloadData()
        
        }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
extension RecommendedTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! RecommendedCell
//        let item = model[indexPath.row]
//        cell.productTitleLabel.text = item.title
//        cell.configure(with: item)
        return cell
    }
    
}


extension RecommendedTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 300)
    }
}




