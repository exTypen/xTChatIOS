//
//  ApiManager.swift
//  xTChat
//
//  Created by Yasir Kılınç on 31.03.2023.
//

import Foundation
import Alamofire

class NetworkManager{
    
    static let shared = NetworkManager()
    
    func get<T:Codable>(type:T.Type, url:String, comletion: @escaping((Result<T, ErrorTypes>)->())) {
        let session = URLSession.shared
        if let url = URL(string: url){
            var request = URLRequest(url: url)
            request.httpMethod = HTTPMethods.get.rawValue
            
            let dataTask = session.dataTask(with: request) { data, response, error in
                if let _ = error {
                    comletion(.failure(ErrorTypes.generalError))
                } else if let data = data {
                    self.handlResponse(data: data){response in
                        comletion(response)
                    }
                } else{
                    comletion(.failure(ErrorTypes.invalidUrl))
                }
            }
            dataTask.resume()
        }
    }
    
    func post<T:Codable>(type:T.Type, url:String, parameters:[String:Any], completion: @escaping((Result<T, ErrorTypes>)->())) {
        let session = URLSession.shared
        if let url = URL(string: url){
            var request = URLRequest(url: url)
            request.httpMethod = HTTPMethods.post.rawValue
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
              
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
                return
            }
            
            let dataTask = session.dataTask(with: request) { data, response, error in
                if let _ = error {
                    completion(.failure(ErrorTypes.generalError))
                } else if let data = data {
                    self.handlResponse(data: data){response in
                        completion(response)
                    }
                } else{
                    completion(.failure(ErrorTypes.invalidUrl))
                }
            }
            dataTask.resume()
        }
    }
    
   
    
    fileprivate func handlResponse<T:Codable>(data: Data, comletion: @escaping((Result<T, ErrorTypes>)->())) {
        do{
            let result = try JSONDecoder().decode(T.self, from: data)
            comletion(.success(result))
        }catch{
            comletion(.failure(ErrorTypes.invalidData))
        }
    }
}
