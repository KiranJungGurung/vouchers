

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
    
    var CartVC = CartViewController()
   
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
        setupNavigationBar()
        setupTableView()
        setupFooterView()
        footerView.MainViewController = self

        
        // add delegate and datasource into tableview
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        homeTableView.estimatedRowHeight = 300
        homeTableView.rowHeight = UITableView.automaticDimension
        homeTableView.backgroundColor = .clear
        homeTableView.separatorStyle = .none
        homeTableView.translatesAutoresizingMaskIntoConstraints = false

    // MARK: -  NavigationBar Setup

        view.backgroundColor = .systemGray6
    }
    
    func setupNavigationBar() {
        
        let navigationBarView = UINavigationBar()
        navigationBarView.backgroundColor = .white
        navigationBarView.translatesAutoresizingMaskIntoConstraints = false
        
        let logoImageView = UIImageView(image: UIImage(named: "logo"))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let notificationButton = UIButton()
        notificationButton.setImage(UIImage(systemName: "bell"), for: .normal)
        notificationButton.tintColor = .black
        notificationButton.translatesAutoresizingMaskIntoConstraints = false
        
        let moreButton = UIButton()
        moreButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        moreButton.tintColor = .black
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        
        let greetingLabel = UILabel()
        greetingLabel.text = "Hi Kiran,Everything you will discover here."
        greetingLabel.numberOfLines = 1
        greetingLabel.adjustsFontSizeToFitWidth = true
        greetingLabel.font = UIFont.systemFont(ofSize: 16)
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        searchBar.placeholder = "Search"
        searchBar.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(navigationBarView)
        navigationBarView.addSubview(logoImageView)
        navigationBarView.addSubview(notificationButton)
        navigationBarView.addSubview(moreButton)
        navigationBarView.addSubview(greetingLabel)
        navigationBarView.addSubview(searchBar)

        NSLayoutConstraint.activate([
            navigationBarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 3),
            navigationBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBarView.heightAnchor.constraint(equalToConstant: 260),
            
            logoImageView.centerYAnchor.constraint(equalTo: navigationBarView.centerYAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: navigationBarView.leadingAnchor, constant: 16),
            logoImageView.heightAnchor.constraint(equalToConstant: 150), // Adjust the size as needed
            logoImageView.widthAnchor.constraint(equalToConstant: 260),
            
            notificationButton.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 15),
            notificationButton.trailingAnchor.constraint(equalTo: navigationBarView.trailingAnchor, constant: -14),
            notificationButton.heightAnchor.constraint(equalToConstant: 260),
            
            moreButton.leadingAnchor.constraint(equalTo: notificationButton.trailingAnchor, constant: -18),
            moreButton.heightAnchor.constraint(equalToConstant: 260),
            
            greetingLabel.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor, constant: 8),
            greetingLabel.centerYAnchor.constraint(equalTo: navigationBarView.centerYAnchor, constant: 43),
            greetingLabel.heightAnchor.constraint(equalToConstant: 70),
            
            searchBar.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 5),
            searchBar.leadingAnchor.constraint(equalTo: greetingLabel.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: greetingLabel.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            
            homeTableView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: 0),
            homeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            homeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            homeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),

            ])
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

//     MARK: - INITIALIZE FOOTER VIEW

    lazy var footerView: FooterView = {
        let footerView = FooterView()
        footerView.translatesAutoresizingMaskIntoConstraints = false
        return footerView
    }()

    private func setupFooterView() {
        view.addSubview(footerView)

        NSLayoutConstraint.activate([
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 70),
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
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 60
//    }
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
            cell.addItemsToCart = {[weak self] item in
                guard let strongSelf = self else {return}
                strongSelf.CartVC.featureData = item
                strongSelf.navigationController?.pushViewController(strongSelf.CartVC, animated: true)
            }
            
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
            
        case 3 :
            let cell = homeTableView.dequeueReusableCell(withIdentifier: HotDealsTableViewCell.reuseIdentifier, for: indexPath) as! HotDealsTableViewCell
            cell.configure(model: self.featuredProduct)
            
            cell.productClicked = { item in
                let vc = ProductDetailViewController()
                vc.featureData = item
                self.navigationController?.pushViewController(vc, animated: true)
            }
            cell.addItemsToCart = {[weak self] item in
                guard let strongSelf = self else {return}
                strongSelf.CartVC.featureData = item
                strongSelf.navigationController?.pushViewController(strongSelf.CartVC, animated: true)
            }
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
            
        case 4:
            let cell = homeTableView.dequeueReusableCell(withIdentifier: ShopBannerTableViewCell.reuseIdentifier, for: indexPath) as! ShopBannerTableViewCell
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
            
        case 5 :
            let cell = homeTableView.dequeueReusableCell(withIdentifier: PopularBrandTableViewCell.reuseIdentifier, for: indexPath) as! PopularBrandTableViewCell
            cell.configure(model: self.featuredProduct)
            cell.productClicked = { item in
                let vc = ProductDetailViewController()
                vc.featureData = item
                self.navigationController?.pushViewController(vc, animated: true)
            }
            cell.addItemsToCart = {[weak self] item in
                guard let strongSelf = self else {return}
                strongSelf.CartVC.featureData = item
                strongSelf.navigationController?.pushViewController(strongSelf.CartVC, animated: true)
            }
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
            
        default :
            let cell = homeTableView.dequeueReusableCell(withIdentifier: RecommendedTableViewCell.reuseIdentifier, for: indexPath) as! RecommendedTableViewCell
            cell.configure(model: self.featuredProduct)
            cell.productClicked = { item in
                let vc = ProductDetailViewController()
                vc.featureData = item
                self.navigationController?.pushViewController(vc, animated: true)
            }
            cell.addItemsToCart = {[weak self] item in
                guard let strongSelf = self else {return}
                strongSelf.CartVC.featureData = item
                strongSelf.navigationController?.pushViewController(strongSelf.CartVC, animated: true)
            }
            
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
        }
    }
}

