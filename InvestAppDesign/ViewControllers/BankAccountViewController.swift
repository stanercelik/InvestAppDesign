//
//  BankAccountViewController.swift
//  InvestAppDesign
//
//  Created by Taner Çelik on 8.05.2024.
//

import UIKit

class BankAccountViewController: UIViewController {
    
    let accountList : [BankAccountModel] = [
    BankAccountModel(image: #imageLiteral(resourceName: "bankAccount1"), title: "Bank of Amrica - 0182128xxx", user: "Taner Çelik"),
    BankAccountModel(image: #imageLiteral(resourceName: "bankAccount2"), title: "Zenith Bank - 0182128xxx", user: "Taner Çelik")]

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addButtonView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "BankAccountTableViewCell", bundle: nil), forCellReuseIdentifier: "BankAccountTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.showsVerticalScrollIndicator = false
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

    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addAccountButtonTapped(_ sender: Any) {
    }
    
}

extension BankAccountViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accountList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BankAccountTableViewCell", for: indexPath) as! BankAccountTableViewCell
        
        cell.setup(model: accountList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
}
