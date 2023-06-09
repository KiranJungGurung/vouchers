//
//  WishListViewController.swift
//  ESEWA MARKET
//  Created by Kiran Gurung on 31/05/2023.

import UIKit

class WishListViewController: UIViewController, UITableViewDelegate{
    
    //    var featureData: FeaturedProduct?
    //    var wishListItems = [FeaturedProduct]()
    //
    //    lazy var wishTableView: UITableView = {
    //        let homeTable = UITableView()
    //        homeTable.backgroundColor = .gray
    //        homeTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    //        return homeTable
    //    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        view.addSubview(wishTableView)
        view.backgroundColor = .cyan
        //        setupTableView()
        //
        //        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonPressed))
        //        backButton.tintColor = .black
        //        navigationItem.leftBarButtonItem = backButton
        //        navigationItem.title = "My WishList"
        //
        //    }
        //    override func viewWillAppear(_ animated: Bool) {
        //        super.viewWillAppear(animated)
        ////
        //        if let productItems = self.featureData {
        //            self.featureData = productItems
        //        }
        //        self.wishTableView.reloadData()
        //    }
        //
        //    @objc func backButtonPressed() {
        //        self.navigationController?.popViewController(animated: true)
        //    }
        //    private func setupTableView() {
        //
        //        wishTableView.delegate = self
        //        wishTableView.dataSource = self
        //        wishTableView.backgroundColor = .clear
        //        wishTableView.separatorStyle = .none
        //        wishTableView.translatesAutoresizingMaskIntoConstraints = false
        //
        //        NSLayoutConstraint.activate([
        //            wishTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
        //            wishTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        //            wishTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        //            wishTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        //        ])
        //    }
        //
        //}
        //extension WishListViewController: UITableViewDataSource {
        //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return wishListItems.count
        //    }
        //
        //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = wishTableView.dequeueReusableCell(withIdentifier: WishListTableViewCell.reuseIdentifier, for: indexPath) as! WishListTableViewCell
        //        let item = wishListItems[indexPath.row]
        //               // Configure the cell with the item's data
        //        cell.textLabel?.text = item.title
        //        cell.backgroundColor = .clear
        //        return cell
        //    }
        //
        //}
        
    }
}
