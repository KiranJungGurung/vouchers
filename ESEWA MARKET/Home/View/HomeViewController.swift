
//  HomViewController.swift
//  ESEWA MARKET
//  Created by Kiran Gurung on 20/04/2023.

import Alamofire
import SwiftyJSON
import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, HomeProtocolDelegate {
   
    
    var searchController = UISearchController(searchResultsController: nil)
    
    let footerView = UIView()
    var presenter: HomePresenter?
    var model = [Product]()
    
    var featuredProduct = [FeaturedProduct]()
    var hotDeal = [HotDealsOfTheDay]()
    var hotDealBanner = [HotDealBanner]()
    var popularBrand = [PopularBrand]()
    var recommendedForYou = [RecommendedForYou]()
    
    private let homeTableView: UITableView = {
        let homeTable = UITableView()
        homeTable.backgroundColor = .white//.systemFill
        homeTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return homeTable
    }()
    
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeTableView)
        view.addSubview(footerView)
        
        setupTableView()
        searchBar()
        setupFooterView()
        
        // MARK: Navigation Bar
        view.backgroundColor = .white
        let button = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: nil)
        let notificationButton =  UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .plain, target: self, action: nil)
        button.tintColor = .black
        navigationItem.rightBarButtonItem = button
        navigationItem.rightBarButtonItem = notificationButton
        navigationItem.title = "Market"
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeTableView.frame = view.bounds
        
    }
    
    func didFetchProduct(model: [FeaturedProduct]) {
        //        self.model = model
        self.featuredProduct = model
        
        homeTableView.reloadData()
        
    }
    
    private func setupTableView() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        self.presenter = HomePresenter(delegate: self)
        //        presenter?.updateView()
        presenter?.fetch()
        
        homeTableView.estimatedRowHeight = 300
        homeTableView.rowHeight = UITableView.automaticDimension
        
        homeTableView.backgroundColor = .clear
        homeTableView.separatorStyle = .none
        
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
        searchController.searchBar.placeholder = "What are you searching for?"
        searchController.searchBar.tintColor = .white
        
    }
    
    // MARK: - ADD FOOTER VIEW
    private func setupFooterView() {
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.backgroundColor = .white
        
        let homeButton: UIButton = {
            let homeButton = UIButton()
            homeButton.translatesAutoresizingMaskIntoConstraints = false
            homeButton.setImage(UIImage(systemName: "house"), for: .normal)
            homeButton.tintColor = .black
            return homeButton
        }()
        
        let cartButton: UIButton = {
            let cartButton = UIButton()
            cartButton.translatesAutoresizingMaskIntoConstraints = false
            cartButton.tintColor = .black
            cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
            return cartButton
        }()
        
        let likeButton: UIButton = {
            let likeButton = UIButton()
            likeButton.translatesAutoresizingMaskIntoConstraints = false
            likeButton.tintColor = .black
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            return likeButton
        }()
        
        let moreButton: UIButton = {
            let moreButton = UIButton()
            moreButton.translatesAutoresizingMaskIntoConstraints = false
            moreButton.tintColor = .black
            moreButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
            return moreButton
        }()
        
        //        cartButton.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        
        view.addSubview(footerView)
        footerView.addSubview(homeButton)
        footerView.addSubview(cartButton)
        footerView.addSubview(likeButton)
        footerView.addSubview(moreButton)
        //
        NSLayoutConstraint.activate([
            
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 70),
            
            homeButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            homeButton.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 50),
            
            cartButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            cartButton.leadingAnchor.constraint(equalTo: homeButton.leadingAnchor, constant: 90),
            
            likeButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            likeButton.leadingAnchor.constraint(equalTo: cartButton.leadingAnchor, constant: 90),
            
            moreButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            moreButton.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -50),
            
            
        ])
    }
    //    func didFetchProduct(model: [Product]) {
    //        self.model = model
    ////        self.featuredProduct = featuredProduct
    //        homeTableView.reloadData()
    //
    //    }
    //    func displayCategoryAndProduct(model: [Product], featuredProduct: [FeaturedProduct], hotDeals: [HotDealsOfTheDay], hotDealBanner: [HotDealBanner], popularBrand: [PopularBrand], recommendedForYou: [RecommendedForYou]) {
    //        self.model = model
    //        self.featuredProduct = featuredProduct
    //        self.hotDeal = hotDeals
    //        self.hotDealBanner = hotDealBanner
    //        self.popularBrand = popularBrand
    //        self.recommendedForYou = recommendedForYou
    //        homeTableView.reloadData()
    //    }
    }
//    @objc func didTap() {
//        let viewcontroller = CartViewController()
//        self.navigationController?.pushViewController(viewcontroller, animated: true)
//}


extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //        let sectionType = model[section]
        //        return sectionType.category
        switch section {
        case 0:
            return ""
        case 1:
            return "Categories"
        case 2:
            return "Featured Products"
        case 3:
            return "Hot Deals Of TheDay"
        case 4:
            return ""
        case 5:
            return "Popular Brands"
        default :
            return "Recommended for you"
        }
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let sectionType = model[indexPath.section].category?.categoryName
        //        switch sectionType {
        switch indexPath.section {
            
        case 0:
            let cell = homeTableView.dequeueReusableCell(withIdentifier: ShopBannerTableViewCell.reuseIdentifier, for: indexPath) as! ShopBannerTableViewCell
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
            
        case 1:
            let cell = homeTableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.reuseIdentifier, for: indexPath) as! CategoriesTableViewCell
            cell.backgroundColor = .red
            return cell
            
        case 2:
            let cell = homeTableView.dequeueReusableCell(withIdentifier: FeaturedTableViewCell.reuseIdentifier, for: indexPath) as! FeaturedTableViewCell
            
            //need to add sthg
            
            //            if let model = model.category.categoryName {
            
            //                           cell.setupViewWithData(model: model)
            //                       }
            ////                       cell.itemClicked = { item in
            ////                           let vc = FeaturedEventsDetailedViewController()
            ////                           vc.eventData = item
            ////                           self.navigationController?.pushViewController(vc, animated: true)
            ////                       }
            
            //            if let item = featuredProduct[indexPath.row] {
            cell.configure(model: self.featuredProduct)
//            let vc = ProductDetailViewController()
//            self.navigationController?.pushViewController(vc, animated: true)
            
            //            }
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
            
            
        case 3 :
            let cell = homeTableView.dequeueReusableCell(withIdentifier: HotDealsTableViewCell.reuseIdentifier, for: indexPath) as! HotDealsTableViewCell
            cell.configure(model: self.featuredProduct)
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
            
        case 4:
            let cell = homeTableView.dequeueReusableCell(withIdentifier: ShopBannerTableViewCell.reuseIdentifier, for: indexPath) as! ShopBannerTableViewCell
//            cell.configure(model: self.hotDealBanner)
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
            
        case 5 :
            let cell = homeTableView.dequeueReusableCell(withIdentifier: PopularBrandTableViewCell.reuseIdentifier, for: indexPath) as! PopularBrandTableViewCell
//            cell.configure(model: self.popularBrand)
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
            
        default :
            let cell = homeTableView.dequeueReusableCell(withIdentifier: RecommendedTableViewCell.reuseIdentifier, for: indexPath) as! RecommendedTableViewCell
//            cell.configure(model: self.recommendedForYou)
            cell.backgroundColor = UIColor(red: 237/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1)
            return cell
        }
    }
    
}
