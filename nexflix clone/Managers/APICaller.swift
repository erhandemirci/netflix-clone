//
//  APICaller.swift
//  nexflix clone
//
//  Created by erhan demirci on 22.04.2022.
//

import Foundation

struct Constants {
    static let API_KEY = "8c0394f0747bfda19eeca5e83186466b"
    static let baseUrl = "https://api.themoviedb.org"
}
enum APIError: Error
{
    case failedToGetData
}
enum  erhan<asd,ddf>
{
    case asd
    case ddf
}
class APICaller{
    static let shared = APICaller()
    
    func getTd(complation: @escaping (erhan<String,String>)->Void, name:String)
    {
        if name == "erhan"
        {
            complation(.asd)
        }
        else
        {
            complation(.ddf)
        }
        
        
    }
    
    func getTrendingMovies(completion: @escaping (Result<[Title],Error>)->Void ){
        guard let url = URL(string:"\(Constants.baseUrl)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {return}
            
            do {
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results.results[1].original_title)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
                print(error.localizedDescription)
                
            }
           
            
        }
        task.resume()
    }
    func getTrendingTvs(completion:  @escaping (Result<[Title],Error>)->Void)
    {
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {return}
            
            do {
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
                
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
                print(error.localizedDescription)
                
            }
           
        
      
            
        }
        task.resume()
    }
    func getUpcomingMovies(completion:  @escaping (Result<[Title],Error>)->Void)
    {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-Us&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {return}
            
            do {
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
                
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
                print(error.localizedDescription)
                
            }
           
        
      
            
        }
        task.resume()
    }
    func getPopular(completion:  @escaping (Result<[Title],Error>)->Void)
    {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-Us&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {return}
            
            do {
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
                
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
                print(error.localizedDescription)
                
            }
           
        
      
            
        }
        task.resume()
    }
    func getTopRated(completion:  @escaping (Result<[Title],Error>)->Void)
    {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-Us&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {return}
            
            do {
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
                
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
                print(error.localizedDescription)
                
            }
           
        
      
            
        }
        task.resume()
    }
    func getDiscoverMovies(completion:  @escaping (Result<[Title],Error>)->Void)
    {
        guard let url = URL(string: "\(Constants.baseUrl)/3/discover/movie?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {return}
            
            do {
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
                
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
                print(error.localizedDescription)
                
            }
           
        
      
            
        }
        task.resume()
    }
    func getSearch(with query:String, completion:  @escaping (Result<[Title],Error>)->Void)
    {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
    
        guard let url = URL(string: "\(Constants.baseUrl)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {return}
            
            do {
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
                
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedToGetData))
                print(error.localizedDescription)
                
            }
           
        
      
            
        }
        task.resume()
    }

}


