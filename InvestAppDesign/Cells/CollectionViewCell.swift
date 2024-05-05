//
//  CollectionViewCell.swift
//  InvestAppDesign
//
//  Created by Taner Çelik on 5.05.2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellContentView: CollectionViewCell!
    
    @IBOutlet weak var CellTitle: UILabel!
    
    @IBOutlet weak var cellSubTitle: UILabel!
    
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var cellViewWithOpacity: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    
    }
    
    func setup(model: PlanModel) {
        
        
        cellViewWithOpacity.layer.cornerRadius = 20
        
        cellView.layer.cornerRadius = 20
        
        CellTitle.text = model.name
        
        cellSubTitle.text = model.subTitle
        
        cellImage.image = model.image
        
        cellView.backgroundColor = model.backgroundColor
        
        cellViewWithOpacity.backgroundColor = model.backgroundColor.withAlphaComponent(0.5)
    }

}
