//
//  DeletePopUpViewController.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 23/04/2023.
//

import UIKit

class DeletePopUpViewController: UIViewController {
    
    var onDeleteClicked: ((String) -> ())?
    var onCancelled: (() -> ())?
    
    
    lazy var itemDeleteView:UIView = {
        let deleteStackView = UIView ()
        deleteStackView.translatesAutoresizingMaskIntoConstraints = false
        deleteStackView.layer.cornerRadius = 16
        return deleteStackView
    }()
    
    lazy var itemName: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Delete from cart"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = .black
        return titleLabel
    }()
    
    lazy var itemDeleteLabel: UILabel = {
        let deleteTextLabel = UILabel()
        deleteTextLabel.text = "Are you sure you want to delete item(s)."
        deleteTextLabel.translatesAutoresizingMaskIntoConstraints = false
        deleteTextLabel.textAlignment = .center
        deleteTextLabel.font = .systemFont(ofSize: 14, weight: .bold)
        deleteTextLabel.textColor = .gray
        return deleteTextLabel
    }()
    
    lazy var itemCancelButton: UIButton = {
        let cancelbtn = UIButton()
        cancelbtn.translatesAutoresizingMaskIntoConstraints = false
        cancelbtn.setTitle("CANCEL", for: .normal)
        cancelbtn.setTitleColor(.white, for: .normal)
        cancelbtn.backgroundColor = .darkGray
        cancelbtn.layer.cornerRadius = 14
        cancelbtn.clipsToBounds = true
        return cancelbtn
    }()
    
    lazy var itemDeleteButton: UIButton = {
        let deletebtn = UIButton()
        deletebtn.setTitle("DELETE", for: .normal)
        deletebtn.translatesAutoresizingMaskIntoConstraints = false
        deletebtn.setTitleColor(.white, for: .normal)
        deletebtn.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
        deletebtn.layer.cornerRadius = 14
        deletebtn.clipsToBounds = true
        return deletebtn
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        
        itemCancelButton.addTarget(self, action: #selector(dismissVc), for: .touchUpInside)
        itemDeleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
    
    func setupView() {
        view.backgroundColor = .clear
        
    }
    
    @objc func dismissVc() {
        self.dismiss(animated: true)
        onCancelled?()
    }
    @objc func deleteButtonTapped() {
        onDeleteClicked?("Tapped delete button")
    }
    
    func setupConstraints() {
        view.addSubview(itemDeleteView)
        itemDeleteView.backgroundColor = .white
        itemDeleteView.addSubview(itemName)
        itemDeleteView.addSubview(itemDeleteLabel)
        itemDeleteView.addSubview(itemCancelButton)
        itemDeleteView.addSubview(itemDeleteButton)
        
        NSLayoutConstraint.activate([
            //pin deleteview
            itemDeleteView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            itemDeleteView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            itemDeleteView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            itemDeleteView.heightAnchor.constraint(equalToConstant: 200),
            
            // pin titleLabel
            itemName.topAnchor.constraint(equalTo: itemDeleteView.topAnchor),
            itemName.leadingAnchor.constraint(equalTo: itemDeleteView.leadingAnchor),
            itemName.trailingAnchor.constraint(equalTo: itemDeleteView.trailingAnchor),
            itemName.heightAnchor.constraint(equalToConstant: 100),
            
            // pin deleteLabel
            itemDeleteLabel.leadingAnchor.constraint(equalTo: itemName.leadingAnchor),
            itemDeleteLabel.trailingAnchor.constraint(equalTo: itemName.trailingAnchor),
            itemDeleteLabel.heightAnchor.constraint(equalToConstant: 140),
            
            //pin cancel button
            itemCancelButton.topAnchor.constraint(equalTo: itemName.bottomAnchor),
            itemCancelButton.leadingAnchor.constraint(equalTo: itemName.leadingAnchor, constant: 20),
            itemCancelButton.widthAnchor.constraint(equalToConstant: 140),
            itemCancelButton.heightAnchor.constraint(equalToConstant: 50),
            
            //pin delete button
            itemDeleteButton.topAnchor.constraint(equalTo: itemName.bottomAnchor),
            itemDeleteButton.trailingAnchor.constraint(equalTo: itemName.trailingAnchor, constant: -20),
            itemDeleteButton.widthAnchor.constraint(equalToConstant: 140),
            itemDeleteButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}



