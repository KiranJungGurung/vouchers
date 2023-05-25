
//  ProductDetailViewController.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 21/04/2023.
//

import UIKit
import Kingfisher
class ProductDetailViewController: UIViewController, UITableViewDelegate{
    
    // MARK: - Properties
    
    var mySections = [0,1,2,3]
    var featureData: FeaturedProduct?
    
    // MARK: - Add Custom FooterView
    
    let itemFooterView: UIView = {
        let footerView = UIView()
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.backgroundColor = .white
        footerView.layer.shadowOpacity = 0.4
        footerView.layer.shadowOffset = .zero
        return footerView
    }()
    
    let itemTitle: UILabel = {
        let total = UILabel()
        total.text = "Naxasa"
        total.translatesAutoresizingMaskIntoConstraints = false
        total.textAlignment = .left
        total.font = .systemFont(ofSize: 16, weight: .bold)
        total.textColor = .gray
        return total
    }()
    
    let itemPrice: UILabel = {
        let totalPrice = UILabel()
        totalPrice.text  = "Rs.345"
        totalPrice.translatesAutoresizingMaskIntoConstraints = false
        totalPrice.textAlignment = .left
        totalPrice.font = .systemFont(ofSize: 18, weight: .medium)
        totalPrice.textColor = .black
        return totalPrice
    }()
    
    let addToCartButton: UIButton = {
        let checkOutButton = UIButton()
        checkOutButton.translatesAutoresizingMaskIntoConstraints = false
        checkOutButton.setTitle("ADD TO CART", for: .normal)
        checkOutButton.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        checkOutButton.layer.cornerRadius = 16
        checkOutButton.layer.masksToBounds = true
        return checkOutButton
    }()
    
    let productDetailTableView: UITableView = {
        let productTable = UITableView()
        productTable.separatorStyle = .none
        productTable.separatorColor = .clear
        productTable.backgroundColor = .white
        
        productTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return productTable
        
    }()
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(itemFooterView)
        view.addSubview(itemTitle)
        view.addSubview(itemPrice)
        view.addSubview(addToCartButton)
        view.addSubview(productDetailTableView)
        setupTableView()
        view.backgroundColor = .white
        
        // MARK: - Navigation UI
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        let cartButton = UIButton(type: .system)
        cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
        cartButton.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cartButton)
        
        
        // MARK: - Register TableCell
        
        productDetailTableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: PhotoTableViewCell.reuseIdentifier)
        productDetailTableView.register(ProductInfoTableViewCell.self, forCellReuseIdentifier: ProductInfoTableViewCell.reuseIdentifier)
        productDetailTableView.register(DescriptionView.self, forCellReuseIdentifier: DescriptionView.reuseIdentifier)
//        productDetailTableView.register(FooterCell.self, forCellReuseIdentifier: FooterCell.reuseIdentifier)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - ProductDetailTableView
    
    private func setupTableView() {
        
        // add datasource and delegate
        productDetailTableView.delegate = self
        productDetailTableView.dataSource = self

        productDetailTableView.backgroundColor = .clear
        productDetailTableView.separatorStyle = .singleLine
        productDetailTableView.separatorColor = .none
        productDetailTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productDetailTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            productDetailTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            productDetailTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            productDetailTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            
            itemFooterView.leadingAnchor.constraint(equalTo:self.productDetailTableView.leadingAnchor, constant: 0),
            itemFooterView.bottomAnchor.constraint(equalTo: self.productDetailTableView.bottomAnchor, constant: 0),
            itemFooterView.trailingAnchor.constraint(equalTo: self.productDetailTableView.trailingAnchor, constant: 0),
            itemFooterView.heightAnchor.constraint(equalToConstant: 90),
            
            itemTitle.topAnchor.constraint(equalTo: self.itemFooterView.topAnchor, constant: 8),
            itemTitle.leadingAnchor.constraint(equalTo: self.itemFooterView.leadingAnchor, constant:8),
            itemTitle.trailingAnchor.constraint(equalTo: self.itemFooterView.trailingAnchor, constant: -8),
            
            itemPrice.topAnchor.constraint(equalTo: itemTitle.bottomAnchor),
            itemPrice.leadingAnchor.constraint(equalTo: itemTitle.leadingAnchor),
            itemPrice.heightAnchor.constraint(equalToConstant: 30),
            
            // pin Checkout button
            addToCartButton.topAnchor.constraint(equalTo: self.itemFooterView.topAnchor, constant: 16),
            addToCartButton.trailingAnchor.constraint(equalTo: self.itemFooterView.trailingAnchor, constant: 16),
            addToCartButton.trailingAnchor.constraint(equalTo: self.itemFooterView.trailingAnchor, constant: -16),
            addToCartButton.widthAnchor.constraint(equalToConstant: 170),
            addToCartButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        productDetailTableView.frame = view.bounds
    }
    
    func displayProductList(featureData: FeaturedProduct?) {
        self.featureData = featureData
        productDetailTableView.reloadData()
    }
}

        // MARK: - TableView Datasource

extension ProductDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mySections[section] == 2 {
            return 8
        } else {
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch mySections[section] {
        case 0:
            return ""
        case 1:
            return ""
        case 2:
            return "Description"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if mySections[section] == 2 {
            
            // MARK: - TableView footer
            
            let footerView = UIView()
            footerView.translatesAutoresizingMaskIntoConstraints = false
            
            let button = UIButton(type: .system)
            button.setTitle("VIEW MORE", for: .normal)
            button.tintColor = .green
            button.contentMode = .scaleAspectFit
            button.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.cornerRadius = 14
            button.layer.masksToBounds = true
            button.backgroundColor = .lightGray.withAlphaComponent(0.1)
            
            view.addSubview(footerView)
            footerView.addSubview(button)
            
            NSLayoutConstraint.activate([
                footerView.topAnchor.constraint(equalTo: self.productDetailTableView.topAnchor, constant: 20),
                footerView.centerXAnchor.constraint(equalTo: self.productDetailTableView.centerXAnchor, constant: 10),
                footerView.centerYAnchor.constraint(equalTo: self.productDetailTableView.centerYAnchor, constant: 10),
                footerView.heightAnchor.constraint(equalToConstant: 125),
                
                
                button.widthAnchor.constraint(equalToConstant: 120),
                button.heightAnchor.constraint(equalToConstant: 40),
                button.centerXAnchor.constraint(equalTo: footerView.centerXAnchor, constant: 0),
                button.centerYAnchor.constraint(equalTo: footerView.centerYAnchor, constant: 650),
                
            ])
            return footerView
        }
        return nil
    }
    @objc func moreButtonTapped() {
//        navigationController?.popViewController(animated: true)
        
        
    }
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch mySections[indexPath.section] {
        case 0:
            let cell = productDetailTableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.reuseIdentifier, for: indexPath) as! PhotoTableViewCell
            
            if let featureData = featureData {
                cell.configure(with: featureData)
            }
            return cell
            
        case 1:
            let cell = productDetailTableView.dequeueReusableCell(withIdentifier: ProductInfoTableViewCell.reuseIdentifier, for: indexPath) as! ProductInfoTableViewCell
            if let featureData = featureData {
                cell.configure(with: featureData)
            }
            return cell
            
        default:
            let cell = productDetailTableView.dequeueReusableCell(withIdentifier: DescriptionView.reuseIdentifier, for: indexPath) as! DescriptionView
            if let featureData = featureData {
                cell.configure(with: featureData)
            }
            return cell
            
//        default:
//            let cell = productDetailTableView.dequeueReusableCell(withIdentifier: FooterCell.reuseIdentifier, for: indexPath) as! FooterCell
//            if let featureData = featureData {
//                cell.configure(with: featureData)
//        }
//            return cell
        }
        
    }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            switch mySections[indexPath.section] {
            case 0:
                return 350 // Height for PhotoTableViewCell
            case 1:
                return 120 // Height for ProductInfoTableViewCell
            case 2:
                return 60
//            case 3:
//                return 90 // Height for FooterCell
            default:
                return UITableView.automaticDimension // For any other sections, use automatic dimension
            }
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if mySections[indexPath.section] == 2 {
//            return 60
//
//        } else {
//            return UITableView.automaticDimension
//        }
//    }
//
//}
//



