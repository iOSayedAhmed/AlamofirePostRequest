//
//  UserAPI.swift
//  AlamofirePostRequest
//
//  Created by Develop on 2/17/22.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class UserAPI {
   
    
    static func regestirNewUser(firstName:String, lastName:String, email: String, completionHandler: @escaping (User?,String?)->()){
        
         let params = [
               "firstName":firstName,
               "lastName":lastName,
               "email":email
           ]
           let headers: HTTPHeaders = [
                    "app-id": "62036cf6322f55adfd3ba956"
                ]
        AF.request("https://dummyapi.io/data/v1/user/create",method: .post, parameters: params,encoder: JSONParameterEncoder.default, headers: headers).validate().responseJSON { response in
                   switch response.result {
                   case .success :
                       print("Successful ")

                   let jsonData = JSON(response.value)
                      let decoder = JSONDecoder()
                      do {
                          let user = try decoder.decode(User.self, from: jsonData.rawData())
                         completionHandler(user,nil)
                      }
                      catch let error{
                          print(error)
                      }
                   case .failure(let error):
                       let jsonData = JSON(response.data)
                       let errorMessage = jsonData["data"]
                       let email = errorMessage["email"].stringValue
                        completionHandler(nil,email)
                       //print(jsonData["data"]["email"].stringValue)
                   }
               
                   
                   
               }
               
           }
    }

