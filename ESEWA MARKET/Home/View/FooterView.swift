//
//  FooterView.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 29/05/2023.
//

import Foundation
import UIKit

class FooterView: UIView {
    
    weak var MainViewController: UIViewController?
    
    lazy var homeButton: UIButton = {
        let homeButton = UIButton()
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.setImage(UIImage(systemName: "house"), for: .normal)
        homeButton.tintColor = .black
        homeButton.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
        return homeButton
    }()

    lazy var cartButton: UIButton = {
        let cartButton = UIButton()
        cartButton.translatesAutoresizingMaskIntoConstraints = false
        cartButton.tintColor = .green
        cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
        cartButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)

        return cartButton
    }()

    lazy var likeButton: UIButton = {
        let likeButton = UIButton()
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.tintColor = .red
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.addTarget(self, action: #selector(wishButtonTapped), for: .touchUpInside)

        return likeButton
    }()

    lazy var menuButton: UIButton = {
        let menuButton = UIButton()
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.tintColor = .blue
        menuButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        menuButton.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        return menuButton
    }()
    


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFooterView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFooterView()
    }
    
    @objc func homeButtonTapped() {
        guard let parentVC = MainViewController else {
                    return
                }
                
                // Create the view controller you want to navigate to
                let homeVC = HomeViewController()
//                let cartVC = CartViewController()
//                let wishVC = WishListViewController()
//                let profileVC = ProfileViewController()
                
                // Navigate to the view controller
                parentVC.navigationController?.pushViewController(homeVC, animated: true)
//                parentVC.navigationController?.pushViewController(cartVC, animated: true)
//                parentVC.navigationController?.pushViewController(wishVC, animated: true)
//                parentVC.navigationController?.pushViewController(profileVC, animated: true)
        
    }
    @objc func cartButtonTapped() {
        guard let parentVC = MainViewController else {
                    return
                }
            
                let cartVC = CartViewController()
                parentVC.navigationController?.pushViewController(cartVC, animated: true)
//
    }
    
    @objc func wishButtonTapped() {
        guard let parentVC = MainViewController else {
                    return
                }
            
                let wishVC = WishListViewController()
                parentVC.navigationController?.pushViewController(wishVC, animated: true)
//
    }
    @objc func menuButtonTapped() {
        guard let parentVC = MainViewController else {
                    return
                }
            
                let profileVC = ProfileViewController()
                parentVC.navigationController?.pushViewController(profileVC, animated: true)
//
    }

    private func setupFooterView() {
        backgroundColor = .white
        addSubview(homeButton)
        addSubview(cartButton)
        addSubview(likeButton)
        addSubview(menuButton)

        NSLayoutConstraint.activate([
            homeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            homeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),

            cartButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            cartButton.leadingAnchor.constraint(equalTo: homeButton.leadingAnchor, constant: 90),

            likeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            likeButton.leadingAnchor.constraint(equalTo: cartButton.leadingAnchor, constant: 90),

            menuButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            menuButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
        ])
    }
}

