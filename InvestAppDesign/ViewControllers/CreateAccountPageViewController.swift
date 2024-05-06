//
//  CreateAccountPageViewController.swift
//  InvestAppDesign
//
//  Created by Taner Çelik on 29.04.2024.
//

import UIKit

protocol textFieldProtocol : AnyObject {
    func configureTextField(_ textField: UITextField, _ placeholderText: String)
}

protocol CreateAccountPageViewControllerProtocol : textFieldProtocol ,AnyObject {
    func configureLeftBarButtonItem()
    func configureBigTitle()
    func configuretitleDetailLabel()
    func configureCreateAccountButton()
    func configureHaveAccountButton()
    func configureTextField(_ textField: UITextField, _ placeholderText: String)
}

class CreateAccountPageViewController: UIViewController {

    @IBOutlet weak var bigTitleLabel: UILabel!
    
    @IBOutlet weak var titleDetailLAbel: UILabel!
    
    @IBOutlet weak var fullNameTextField: UITextField!
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var createAccountbutton: UIButton!
    
    @IBOutlet weak var haveAccountButton: UIButton!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLeftBarButtonItem()
        configureBigTitle()
        configuretitleDetailLabel()
        configureTextField(fullNameTextField, "Full name")
        configureTextField(emailAddressTextField, "Email address")
        configureTextField(passwordTextField, "Password")
        configureCreateAccountButton()
        configureHaveAccountButton()
    }

}

extension CreateAccountPageViewController : CreateAccountPageViewControllerProtocol, textFieldProtocol {
    
    func configureLeftBarButtonItem() {
        backButton.target = #selector(self.dismissButton) as AnyObject
        backButton?.image = UIImage(systemName: "chevron.left")?.withConfiguration(UIImage.SymbolConfiguration(scale: .medium))
        backButton.tintColor = .black
    }
    
    @objc func dismissButton () {
        self.dismiss(animated: true, completion: nil)
    }
    
    func configureBigTitle() {
        bigTitleLabel.text = "Create an account"
        bigTitleLabel.textAlignment = .center
        bigTitleLabel.font = .systemFont(ofSize: 34, weight: .semibold)
    }
    
    func configuretitleDetailLabel() {
        titleDetailLAbel.text = "Invest and double your income now"
        titleDetailLAbel.textAlignment = .center
        titleDetailLAbel.font = .systemFont(ofSize: 17, weight: .regular)
    }
    
    func configureTextField(_ textField : UITextField, _ placeholderText: String) {
        textField.clearsOnBeginEditing = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.placeholder = placeholderText
        textField.borderStyle = .none
        textField.keyboardType = .asciiCapable
        textField.layer.borderColor = UIColor.textFieldBorderColor.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 20
    }
    
    func configureCreateAccountButton() {
        createAccountbutton.setTitle("Create account", for: .normal)
        createAccountbutton.titleLabel?.font = .systemFont(ofSize: 17, weight: .heavy)
        createAccountbutton.setTitleColor( .white, for: .normal)
        createAccountbutton.backgroundColor = .buttonColor
        createAccountbutton.layer.cornerRadius = 20
        createAccountbutton.addTarget(self, action: #selector(self.createAccountButtonTapped), for: .touchUpInside)
    }
    
    func configureHaveAccountButton() {
        haveAccountButton.setTitle("Already have an account?", for: .normal)
        haveAccountButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .heavy)
        haveAccountButton.titleLabel?.textColor = .buttonColor
        
        haveAccountButton.addTarget(self, action: #selector(self.haveAccountButtonTapped), for: .touchUpInside)
    }
    
    @objc func createAccountButtonTapped () {
        print("Create Account Button Tapped.")
    }
    
    @objc func haveAccountButtonTapped () {
        print("Ok, you already have an account.")
    }
    
    
    
    
}
