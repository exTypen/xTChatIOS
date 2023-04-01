//
//  LoginViewModel.swift
//  xTChat
//
//  Created by Yasir Kılınç on 31.03.2023.
//

import Foundation
import Alamofire


extension LoginView{
    
    struct User:Encodable, Decodable{
        var id:Int
        var userName:String
        var apiKey:String
        var balance:Int
    }
    
    @MainActor class LoginViewModel:ObservableObject{
        @Published var loginModel:LoginModel = LoginModel(userName: "", password: "")
        @Published var isLogged:Bool = false
        @Published var error:String = ""
    
            
        func login(){            
            NetworkManager.shared.post(type: SingleResponseModel<TokenModel>.self, url: SecuredConstants().baseApiUrl + "api/Auth/login", parameters: ["userName": loginModel.userName, "password": loginModel.password]) { result in
                DispatchQueue.main.async {
                    switch result{
                    case .success(let response):
                        switch response.success{
                        case true:
                            self.isLogged = true
                            self.error = ""
                        case false:
                            self.isLogged = false
                            self.error = response.message
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            }

        }
    }
}
