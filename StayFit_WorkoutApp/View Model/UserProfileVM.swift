//
//  UserProfileVM.swift
//  StayFit_WorkoutApp
//
//  Created by Ridmi Natasha on 2023-05-10.
//

import Foundation
import Firebase

class UserProfileViewModel: ObservableObject{
    @Published var user: User = User(age: "" , weight: "", height:"" )
    
    private var db = Firestore.firestore()
    
    func addUser(user: User){
        do{
            let _ = try db.collection("User_login").addDocument(from: user)
        }
        catch {
            print(error)
        }
    }
    
    func save(){
        addUser(user: user)
    }
}

