//
//  CustomTextField.swift
//  InvestAppDesign
//
//  Created by Taner Çelik on 7.05.2024.
//

import UIKit

class CustomTextField: UIView {

    let textField : UITextField = UITextField()
    
    let title : UILabel = UILabel()
    
    let change : UILabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }


    private func setupViews() {

        // Auto Layout
        textField.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        change.translatesAutoresizingMaskIntoConstraints = false
        
    NSLayoutConstraint.activate([
            //title.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            
        ])
    }
    
    func setTitle(str: String){
        title.text = str
        }
    
    
    private func confTextField(){
        textField.borderStyle = .line
        
    }
    
    private func setupChangeLabel(){
        change.text = "Change"
        change.textColor = .buttonColor
        change.font = .systemFont(ofSize: 9)
    }
    
    private func setupTitle(){
        title.font = .systemFont(ofSize: 13, weight: .regular)
        addSubview(title)
    }
    

}
