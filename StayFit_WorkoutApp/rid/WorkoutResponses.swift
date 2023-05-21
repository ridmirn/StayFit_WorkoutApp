//
//  WorkoutResponses.swift
//  StayFit_WorkoutApp
//
//  Created by Ridmi Natasha on 2023-05-21.
//

import UIKit

struct WorkoutResponses: Codable {
    let Workouts: [Workout]

    private enum CodingKeys: String, CodingKey {
        case Workouts = "documents"
    }
}

struct StringValue: Codable {
    let value: String

    private enum CodingKeys: String, CodingKey {
        case value = "stringValue"
    }
}

struct Workout: Codable {
    let WorkoutName: String
    let Category: String
    let Desc: String
    let url: String
   //let Calories: String

    private enum WorkoutKeys: String, CodingKey {
        case fields
    }

    private enum FieldKeys: String, CodingKey {
        case WorkoutName
        case Category
        case url
        case Desc
      // case Calories
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: WorkoutKeys.self)
        let fieldContainer = try container.nestedContainer(keyedBy: FieldKeys.self, forKey: .fields)

        WorkoutName = try fieldContainer.decode(StringValue.self, forKey: .WorkoutName).value
        Category = try fieldContainer.decode(StringValue.self, forKey: .Category).value
        Desc = try fieldContainer.decode(StringValue.self, forKey: .Desc).value
        url = try fieldContainer.decode(StringValue.self, forKey: .url).value
       // Calories = try fieldContainer.decode(StringValue.self, forKey: .Calories).value

    }
}


