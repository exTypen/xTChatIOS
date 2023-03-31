//
//  LoginViewModel.swift
//  xTChat
//
//  Created by Yasir Kılınç on 31.03.2023.
//

import Foundation

extension LoginView{
    @MainActor class LoginViewModel:ObservableObject{
        @Published var loginModel:LoginModel = LoginModel(userName: "", password: "")
        @Published var isLogged:Bool = false
        
        func login(){
            print(loginModel)
            
            let url = ""
            
            
            if loginModel.userName == "exTypen"{
                print("success")
                isLogged = true
            }
        }
    }
}
