//
//  AssetTableViewCell.swift
//  InvestAppDesign
//
//  Created by Taner Çelik on 6.05.2024.
//

import UIKit

class AssetTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var content: UILabel!
    
    @IBOutlet weak var cellDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setup (model : HistoryModel, isEven : Bool) {
        title.text = model.title
        if isEven {
            title.textColor = .buttonColor
        }
        content.text = model.content
        cellDate.text = model.date
    }
    
}
