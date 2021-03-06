//
//  ApiManager.swift
//  Ibtikar_Task
//
//  Created by mohamed samir on 01/05/2021.
//

import Foundation
import Alamofire

class APIManager: NSObject {

        // post function
        class func post<T:Codable>(_ url:String,parameter:[String:Any]?,headers:HTTPHeaders?,completion: @escaping (_ check:Bool,_ response:T?)->Void){
            AF.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
                switch response.result {
                    case let .success(value):
                        guard let data = response.data else {print("Can't get data from the server");return}
                        do {
                            let jsonResponse = try JSONDecoder().decode(T.self, from: data)
                            completion(true,jsonResponse)
                        }catch{
                            print(error)
                            completion(false,nil)
                        }
                    case let .failure(error):
                        print("check your internet connection")
                          completion(false,nil)
                }
                
            }
        }
        //get function
        class func get<T:Codable>(url:String,parameter:[String:Any]?,headers:HTTPHeaders?,completion:@escaping(_ check:Bool ,_ response:T?)->Void){
            AF.request(url, method: .get, parameters: parameter, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
                switch response.result {
                    case let .success(value):
                    guard let data = response.data else {print("Can't get data from the server");return}
                    do {
                        let jsonResponse = try JSONDecoder().decode(T.self, from: data)
                        completion(true,jsonResponse)
                    }catch{
                        print(error)
                        completion(false,nil)
                    }
                    case let .failure(error):
                    print("check your internet connection")
                    completion(false,nil)
                }
            }
        }
    
    }
