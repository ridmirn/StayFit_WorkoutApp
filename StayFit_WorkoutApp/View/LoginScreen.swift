//
//  LoginScreen.swift
//  StayFit_WorkoutApp
//
//  Created by Ridmi Natasha on 2023-05-06.
//

import UIKit

class LoginScreen: UIViewController {

    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "LOGIN"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 34)
        return label
        
    }()
    
    let appleid: UITextField = {
        let textfield = UITextField()
        textfield.keyboardType = .emailAddress
        textfield.layer.cornerRadius = 8
        textfield.layer.masksToBounds = true
        textfield.layer.borderWidth = 1.0
       // textfield.placeholder = "Apple ID"
        textfield.textAlignment = .center
        return textfield
    }()
    
    let password: UITextField = {
        let textfield = UITextField()
        textfield.keyboardType = .emailAddress
        textfield.layer.cornerRadius = 8
        textfield.layer.masksToBounds = true
        textfield.layer.borderWidth = 1.0
        //textfield.textContentType = .password
        textfield.isSecureTextEntry = true
        textfield.textAlignment = .center
        return textfield
    }()
    
    let loginButton: UIButton = {
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
        setappleID()
        setPassword()
        setLoginButton()
        setLabel()
    }
    
    func setLabel(){
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        
    }
    
    func setappleID (){
        view.addSubview(appleid)
       appleid.backgroundColor = UIColor.FieldColor
        appleid.attributedPlaceholder = NSAttributedString(string: "Apple ID", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
  
        appleid.translatesAutoresizingMaskIntoConstraints = false
        appleid.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  30).isActive = true
        appleid.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -30).isActive = true
        appleid.heightAnchor.constraint(equalToConstant: 50).isActive = true
        appleid.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 80).isActive = true
    
    }
    
    func setPassword (){
        view.addSubview(password)
       password.backgroundColor = UIColor.FieldColor
        password.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
  
        password.translatesAutoresizingMaskIntoConstraints = false
        password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  30).isActive = true
        password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -30).isActive = true
        password.heightAnchor.constraint(equalToConstant: 50).isActive = true
        password.topAnchor.constraint(equalTo: appleid.bottomAnchor, constant: 30).isActive = true
    
    }
    
    func setLoginButton(){
        view.addSubview(loginButton)
       loginButton.backgroundColor = UIColor.AppColor
        loginButton.setAttributedTitle(customButton, for: .normal)
        //loginButton.addTarget(self, action: #selector(goToGainLossScreen), for: .touchUpInside)
  
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  30).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -30).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 80).isActive = true
    }
    
    let customButton = NSMutableAttributedString(string: "Login", attributes: [
        NSAttributedString.Key.foregroundColor : UIColor.black,
        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)
        
    ])
    
   // @objc func goToGainLossScreen (){
     //   let gainloss = GainOrLoss()
       // navigationController?.pushViewController(gainloss, animated:true)
   // }

}
