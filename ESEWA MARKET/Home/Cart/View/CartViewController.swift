//  CartViewController.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 23/04/2023.
//

import UIKit
class CartViewController: UIViewController, AddItemToCartProtocol {
    
    var presenter: AddCartItemPresenter?
    var model: [AddCartItemModel] = []
    
    var items = [AddCartItemModel]().self
    
    var totalPrice = 0.0
    
    // MARK: - Add Custom FooterView
    
    private var cartFooterView: UIView = {
        let footerView = UIView()
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.backgroundColor = .white//.systemFill
        return footerView
    }()
    
    private let itemCheckOutTotal: UILabel = {
        let total = UILabel()
        total.text = "Checkout Total"
        total.translatesAutoresizingMaskIntoConstraints = false
        total.textAlignment = .left
        total.font = .systemFont(ofSize: 16, weight: .bold)
        total.textColor = .gray
        return total
    }()
    
    private let itemTotalPriceLabel: UILabel = {
        let totalPrice = UILabel()
        totalPrice.text = "Rs.52,500"
        totalPrice.translatesAutoresizingMaskIntoConstraints = false
        totalPrice.textAlignment = .left
        totalPrice.font = .systemFont(ofSize: 16, weight: .medium)
        totalPrice.textColor = .black
        return totalPrice
    }()
    
    private let itemCheckOutButton: UIButton = {
        let checkOutButton = UIButton()
        checkOutButton.translatesAutoresizingMaskIntoConstraints = false
        checkOutButton.setTitle("CHECKOUT", for: .normal)
        checkOutButton.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        checkOutButton.layer.cornerRadius = 16
        checkOutButton.layer.masksToBounds = true
        return checkOutButton
    }()
    
    //    func getProductList(resposne: ProductResponse) {
    //
    //    }
    
    // MARK: - Add a table View
    
    private let tableView: UITableView = {
        let table = UITableView()
        //table.backgroundColor = .clear//.systemFill
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // VC ko view ko color
        self.view.backgroundColor = .systemGray6.withAlphaComponent(1)
        
        
        
        //MARK: - ADD NABBAR INTO VIEWCONTROLLER
        
        let button = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: nil)
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonPressed))
        button.tintColor = .black
        backButton.tintColor = .black
        
        self.navigationController?.popViewController(animated: true)
        
        
        navigationItem.rightBarButtonItem = button
        navigationItem.leftBarButtonItem = backButton
        
        navigationItem.title = "My Cart"
        
        // add tableview to view
        view.addSubview(tableView)
        view.addSubview(cartFooterView)
        view.addSubview(itemCheckOutTotal)
        view.addSubview(itemTotalPriceLabel)
        view.addSubview(itemCheckOutButton)
        
        
        
        // add the data source and delegate into tableview
        setupTableView()
    }
    
    // changing the layout
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        setupFooterView()
//        updateTotalPriceLabel()
        
    }
   
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        // object created
        presenter = AddCartItemPresenter(delegate: self, view: self)
        presenter?.updateView()
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.separatorColor = .none
        
    }
    func displayItemList(model: [AddCartItemModel]) {
        self.model = model
        tableView.reloadData()
    }
    
    
    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
        
        
        
    }
    
    private func updateTotalPriceLabel() {
        itemTotalPriceLabel.text = "Rs.\(totalPrice)"

    }
    private func setupFooterView() {
        
        NSLayoutConstraint.activate([
            
            
            // MARK: - Set Constraint of footerView
            
            cartFooterView.leadingAnchor.constraint(equalTo: self.tableView.leadingAnchor, constant: 0),
            cartFooterView.bottomAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 0),
            cartFooterView.trailingAnchor.constraint(equalTo: self.tableView.trailingAnchor, constant: 0),
            cartFooterView.heightAnchor.constraint(equalToConstant: 100),
            
            // pin checkouttotal label
            
            itemCheckOutTotal.topAnchor.constraint(equalTo: self.cartFooterView.topAnchor, constant: 8),
            itemCheckOutTotal.leadingAnchor.constraint(equalTo: self.cartFooterView.leadingAnchor, constant:8),
            itemCheckOutTotal.trailingAnchor.constraint(equalTo: self.cartFooterView.trailingAnchor, constant: -8),
            
            // totalPriceLabel
            itemTotalPriceLabel.topAnchor.constraint(equalTo: itemCheckOutTotal.bottomAnchor),
            itemTotalPriceLabel.leadingAnchor.constraint(equalTo: itemCheckOutTotal.leadingAnchor),
            itemTotalPriceLabel.heightAnchor.constraint(equalToConstant: 30),
            
            // pin Checkout button
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
    // add delete row feature with swap action
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //                // show the delete pop up view
        let vc = DeletePopUpViewController()
        vc.modalPresentationStyle = .popover
        //                vc.contentSizeForViewInPopover.height = 300
        vc.preferredContentSize.height = 50
        // Keep animated value as false
        // Custom Modal presentation animation will be handled in VC itself
        self.present(vc, animated: true)
        
    }
    @objc func didPressed() {
        navigationController?.popViewController(animated: true)
    }
    
}


extension CartViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let itemCount = items.count
        return "Items(\(itemCount))"
//
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
//        let item = model[indexPath.row]
        
                let item = model[indexPath.row]
                cell.configure(with: item)
        
        cell.backgroundColor = .clear
        
        
        //        for i in 0..<tableView.numberOfRows(inSection: 0) {
        //            if let cell = tableView.cellForRow(at: IndexPath(row: i, section: 0)) as? CustomTableViewCell {
        //                cell.countChanged = { price in
        //                    self.totalPrice += price
        //                    self.updateTotalPriceLabel()
        //            }
        //        }
        
//        cell.countChanged = { price in
//            self.totalPrice += price
//            self.updateTotalPriceLabel()
//
//        }
        
        // update the view
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
        
    }
    

    
}

