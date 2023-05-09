//  ProductDetailViewController.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 21/04/2023.
//

import UIKit

class ProductDetailViewController: UIViewController, UITableViewDelegate{
   
    
//    var presenter: ProductDetailPresenter?
//    var model = [ProductDetail]()
    
    /*var productImage = [ProductImage]()
    var productInfo = [ProductInfo]()
    var productDescription = [ProductDescription]()
    var productCalculation = [ProductCalculation]()
     */

    private let productDetailTableView: UITableView = {
        let productTable = UITableView()
        productTable.separatorStyle = .none
        productTable.separatorColor = .clear
        productTable.backgroundColor = .white//.systemFill
        productTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        productTable.register(ProductInfoTableViewCell.self, forCellReuseIdentifier: ProductInfoTableViewCell.reuseIdentifier)
        productTable.register(DescriptionView.self, forCellReuseIdentifier: DescriptionView.reuseIdentifier)
        productTable.register(FooterCell.self, forCellReuseIdentifier: FooterCell.reuseIdentifier)
        return productTable
        
    }()
 
    
    var mySections = [0,1,2,3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(productDetailTableView)
        setupTableView()
        
        view.backgroundColor = .white
        // MARK: - Navigation UI
        // add back button and cart button in navigation bar
        
        let button = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: nil)
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: nil)
        
        button.tintColor = .black
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = button
        
        productDetailTableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: PhotoTableViewCell.reuseIdentifier)
        productDetailTableView.register(ProductInfoTableViewCell.self, forCellReuseIdentifier: ProductInfoTableViewCell.reuseIdentifier)
        productDetailTableView.register(DescriptionView.self, forCellReuseIdentifier: DescriptionView.reuseIdentifier)
    }
    
    //MARK: - ProductDetailTableView
    
    private func setupTableView() {
        
        // add datasource and delegate
        productDetailTableView.delegate = self
        productDetailTableView.dataSource = self
        
        
        productDetailTableView.backgroundColor = .clear
        productDetailTableView.separatorStyle = .none
        
        //add presenter and populatetableview
        
//        presenter = ProductDetailPresenter(delegate: self, view: self)
//        presenter?.updateView()
//
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        productDetailTableView.frame = view.bounds
    }
//    func displayProductList(model: [ProductDetailProtocolDelegate]) {
//        productDetailTableView.reloadData()
//    }
     /*confirming productdetail protocols
    func displayProductDetailItems(model: [ProductDetail], productImage: [ProductImage], productInfo: [ProductInfo], productDescription: [ProductDescription], productCalculation: [ProductCalculation]) {
        self.model = model
        self.productImage = productImage
        self.productInfo = productInfo
        self.productDescription = productDescription
        self.productCalculation = productCalculation
        productDetailTableView.reloadData()

    }
      */
    

}


extension ProductDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mySections[section] == 2 {
            return 8
        } else {
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let sectionType = model[section]
//        return sectionType.section?.sectionName
        
        
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
            
            let footerView = UIView()
            footerView.translatesAutoresizingMaskIntoConstraints = false
            
            let button = UIButton(type: .system)
            button.setTitle("VIEW MORE", for: .normal)
            button.tintColor = .green
            button.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.cornerRadius = 10
            button.backgroundColor = .systemFill
            
            view.addSubview(footerView)
            footerView.addSubview(button)

                NSLayoutConstraint.activate([
                    
                    footerView.topAnchor.constraint(equalTo: self.productDetailTableView.topAnchor, constant: 20),
                    footerView.centerXAnchor.constraint(equalTo: self.productDetailTableView.centerXAnchor, constant: 0),
                    footerView.centerYAnchor.constraint(equalTo: self.productDetailTableView.centerYAnchor, constant: 0),
                  
                    footerView.heightAnchor.constraint(equalToConstant: 60),
                    
                    button.centerXAnchor.constraint(equalTo: footerView.centerXAnchor, constant: 10),
                    button.centerYAnchor.constraint(equalTo: footerView.centerYAnchor, constant: 650),
                
                ])

                return footerView
            }
            return nil
        }

        @objc func moreButtonTapped() {
            // Handle "more" button tap
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch mySections[indexPath.section] {
//        let sectionType = model[indexPath.section].section?.sectionName
//        switch sectionType {
            case 0:
                let cell = productDetailTableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.reuseIdentifier, for: indexPath) as! PhotoTableViewCell
//                let item = presenter?.productDetail.first
//                cell.configure(model: self.productImage)
                cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
                tableView.separatorStyle = .singleLine
                
                return cell
            case 1:
                let cell = productDetailTableView.dequeueReusableCell(withIdentifier: ProductInfoTableViewCell.reuseIdentifier, for: indexPath) as! ProductInfoTableViewCell
            
                cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
                tableView.separatorStyle = .singleLine
    
                return cell
    
            case 2:
                let cell = productDetailTableView.dequeueReusableCell(withIdentifier: DescriptionView.reuseIdentifier, for: indexPath) as! DescriptionView
                cell.descLabel.text = "Approx. model measurements: height:5'10 bust 31-1/2,waist: 24"
                return cell
                
            default:
                let cell = productDetailTableView.dequeueReusableCell(withIdentifier: FooterCell.reuseIdentifier, for: indexPath) as! FooterCell
                cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
                return cell
        
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if mySections[indexPath.section] == 2 {
            return 60
        } else {
            return UITableView.automaticDimension
        }
    }
    
    
}
    
    


