//  ProductDetailViewController.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 21/04/2023.
//

import UIKit

class ProductDetailViewController: UIViewController, UITableViewDelegate, ProductDetailProtocolDelegate{
   
    // MARK: - Properties
    
    var mySections = [0,1,2,3]
    var presenter: ProductDetailPresenter?
    var model = [ProductDetail]()
    
    var productDetailTableView: UITableView = {
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
        view.addSubview(productDetailTableView)
        setupTableView()
        view.backgroundColor = .white
        
        // MARK: - Navigation UI
        let backButton = UIButton(type: .system)
                backButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        //        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
                backButton.translatesAutoresizingMaskIntoConstraints = false
                backButton.tintColor = .black
           // Add the back button to the navigation item
                navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        // MARK: - Register TableCell
        
        productDetailTableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: PhotoTableViewCell.reuseIdentifier)
        productDetailTableView.register(ProductInfoTableViewCell.self, forCellReuseIdentifier: ProductInfoTableViewCell.reuseIdentifier)
        productDetailTableView.register(DescriptionView.self, forCellReuseIdentifier: DescriptionView.reuseIdentifier)
        productDetailTableView.register(FooterCell.self, forCellReuseIdentifier: FooterCell.reuseIdentifier)
        
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - ProductDetailTableView
    
    private func setupTableView() {
        
        // add datasource and delegate
        productDetailTableView.delegate = self
        productDetailTableView.dataSource = self
    
        productDetailTableView.backgroundColor = .clear
        productDetailTableView.separatorStyle = .none
        
        //add presenter and update view
        
        presenter = ProductDetailPresenter(delegate: self, view: self)
        presenter?.updateView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        productDetailTableView.frame = view.bounds
    }
    
    func displayProductList(model: [ProductDetail]) {
        self.model = model
        productDetailTableView.reloadData()
    }
}

        // MARK: - TableView Datasource

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
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch mySections[indexPath.section] {
        case 0:
            let cell = productDetailTableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.reuseIdentifier, for: indexPath) as! PhotoTableViewCell
            let item = model[indexPath.row]
            cell.configure(with: item)
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            tableView.separatorStyle = .singleLine
            return cell
            
        case 1:
            let cell = productDetailTableView.dequeueReusableCell(withIdentifier: ProductInfoTableViewCell.reuseIdentifier, for: indexPath) as! ProductInfoTableViewCell
            let item = model[indexPath.row]
            cell.configure(with: item)
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            tableView.separatorStyle = .singleLine
            return cell
    
        case 2:
            let cell = productDetailTableView.dequeueReusableCell(withIdentifier: DescriptionView.reuseIdentifier, for: indexPath) as! DescriptionView
            cell.descLabel.text = "Approx. model measurements: height:5'10 bust 31-1/2,waist: 24"
            return cell
                
        default:
            let cell = productDetailTableView.dequeueReusableCell(withIdentifier: FooterCell.reuseIdentifier, for: indexPath) as! FooterCell
            let item = model[indexPath.row]
            cell.configure(with: item)
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
    
    




