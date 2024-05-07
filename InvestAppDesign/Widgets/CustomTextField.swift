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
    
    let lineView : UIView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }


    private func setupViews() {
        
        backgroundColor = .white
        
        
        setupTitle()
        setupChangeLabel()
        confTextField()
        setupLineView()

        // Auto Layout
        textField.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        change.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
    NSLayoutConstraint.activate([

        title.topAnchor.constraint(equalTo: topAnchor, constant: 0),
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
        title.heightAnchor.constraint(equalToConstant: 16),
        title.widthAnchor.constraint(greaterThanOrEqualToConstant: 36),
        
        change.topAnchor.constraint(equalTo: topAnchor, constant: 8),
        change.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        change.heightAnchor.constraint(equalToConstant: 12),
        change.widthAnchor.constraint(equalToConstant: 40),
        
        textField.topAnchor.constraint(equalTo: topAnchor, constant: 2),
        textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        
        lineView.heightAnchor.constraint(equalToConstant: 1),
        lineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
        lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        
            
        ])
    }
    
    func setProporties(text: String, keyboard : UIKeyboardType){
        title.text = text
        textField.keyboardType = keyboard
        }
    
    
    private func confTextField(){
        textField.borderStyle = .none
        addSubview(textField)
        
    }
    
    private func setupLineView(){
        lineView.backgroundColor = .lightGray
        addSubview(lineView)
    }
    
    private func setupChangeLabel(){
        change.text = "Change"
        change.textColor = .buttonColor
        change.font = .systemFont(ofSize: 10)
        change.textAlignment = .right
        addSubview(change)
    }
    
    private func setupTitle(){
        title.font = .systemFont(ofSize: 14, weight: .semibold)
        addSubview(title)
    }
    

}
