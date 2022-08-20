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

enum APIError: Error{
    case failedToGetData
}

class APICaller{
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie],Error>) ->Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/trending/all/day?api_key=\(Constant.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data,_,error in
            guard let data = data,error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(results.results))
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
               
            }catch{
                completion(.failure(APIError.failedToGetData))
            }
            
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Movie], Error>) -> Void){
        guard let url = URL(string: "\(Constant.baseURL)/3/trending/tv/day?api_key=\(Constant.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with:  URLRequest(url: url)){ data,_,error in
            guard let data = data,error == nil else { return }
            do{
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                
                completion(.success(results.results))
                
            }catch{
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/movie/upcoming?api_key=\(Constant.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,_,error in
            guard let data = data,error == nil else {return}
            do{
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/movie/popular?api_key=\(Constant.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,_,error in
            guard let data = data,error == nil else {return}
            do{
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getTopRated(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/movie/top_rated?api_key=\(Constant.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,_,error in
            guard let data = data,error == nil else {return}
            do{
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
}
