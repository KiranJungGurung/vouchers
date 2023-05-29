//
//  FooterView.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 29/05/2023.
//

import Foundation
import UIKit

class FooterView: UIView {
    
    lazy var homeButton: UIButton = {
        let homeButton = UIButton()
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.setImage(UIImage(systemName: "house"), for: .normal)
        homeButton.tintColor = .black
        return homeButton
    }()

    lazy var cartButton: UIButton = {
        let cartButton = UIButton()
        cartButton.translatesAutoresizingMaskIntoConstraints = false
        cartButton.tintColor = .green
        cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
        return cartButton
    }()

    lazy var likeButton: UIButton = {
        let likeButton = UIButton()
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.tintColor = .red
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        return likeButton
    }()

    lazy var menuButton: UIButton = {
        let menuButton = UIButton()
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.tintColor = .blue
        menuButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
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

