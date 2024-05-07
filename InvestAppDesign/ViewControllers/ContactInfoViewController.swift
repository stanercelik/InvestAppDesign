//
//  ContactInfoViewController.swift
//  InvestAppDesign
//
//  Created by Taner Çelik on 7.05.2024.
//

import UIKit

protocol ChangeNameDelegate {
    func didChangeName(name : String)
}

class ContactInfoViewController: UIViewController {
    

    @IBOutlet weak var profileImageView: UIView!
    
    @IBOutlet weak var nameTextFieldView: CustomTextField!
    
    @IBOutlet weak var birthdateTextFieldView: CustomTextField!
    
    @IBOutlet weak var genderTextFieldView: CustomTextField!
    
    @IBOutlet weak var emailTextFieldView: CustomTextField!
    
    @IBOutlet weak var phoneTextFieldView: CustomTextField!
    
    @IBOutlet weak var addressTextFieldView: CustomTextField!
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    var delegate : ChangeNameDelegate?
    
    @IBAction func SaveButton(_ sender: Any) {
        delegate?.didChangeName(name: nameTextFieldView.textField.text ?? "BOŞ STR")
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
        
        
        nameTextFieldView.setProporties(text: "Name", keyboard : .asciiCapable )
        birthdateTextFieldView.setProporties(text: "Birthdate", keyboard: .asciiCapableNumberPad)
        genderTextFieldView.setProporties(text: "Gender", keyboard: .asciiCapable)
        emailTextFieldView.setProporties(text: "Email", keyboard: .emailAddress)
        phoneTextFieldView.setProporties(text: "Phone Number", keyboard: .phonePad)
        addressTextFieldView.setProporties(text: "Address", keyboard: .asciiCapable)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = true
        tabBarController?.navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tabBarController?.tabBar.isHidden = true
        tabBarController?.navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
    }
    
}
