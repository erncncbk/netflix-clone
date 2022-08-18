//
//  APICaller.swift
//  qNetflixClone
//
//  Created by Erencan on 9.08.2022.
//

import Foundation

struct Constant {
    static let API_KEY = "b2da8524c4f8c9331830750755a373ed"
    static let baseURL = "https://api.themoviedb.org"
}

class APICaller{
    static let shared = APICaller()
    
    
    func getTrendingMovies(completion: @escaping (String) ->Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/trending/all/day?api_key=\(Constant.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data,_,error in
            guard let data = data,error == nil else {
                return
            }
            do{
                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results)
            }catch{
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
}
