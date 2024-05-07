//
//  BankAccountTableViewCell.swift
//  InvestAppDesign
//
//  Created by Taner Çelik on 8.05.2024.
//

import UIKit

class BankAccountTableViewCell: UITableViewCell {

    @IBOutlet weak var accountImage: UIImageView!
    
    @IBOutlet weak var accountName: UILabel!
    
    @IBOutlet weak var accountUserName: UILabel!
    
    @IBOutlet weak var ellipsisButton: UIImageView!
    
    @IBOutlet weak var accountView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        
        ellipsisButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setupView(){
        accountView.backgroundColor = .white
        accountView.layer.cornerRadius = 20
        accountView.layer.shadowColor = UIColor.black.cgColor
        accountView.layer.shadowOffset = CGSize(width: 1, height: 4)
        accountView.layer.shadowOpacity = 0.1
        accountView.layer.shadowRadius = 5
    }
    
    func setup(model: BankAccountModel) {
        accountName.text = model.title
        accountUserName.text = model.user
        accountImage.image = model.image
    }
    
}
