//
//  TableViewCell.swift
//  InvestAppDesign
//
//  Created by Taner Çelik on 5.05.2024.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var content: UILabel!
    
    @IBOutlet weak var guideImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup (model : InvestmentGuideModel) {
        
        title.text = model.title
        content.text = model.content
        guideImage.image = model.image
        guideImage.makeRounded()
    }
    
}

extension UIImageView {
    
    func makeRounded() {
        layer.masksToBounds = false
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}
