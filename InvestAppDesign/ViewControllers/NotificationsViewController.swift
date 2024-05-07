//
//  NotificationsViewController.swift
//  InvestAppDesign
//
//  Created by Taner Çelik on 7.05.2024.
//

import UIKit

class NotificationsViewController: UIViewController {
    
    let notifList : [NotificationModel] = [
    NotificationModel(image: #imageLiteral(resourceName: "notificationImage2"), title: "Apple stocks just increased check it out now.", time: "15min ago"),
    NotificationModel(image: #imageLiteral(resourceName: "notificationImage1"), title: "Check out today’s best investor. You’ll learn from him", time: "3min ago"),
    NotificationModel(image: #imageLiteral(resourceName: "notificationImage3"), title: "Where do you see yourself in the next ages.", time: "30secs ago"),
    NotificationModel(image: #imageLiteral(resourceName: "profile_image"), title: "Check out today’s best investor. You’ll learn from him", time: "45secs ago"),
    NotificationModel(image: #imageLiteral(resourceName: "colorful_image"), title: "Apple stocks just increased check it out now.", time: "15min ago"),
    NotificationModel(image: #imageLiteral(resourceName: "world_image"), title: "Where do you see yourself in the next ages.", time: "3min ago"),
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var backbuttonView: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backbuttonView.tintColor = .black
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.showsVerticalScrollIndicator = false

        tableView.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationTableViewCell")
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension NotificationsViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notifList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        
        cell.setup(model: notifList[indexPath.row])
        
        return cell
        
    }
    
    
    
    
}
