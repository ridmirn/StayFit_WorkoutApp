
//
//  UserProfileScreen.swift
//  StayFit_WorkoutApp
//
//  Created by Ridmi Natasha on 2023-05-10.
//

import UIKit

class UserProfileScreen: UIViewController {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "PROFILE"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
        
    }()
    let Age: UITextField = {
        let textfield = UITextField()
        textfield.keyboardType = .emailAddress
        textfield.layer.cornerRadius = 8
        textfield.layer.masksToBounds = true
        textfield.layer.borderWidth = 1.0
        textfield.textAlignment = .center
        return textfield
    }()
    
    let Weight: UITextField = {
        let textfield = UITextField()
        textfield.keyboardType = .emailAddress
        textfield.layer.cornerRadius = 8
        textfield.layer.masksToBounds = true
        textfield.layer.borderWidth = 1.0
        textfield.textAlignment = .center
        return textfield
    }()
    
    let Height: UITextField = {
        let textfield = UITextField()
        textfield.keyboardType = .emailAddress
        textfield.layer.cornerRadius = 8
        textfield.layer.masksToBounds = true
        textfield.layer.borderWidth = 1.0
        textfield.isSecureTextEntry = true
        textfield.textAlignment = .center
        return textfield
    }()
    let CreateProfile: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.view.backgroundColor = .black
        view.addSubview(titleLabel)
        setAge()
        setWeight()
        setHeight()
        setUserProfileButton()
        setLabel()
    }
    
    func setLabel(){
        self.view.addSubview(titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
        ])
    }
    func setAge (){
        self.view.addSubview(Age)
        self.Age.backgroundColor = UIColor.FieldColor
        self.Age.attributedPlaceholder = NSAttributedString(string: "Age", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
  
        self.Age.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.Age.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  30),
            self.Age.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30),
            self.Age.heightAnchor.constraint(equalToConstant: 50),
            self.Age.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
        ])
    
    }
    func setWeight (){
        self.view.addSubview(Weight)
        self.Weight.backgroundColor = UIColor.FieldColor
        self.Weight.attributedPlaceholder = NSAttributedString(string: "Weight", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
  
        self.Weight.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.Weight.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  30),
            self.Weight.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30),
            self.Weight.heightAnchor.constraint(equalToConstant: 50),
            self.Weight.topAnchor.constraint(equalTo: Age.bottomAnchor, constant: 30),
        ])
    
    }
    
    func setHeight (){
        self.view.addSubview(Height)
        self.Height.backgroundColor = UIColor.FieldColor
        self.Height.attributedPlaceholder = NSAttributedString(string: "Height", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
  
        self.Height.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.Height.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  30),
            self.Height.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30),
            self.Height.heightAnchor.constraint(equalToConstant: 50),
            self.Height.topAnchor.constraint(equalTo: Weight.bottomAnchor, constant: 30),
        ])
    
    }
    
    func setUserProfileButton(){
        self.view.addSubview(CreateProfile)
        self.CreateProfile.backgroundColor = UIColor.AppColor
        self.CreateProfile.setAttributedTitle(customProfileButton, for: .normal)
        //self.CreateProfile.addTarget(self, action:#selector(creactAccountTapped), for: .touchUpInside)
      
        self.CreateProfile.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.CreateProfile.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  30),
            self.CreateProfile.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -30),
            self.CreateProfile.heightAnchor.constraint(equalToConstant: 50),
            self.CreateProfile.topAnchor.constraint(equalTo: Height.bottomAnchor, constant: 40),
        ])
        }
    
    let customProfileButton = NSMutableAttributedString(string: "Next", attributes: [
        NSAttributedString.Key.foregroundColor : UIColor.black,
        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)
        
    ])

}
