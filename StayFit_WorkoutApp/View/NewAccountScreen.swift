//
//  NewAccountScreen.swift
//  StayFit_WorkoutApp
//
//  Created by Ridmi Natasha on 2023-05-08.
//

import UIKit
import Firebase
import FirebaseAuth

class NewAccountScreen: UIViewController {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "CREATE ACCOUNT"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
        
    }()
    let CAname: UITextField = {
        let textfield = UITextField()
        textfield.keyboardType = .emailAddress
        textfield.layer.cornerRadius = 8
        textfield.layer.masksToBounds = true
        textfield.layer.borderWidth = 1.0
        textfield.textAlignment = .center
        return textfield
    }()
    
    let CAappleid: UITextField = {
        let textfield = UITextField()
        textfield.keyboardType = .emailAddress
        textfield.layer.cornerRadius = 8
        textfield.layer.masksToBounds = true
        textfield.layer.borderWidth = 1.0
        textfield.textAlignment = .center
        return textfield
    }()
    
    let CApassword: UITextField = {
        let textfield = UITextField()
        textfield.keyboardType = .emailAddress
        textfield.layer.cornerRadius = 8
        textfield.layer.masksToBounds = true
        textfield.layer.borderWidth = 1.0
        textfield.isSecureTextEntry = true
        textfield.textAlignment = .center
        return textfield
    }()
    let CreateNewAccountutton: UIButton = {
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
        setname()
        setappleID()
        setPassword()
        setCreateAccountButton()
        setLabel()

    }
    
    func setLabel(){
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    }
    func setname (){
        view.addSubview(CAname)
        CAname.backgroundColor = UIColor.FieldColor
        CAname.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
  
        CAname.translatesAutoresizingMaskIntoConstraints = false
        CAname.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  30).isActive = true
        CAname.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -30).isActive = true
        CAname.heightAnchor.constraint(equalToConstant: 50).isActive = true
        CAname.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
    
    }
    func setappleID (){
        view.addSubview(CAappleid)
        CAappleid.backgroundColor = UIColor.FieldColor
        CAappleid.attributedPlaceholder = NSAttributedString(string: "Apple ID", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
  
        CAappleid.translatesAutoresizingMaskIntoConstraints = false
        CAappleid.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  30).isActive = true
        CAappleid.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -30).isActive = true
        CAappleid.heightAnchor.constraint(equalToConstant: 50).isActive = true
        CAappleid.topAnchor.constraint(equalTo: CAname.bottomAnchor, constant: 30).isActive = true
    
    }
    
    func setPassword (){
        view.addSubview(CApassword)
        CApassword.backgroundColor = UIColor.FieldColor
        CApassword.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
  
        CApassword.translatesAutoresizingMaskIntoConstraints = false
        CApassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  30).isActive = true
        CApassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -30).isActive = true
        CApassword.heightAnchor.constraint(equalToConstant: 50).isActive = true
        CApassword.topAnchor.constraint(equalTo: CAappleid.bottomAnchor, constant: 30).isActive = true
    
    }
    func setCreateAccountButton(){
            view.addSubview(CreateNewAccountutton)
           CreateNewAccountutton.backgroundColor = UIColor.AppColor
            CreateNewAccountutton.setAttributedTitle(customNewAccountButton, for: .normal)
        CreateNewAccountutton.addTarget(self, action:#selector(creactAccountTapped), for: .touchUpInside)
      
        CreateNewAccountutton.translatesAutoresizingMaskIntoConstraints = false
        CreateNewAccountutton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  30).isActive = true
        CreateNewAccountutton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -30).isActive = true
        CreateNewAccountutton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        CreateNewAccountutton.topAnchor.constraint(equalTo: CApassword.bottomAnchor, constant: 40).isActive = true
        }
    let customNewAccountButton = NSMutableAttributedString(string: "Create Account", attributes: [
        NSAttributedString.Key.foregroundColor : UIColor.black,
        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)
        
    ])

    
    @objc func creactAccountTapped(){
        let username = CAname.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = CAappleid.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = CApassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      
        Auth.auth().createUser(withEmail: email, password: password ){(result, err) in
            
            if err != nil {
          
                self.showError("error creating a user")
            }
            else{
                let db = Firestore.firestore()
                db.collection("User_login").addDocument(data: ["name":username,"uid":result!.user.uid]) { (error) in
                    
                    if error != nil {
                        self.showError("Error saving user data")
                    }
                }
                ///hworkout
                self.workoutGoalScreen()
            }
        
        }
    }
    func showError(_ message: String){
        DispatchQueue.main.async{
            let alterController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alterController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present (alterController, animated: true, completion: nil)
            
        }
    }
    
    func workoutGoalScreen (){
        let gainloss = WorkoutGoalScreen()
         navigationController?.pushViewController(gainloss, animated:true)
        
    }

}
