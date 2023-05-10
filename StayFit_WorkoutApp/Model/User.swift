//
//  UserProfileModel.swift
//  StayFit_WorkoutApp
//
//  Created by Ridmi Natasha on 2023-05-10.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var age:String
    var weight:String
    var height:String
    
    enum CodingKeys: String, CodingKey {
        case age
        case weight
        case height
    }
}
