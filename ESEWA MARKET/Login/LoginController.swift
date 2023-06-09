//
//  LoginController.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 08/06/2023.
//

//
//  LoginController.swift
//  FirebaseUser
//
//  Created by Kiran Gurung on 06/06/2023.
//

import UIKit
import Firebase

class LoginController: UIViewController {
    
    lazy var logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "esewa emoji")
        return iv
    }()
    
    lazy var emailContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "email"), emailTextField)
    }()

    lazy var passwordContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "lock"), passwordTextField)
    }()
    
    lazy var emailTextField : UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    
   lazy var passwordTextField : UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }()

    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("LOG IN", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor.mainBlue(), for: .normal)
        button.backgroundColor = .white
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])

        attributedTitle.append(NSAttributedString(string: " Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        configureViewComponents()
    }
    
    @objc func handleLogin() {
        guard let email = emailTextField.text  else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
        logUserIn(withEmail: email, password: password)
            
        if let error = error {
            print("Login error: \(error.localizedDescription)")
            
        } else {
            self.navigateToHome()
              }
         }
       }

    
    func navigateToHome() {
        let homeViewController = HomeViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
    }


    
@objc func handleShowSignUp() {
        let vc = SignUpController()
        navigationController?.pushViewController(vc, animated: true)
    }

    func logUserIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Failed to sign user in with error", error.localizedDescription)
                return
            }
            print("Successfully logged user up...")
        }
    }
     
    


    func configureViewComponents(){
        view.backgroundColor = UIColor.mainBlue()
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(logoImageView)
        logoImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 60, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 150)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(emailContainerView)
        emailContainerView.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: -32, width: 0, height: 50)
        
        view.addSubview(passwordContainerView)
        passwordContainerView.anchor(top: emailTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingBottom: 0, paddingRight: -32, width: 0, height: 50)
        
        view.addSubview(loginButton)
        loginButton.anchor(top: passwordContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 45, paddingBottom: 0, paddingRight: -45, width: 0, height: 50)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 4, paddingRight: 12, width: 0, height: 90)
        
    }

}

