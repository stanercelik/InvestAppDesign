//
//  NotificationTableViewCell.swift
//  InvestAppDesign
//
//  Created by Taner Çelik on 7.05.2024.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var notifImage: UIImageView!
    
    @IBOutlet weak var notifTitle: UILabel!
    
    @IBOutlet weak var notifTimeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        notifTitle.textAlignment = .left
        notifTitle.numberOfLines = 0
        notifImage.layer.cornerRadius = 20
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setup(model : NotificationModel) {
        
        notifImage.image = model.image
        notifTitle.text = model.title
        notifTimeLabel.text = model.time
    }
    
}
