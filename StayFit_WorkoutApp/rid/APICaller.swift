//
//  APICaller.swift
//  StayFit_WorkoutApp
//
//  Created by Ridmi Natasha on 2023-05-21.
//
import Foundation
struct Constants {
    static let API_KEY = "AIzaSyB2mOzMJ-VuYsJnTjjwe1od9uZMt67B5H8"
    static let baseURL = "https://firestore.googleapis.com/v1/projects"
    static let youtubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()

    // fetching the weightgain
    func getweightgain(completion: @escaping (Result<[Workout],Error>) -> Void){

        guard let url = URL(string: "\(Constants.baseURL)/appworkingout/databases/(default)/documents/Weightgain") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }

            do{
                let results = try JSONDecoder().decode(WorkoutResponses.self, from: data)
                completion(.success(results.Workouts))


        
            }catch {
                completion(.failure(APIError.failedTogetData))
            }

        }

        task.resume()
    }
    
    // fetching the Weightloss data
    func getweightloss(completion: @escaping (Result<[Workout],Error>) -> Void){

        guard let url = URL(string: "\(Constants.baseURL)/appworkingout/databases/(default)/documents/Weightloss") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }

            do{
                let results = try JSONDecoder().decode(WorkoutResponses.self, from: data)
                completion(.success(results.Workouts))


        
            }catch {
                completion(.failure(APIError.failedTogetData))
            }

        }

        task.resume()
    }
    
    
     
}
