//  CartViewController.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 23/04/2023.
//

import UIKit

class CartViewController: UIViewController {
    
    // MARK: - Properties
    
//    var presenter: AddCartItemPresenter!
//    var model: [AddCartItemModel] = []
    var navTitle: String?
    var cartButton: UIBarButtonItem?
    var totalPrice = 0.0
    var featureData: FeaturedProduct?
    var featuredItems = [FeaturedProduct]()
    var totalItemsInCart: Int = 0

    
    // MARK: - Add Custom FooterView
    
    lazy var cartFooterView: UIView = {
        let footerView = UIView()
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.backgroundColor = .white
        return footerView
    }()
    
    lazy var itemCheckOutTotal: UILabel = {
        let total = UILabel()
        total.text = "Checkout Total"
        total.translatesAutoresizingMaskIntoConstraints = false
        total.textAlignment = .left
        total.font = .systemFont(ofSize: 16, weight: .bold)
        total.textColor = .gray
        return total
    }()
    
    lazy var itemTotalPriceLabel: UILabel = {
        let totalPrice = UILabel()
        totalPrice.translatesAutoresizingMaskIntoConstraints = false
        totalPrice.textAlignment = .left
        totalPrice.font = .systemFont(ofSize: 16, weight: .medium)
        totalPrice.textColor = .black
        return totalPrice
    }()
    
    lazy var itemCheckOutButton: UIButton = {
        let checkOutButton = UIButton()
        checkOutButton.translatesAutoresizingMaskIntoConstraints = false
        checkOutButton.setTitle("CHECKOUT", for: .normal)
        checkOutButton.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        checkOutButton.layer.cornerRadius = 16
        checkOutButton.layer.masksToBounds = true
        return checkOutButton
    }()
    
    // MARK: - Add a table View
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6.withAlphaComponent(1)

        //MARK: - ADD NABBAR INTO VIEWCONTROLLER

        let button = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: nil)
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonPressed))
        button.tintColor = .black
        backButton.tintColor = .black
        
        navigationItem.rightBarButtonItem = button
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "My Cart"
        cartButton = button

        // add tableview to view
        view.addSubview(tableView)
        view.addSubview(cartFooterView)
        view.addSubview(itemCheckOutTotal)
        view.addSubview(itemTotalPriceLabel)
        view.addSubview(itemCheckOutButton)
        setupTableView()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        tableView.frame = view.bounds
        setupFooterView()
        updateTotalPriceLabel()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           if let productItems = self.featureData {
               featuredItems.append(productItems)
           }
        
           self.tableView.reloadData()
    }
    func addItemToCart(_ product: FeaturedProduct) {
        featuredItems.append(product)
    }
                                     
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.separatorColor = .none
        
//        presenter = AddCartItemPresenter(delegate: self, view: self)
//        presenter?.updateView()
        
    }
//    func displayCartItemList(model: [AddCartItemModel]) {
//        self.model = model
//        tableView.reloadData()
//    }
    
    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
        
    }


    func updateTotalPriceLabel() {
        itemTotalPriceLabel.text = "Rs.\(totalPrice)"
        
    }
    func setupFooterView() {
        
        // MARK: - Set Constraint of footerView
        
        NSLayoutConstraint.activate([
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        
            cartFooterView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            cartFooterView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            cartFooterView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            cartFooterView.heightAnchor.constraint(equalToConstant: 100),
            
            itemCheckOutTotal.topAnchor.constraint(equalTo: self.cartFooterView.topAnchor, constant: 8),
            itemCheckOutTotal.leadingAnchor.constraint(equalTo: self.cartFooterView.leadingAnchor, constant:8),
            itemCheckOutTotal.trailingAnchor.constraint(equalTo: self.cartFooterView.trailingAnchor, constant: -8),
            
            itemTotalPriceLabel.topAnchor.constraint(equalTo: itemCheckOutTotal.bottomAnchor),
            itemTotalPriceLabel.leadingAnchor.constraint(equalTo: itemCheckOutTotal.leadingAnchor),
            itemTotalPriceLabel.heightAnchor.constraint(equalToConstant: 30),
            
            itemCheckOutButton.topAnchor.constraint(equalTo: self.cartFooterView.topAnchor, constant: 16),
            itemCheckOutTotal.trailingAnchor.constraint(equalTo: self.cartFooterView.trailingAnchor, constant: 16),
            itemCheckOutButton.trailingAnchor.constraint(equalTo: self.cartFooterView.trailingAnchor, constant: -16),
            itemCheckOutButton.widthAnchor.constraint(equalToConstant: 170),
            itemCheckOutButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
}
extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked cell at \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let vc = DeletePopUpViewController()
            vc.onDeleteClicked = { deletedMessage in
            self.featuredItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .middle)
            vc.dismiss(animated: true) {
                self.tableView.reloadData()
                print(deletedMessage)
                }
            }
            vc.modalPresentationStyle = .popover
            vc.preferredContentSize.height = 50
            self.present(vc, animated: true, completion: nil)
        }
        
    }

}

extension CartViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Items(\(featuredItems.count))"
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return featuredItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        
        let item = featuredItems[indexPath.row]
        cell.configure(with: item)
        
        
        
        cell.countChanged = { price in
            self.totalPrice = (price + price)
            self.updateTotalPriceLabel()
         }
        
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}


