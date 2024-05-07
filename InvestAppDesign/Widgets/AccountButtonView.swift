//
//  AccountButtonView.swift
//  InvestAppDesign
//
//  Created by Taner Çelik on 7.05.2024.
//

import UIKit

class AccountButtonView: UIView {
    
    let prefixImage: UIImageView = UIImageView()
    let viewTitle: UILabel = UILabel()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupViews()
        }
    
    
    private func setupViews() {
        
            setupShadow()
            setupImage()
            setupTitle()
            layer.cornerRadius = 4
            backgroundColor = .white
        
       
            // Auto Layout
            prefixImage.translatesAutoresizingMaskIntoConstraints = false
            viewTitle.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
                prefixImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                prefixImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                prefixImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
                
                viewTitle.topAnchor.constraint(equalTo: topAnchor, constant: 21), // Adjust spacing as needed
                viewTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 54),
                
                viewTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -21)
                
            ])
        }
    
    
    
    func setup(model: AccountButtonModel){
            prefixImage.image = model.image
            viewTitle.text = model.title
             
        }
    
    
    func setupShadow(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 4)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 5
    }
    
    func setupImage(){
        prefixImage.contentMode = .scaleAspectFit
        prefixImage.tintColor = .black
        addSubview(prefixImage)
        
    }
    
    func setupTitle(){
        viewTitle.font = .systemFont(ofSize: 15, weight: .semibold)
        viewTitle.textAlignment = .center
        addSubview(viewTitle)
    }
}
