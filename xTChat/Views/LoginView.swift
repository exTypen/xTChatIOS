//
//  LoginView.swift
//  xTChat
//
//  Created by Yasir Kılınç on 29.03.2023.
//

import SwiftUI


struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            
            ZStack{
                Color.blue.ignoresSafeArea()
                VStack{
                    Text("xT")
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                    
                    Group{
                        TextField(
                            "Kullanıcı Adı",
                            text: $viewModel.loginModel.userName
                        )
                        
                        SecureField(
                            "Şifre",
                            text: $viewModel.loginModel.password
                        )
                    }
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(.white)
                    .cornerRadius(10)
                    .textInputAutocapitalization(.never)
                    
                    
                    Text(viewModel.error)
                        .foregroundColor(.red)
                    
                    
                    Button("Giriş Yap"){
                        viewModel.login()
                    }
                    .foregroundColor(.blue)
                    .frame(width: 300, height: 50)
                    .background(.white)
                    .cornerRadius(10)
                    
                    
                }
            }
            .navigationDestination(isPresented: $viewModel.isLogged){
                MainView()
            }
        }
        
        .navigationBarBackButtonHidden(true)
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
