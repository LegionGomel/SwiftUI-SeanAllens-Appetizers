//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Yuri Ershov on 6.01.22.
//

import UIKit


// Singleton
final class NetworkManager {
    
    static let shared =  NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let  baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    
    /* Once that is completed, we have a Result. It have an array of appetizers, or an
     Error in a failure case.
     */
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        
        // checking URL to exist
        guard let url = URL(string: appetizerURL) else {
            // call completion handler and passing in an Error
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, responce, error in
            // Unwrapping data, responce, error as they are optionals
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            // Casting as HTTPURLResponce to get a specfic code here, and checking status code
            // if there is all ok (code 200)
            guard let responce = responce as? HTTPURLResponse, responce.statusCode == 200 else {
                completed(.failure(.invalidResponce))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponce = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponce.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        // Checking a cache to see if we have an object(image)
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        // Ckeck for a valid URL from string
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        // if no image in cache, create task from URLSession to get image
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, responce, error in
            
            // Check for a good data
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            // If everything OK, set the image in a cache
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
