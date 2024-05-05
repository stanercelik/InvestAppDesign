//
//  SignUpPageViewController.swift
//  InvestAppDesign
//
//  Created by Taner Çelik on 29.04.2024.
//

import UIKit

protocol SignUpPageViewControllerProtocol : AnyObject {
    func configureSignUpViewTitle()
    func configureSignUpViewSubTitle()
    func configurecreateAccountButton()
    func configureLoginButton()
}

class SignUpPageViewController: UIViewController{
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var signUpViewTitle: UILabel!
    
    @IBOutlet weak var signUpViewSubTitle: UILabel!
    
    @IBOutlet weak var createAccountButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    let buttonColor : UIColor = UIColor(_colorLiteralRed: 49, green: 160, blue: 98, alpha: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureSignUpViewTitle()
        configureSignUpViewSubTitle()
        configureLoginButton()
        configurecreateAccountButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}

extension SignUpPageViewController : SignUpPageViewControllerProtocol {
    
    func configureSignUpViewTitle() {
        signUpViewTitle.text = "Stay on top of your finance with us."
        signUpViewTitle.textAlignment = .center
        signUpViewTitle.font = .systemFont(ofSize: 34, weight: .semibold)
        signUpViewTitle.numberOfLines = 2
    }
    
    func configureSignUpViewSubTitle() {
        signUpViewSubTitle.text = "We are your new financial Advisors \n to recommed the best investments for \n you."
        signUpViewSubTitle.textAlignment = .center
        signUpViewSubTitle.font = .systemFont(ofSize: 17, weight: .regular)
    }
    
    func configurecreateAccountButton() {
        createAccountButton.setTitle("Create Account", for: .normal)
        createAccountButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .heavy)
        createAccountButton.setTitleColor( .white, for: .normal)
        createAccountButton.backgroundColor = buttonColor
        createAccountButton.layer.cornerRadius = 20
        createAccountButton.addTarget(self, action: #selector(self.createAccountButtonTapped), for: .touchUpInside)
    }
    
    func configureLoginButton() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .heavy)
        loginButton.titleLabel?.textColor = buttonColor
        
        loginButton.addTarget(self, action: #selector(self.loginButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped(sender : UIButton) {
        print("Login Button Tapped")
    }
    
    @objc func createAccountButtonTapped(sender : UIButton) {
        print("Create Account Button Tapped")
    }
}





