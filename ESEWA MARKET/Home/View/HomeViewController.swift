

//  HomViewController.swift
//  ESEWA MARKET
//  Created by Kiran Gurung on 20/04/2023.

import Alamofire
import SwiftyJSON
import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, HomeProtocolDelegate, CategoryProtocolDelegate {
    
    // MARK: - Properties
    
    var searchController = UISearchController(searchResultsController: nil)
    
    var presenter: HomePresenter?
    var presenter1: CategoryPresenter?
    var model = [Product]()
    var category: [Categories]?
    var featuredProduct = [FeaturedProduct]()
    var hotDeal = [HotDealsOfTheDay]()
    var hotDealBanner = [HotDealBanner]()
    var popularBrand = [PopularBrand]()
    var recommendedForYou = [RecommendedForYou]()
    
    // MARK: - HomeTableView
    
    lazy var homeTableView: UITableView = {
        let homeTable = UITableView()
        homeTable.backgroundColor = .gray
        homeTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return homeTable
    }()
    
    //MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeTableView)
        view.addSubview(footerView)
//        setupNavigationBarItems()
        setupTableView()
        searchBar()
        setupFooterView()
        
        // MARK: -  NavigationBar Setup

        view.backgroundColor = .systemGray6
        let button = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: nil)
        let notificationButton =  UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .plain, target: self, action: nil)
        button.tintColor = .black
        navigationItem.rightBarButtonItem = notificationButton
        navigationItem.title = HomeTexts.marketTitle
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeTableView.frame = view.bounds
    }
    
    func didFetchProduct(model: [FeaturedProduct]) {
        self.featuredProduct = model
        homeTableView.reloadData()
    }
    func displayCategory(model: [Categories]) {
        self.category = model
        homeTableView.reloadData()
    }
    private func setupTableView() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.estimatedRowHeight = 300
        homeTableView.rowHeight = UITableView.automaticDimension
        homeTableView.backgroundColor = .clear
        homeTableView.separatorStyle = .none
        homeTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            homeTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            homeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            homeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            homeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        ])
        
        self.presenter = HomePresenter(delegate: self)
        presenter?.fetch()
        
        self.presenter1 = CategoryPresenter(delegate: self, view: self)
        presenter1?.updateView()

        // MARK: - Register Cells
        
        homeTableView.register(ShopBannerTableViewCell.self, forCellReuseIdentifier: ShopBannerTableViewCell.reuseIdentifier)
        homeTableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: CategoriesTableViewCell.reuseIdentifier)
        homeTableView.register(FeaturedTableViewCell.self, forCellReuseIdentifier: FeaturedTableViewCell.reuseIdentifier)
        homeTableView.register(HotDealsTableViewCell.self, forCellReuseIdentifier: HotDealsTableViewCell.reuseIdentifier)
        homeTableView.register(PopularBrandTableViewCell.self, forCellReuseIdentifier: PopularBrandTableViewCell.reuseIdentifier)
        homeTableView.register(RecommendedTableViewCell.self, forCellReuseIdentifier: RecommendedTableViewCell.reuseIdentifier)
    }
 
    private func searchBar() {
        navigationItem.searchController = UISearchController()
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.placeholder = HomeTexts.searchBarPlaceholder
        searchController.searchBar.tintColor = .white
    }
    
//     MARK: - INITIALIZE FOOTER VIEW
    
    lazy var footerView: FooterView = {
        let footerView = FooterView()
        footerView.translatesAutoresizingMaskIntoConstraints = false
        return footerView
    }()

    private func setupFooterView() {
        view.addSubview(footerView)

        NSLayoutConstraint.activate([
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12),
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 80),
        ])
    }

    
    @objc func didTap() {
        let vc = CartViewController()
        vc.navTitle = HomeTexts.cartViewControllerTitle
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return TableViewHeaderText.section0
        case 1:
            return TableViewHeaderText.section1
        case 2:
            return TableViewHeaderText.section2
        case 3:
            return TableViewHeaderText.section3
        case 4:
            return TableViewHeaderText.section4
        case 5:
            return TableViewHeaderText.section5
        default :
            return TableViewHeaderText.defaultSection
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView()
        headerView.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        headerView.textLabel?.text = tableView.dataSource?.tableView?(tableView, titleForHeaderInSection: section)
        return headerView
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            
        case 0:
            let cell = homeTableView.dequeueReusableCell(withIdentifier: ShopBannerTableViewCell.reuseIdentifier, for: indexPath) as! ShopBannerTableViewCell
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
            
        case 1:
            let cell = homeTableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.reuseIdentifier, for: indexPath) as! CategoriesTableViewCell
            if let model = category {
                cell.configure(model: model)
            }
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
            
        case 2:
            let cell = homeTableView.dequeueReusableCell(withIdentifier: FeaturedTableViewCell.reuseIdentifier, for: indexPath) as! FeaturedTableViewCell
            cell.configure(model: self.featuredProduct)
            cell.productClicked = { item in
                let vc = ProductDetailViewController()
                vc.featureData = item
                self.navigationController?.pushViewController(vc, animated: true)
            }
            cell.addItemsToCart = { item in
                let vc = CartViewController()

            }
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
            
        case 3 :
            let cell = homeTableView.dequeueReusableCell(withIdentifier: HotDealsTableViewCell.reuseIdentifier, for: indexPath) as! HotDealsTableViewCell
            cell.configure(model: self.featuredProduct)
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
            
        case 4:
            let cell = homeTableView.dequeueReusableCell(withIdentifier: ShopBannerTableViewCell.reuseIdentifier, for: indexPath) as! ShopBannerTableViewCell
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
            
        case 5 :
            let cell = homeTableView.dequeueReusableCell(withIdentifier: PopularBrandTableViewCell.reuseIdentifier, for: indexPath) as! PopularBrandTableViewCell
            cell.configure(model: self.featuredProduct)
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
            
        default :
            let cell = homeTableView.dequeueReusableCell(withIdentifier: RecommendedTableViewCell.reuseIdentifier, for: indexPath) as! RecommendedTableViewCell
            cell.configure(model: self.featuredProduct)
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
        }
    }
}

