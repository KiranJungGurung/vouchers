//  PhotoTableViewCell.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 30/04/2023.
//

import UIKit

/*class PhotoTableViewCell: UITableViewCell, UICollectionViewDelegate {

    
    private let identifier = "PhotoTableViewCell"
    
    var model = [ProductImage]()

    
    private let photoCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: 100, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = layout
        return collectionView
        
    }()
    
    static let reuseIdentifier = "PhotoTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        contentView.addSubview(photoCollectionView)
        
        
        // add datasource and delegate protocol
        
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            photoCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoCollectionView.heightAnchor.constraint(equalToConstant: 350),
            
            
        ])
        photoCollectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
        
    }
    func configure(model: [ProductImage]) {
                self.model = model
            photoCollectionView.reloadData()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}

extension PhotoTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        let item = model[indexPath.row]
        cell.setupCollectionCell(with: "\(item.image)")
        return cell
    }
    
}
            
extension PhotoTableViewCell: UICollectionViewDelegateFlowLayout {
            
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: 400)
        
    }
            
        
        
        
}
*/

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    private let identifier = "PhotoTableViewCell"
            
    var photoContainerView: UIView = {
        let photoContainerView = UIView()
        photoContainerView.translatesAutoresizingMaskIntoConstraints = false
        return photoContainerView
        
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(named: "jacket")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()



    static let reuseIdentifier = "PhotoTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        
        contentView.addSubview(photoContainerView)
        photoContainerView.addSubview(productImageView)
    
        
        
        NSLayoutConstraint.activate([
            photoContainerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            photoContainerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            photoContainerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            photoContainerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            photoContainerView.heightAnchor.constraint(equalToConstant: 320),
            
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            productImageView.heightAnchor.constraint(equalToConstant: 200)
         ])
            


        
     
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: ProductDetail) {
        imageView?.image = model.productImages
        
          
      }
    
}
