//
//  ProfileViewController.swift
//  InvestAppDesign
//
//  Created by Taner Çelik on 7.05.2024.
//

import UIKit

protocol ConfigureProfileViewProtocol : AnyObject {
    
    func setupButtons()
    func setupProfilePhoto()
}

class ProfileViewController: UIViewController {

    let buttons : [AccountButtonModel] = [AccountButtonModel(image: UIImage(systemName: "person.crop.rectangle.fill") ?? #imageLiteral(resourceName: "gold_coin_no_background"), title: "Contact Info"),
        AccountButtonModel(image: UIImage(systemName: "gearshape.fill") ?? #imageLiteral(resourceName: "gold_coin_no_background"), title: "Settings"),
        AccountButtonModel(image: UIImage(systemName: "doc.fill") ?? #imageLiteral(resourceName: "gold_coin_no_background"), title: "Document Info"),
        AccountButtonModel(image: UIImage(systemName: "building.columns.fill") ?? #imageLiteral(resourceName: "gold_coin_no_background"), title: "Bank Account Info"),
        AccountButtonModel(image: UIImage(systemName: "banknote.fill") ?? #imageLiteral(resourceName: "gold_coin_no_background"), title: "Source of Funding Info"),
    ]
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var firstButtonView: AccountButtonView!
    
    @IBOutlet weak var secondButtonView: AccountButtonView!
    
    @IBOutlet weak var thirdButtonView: AccountButtonView!
    
    @IBOutlet weak var fourthButtonView: AccountButtonView!
    
    @IBOutlet weak var fifthButtonView: AccountButtonView!
    
    @IBOutlet weak var nameLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
        setupProfilePhoto()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
        tabBarController?.navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tabBarController?.tabBar.isHidden = false
        tabBarController?.navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isHidden = true
    }

}

extension ProfileViewController: ConfigureProfileViewProtocol {
    
    func setupButtons() {
        
        firstButtonView.setup(model: buttons[0])
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        
        let bankAccountTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleBankAccountTap(_:)))
        
        firstButtonView.addGestureRecognizer(tapGestureRecognizer)
        
        fourthButtonView.addGestureRecognizer(bankAccountTapGestureRecognizer)
        
        secondButtonView.setup(model: buttons[1])
        thirdButtonView.setup(model: buttons[2])
        fourthButtonView.setup(model: buttons[3])
        fifthButtonView.setup(model: buttons[4])
    }
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "contactInfoVC") as! ContactInfoViewController
        
        vc.delegate = self
        
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleBankAccountTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "bankAccountVC") as! BankAccountViewController
        
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupProfilePhoto() {
        profileImage.makeRounded()
    }
}



extension ProfileViewController : ChangeNameDelegate {
    func didChangeName(name: String) {
        nameLable.text = name
    }
    
    
}
