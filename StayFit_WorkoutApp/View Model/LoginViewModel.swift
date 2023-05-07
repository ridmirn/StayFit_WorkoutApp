//
//  LoginViewModel.swift
//  StayFit_WorkoutApp
//
//  Created by Ridmi Natasha on 2023-05-07.
//


//import FirebaseAuth
import FirebaseAuth

class LoginViewModel {
    
    var email: String = ""
    var password: String = ""
    
    func UserLogin(completion: @escaping(Bool, Error?) -> Void){
        Auth.auth().signIn(withEmail: email, password: password){ _, error in
            if let error = error{
                completion(false, error)
            }else{
                completion(true, nil)
            }
            
        }    }
}
