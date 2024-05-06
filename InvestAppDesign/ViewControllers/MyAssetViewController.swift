//
//  MyAssetViewController.swift
//  InvestAppDesign
//
//  Created by Taner Çelik on 5.05.2024.
//

import UIKit

protocol ConfigureMyAssetViewControllerProtocol  : AnyObject {
    func setupDismissbutton()
    func setupCurrentView()
}


class MyAssetViewController: UIViewController {
    
    let historyList : [HistoryModel] = [ HistoryModel(title: "Rp 200.000", content: "Buy 'APPL' Stock", date: "TUE 22 Jun 2020"),
        HistoryModel(title: "Rp 150.000", content: "Sell 'TLKM' Stock ", date: "TUE 22 Feb 2020"),
        HistoryModel(title: "Rp 100.000.240", content: "Buy 'FB' Stock ", date: "TUE 22 Jun 2020"),
        HistoryModel(title: "Rp 100.122.233", content: "Sell 'APPL' Stock", date: "TUE 22 Apr 2020"),
        HistoryModel(title: "Rp 200.000", content: "Buy 'APPL' Stock", date: "TUE 22 Jun 2020"),
        HistoryModel(title: "Rp 150.000", content: "Sell 'TLKM' Stock ", date: "TUE 22 Jun 2020"),
        HistoryModel(title: "Rp 100.000.240", content: "Buy 'FB' Stock ", date: "TUE 22 May 2023"),
        HistoryModel(title: "Rp 300.122.233", content: "Sell 'APPL' Stock", date: "TUE 22 Jun 2021"),
                                         
    
    ]

    @IBOutlet weak var dismissButtonImage: UIImageView!
    
    @IBOutlet weak var currentPlanview: UIView!
    
    @IBOutlet weak var goldCoinImage: UIImageView!
    
    @IBOutlet weak var historyTableView: UITableView!
    
    @IBOutlet weak var currentPlanViewVithOpacity: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTableView.dataSource = self
        historyTableView.delegate = self
        
        historyTableView.register(UINib(nibName: "AssetTableViewCell", bundle: nil), forCellReuseIdentifier: "AssetTableViewCell")
        
        
        setupDismissbutton()
        setupCurrentView()
    }
}


extension MyAssetViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        historyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyTableView.dequeueReusableCell(withIdentifier: "AssetTableViewCell", for: indexPath) as! AssetTableViewCell
        let isEven = indexPath.row % 2 == 1 ? true : false
        cell.setup(model: historyList[indexPath.row], isEven: isEven)
        return cell
    }
}

extension MyAssetViewController : ConfigureMyAssetViewControllerProtocol {
    func setupDismissbutton() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        dismissButtonImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer){
        print("asdasd")
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupCurrentView() {
        currentPlanview.backgroundColor = .goldColor
        currentPlanViewVithOpacity.backgroundColor = .goldColor.withAlphaComponent(0.4)
        currentPlanview.layer.cornerRadius = 20
        currentPlanViewVithOpacity.layer.cornerRadius = 20
        currentPlanview.clipsToBounds = true
        goldCoinImage.transform = CGAffineTransform(rotationAngle: -0.2)
    }
    
    
}
