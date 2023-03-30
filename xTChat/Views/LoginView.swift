//
//  LoginView.swift
//  xTChat
//
//  Created by Yasir Kılınç on 29.03.2023.
//

import SwiftUI


struct LoginView: View {
    
    @State private var userName: String = ""
    @State private var password: String = ""
    @State var isLogged:Bool = false
    
    var body: some View {
        NavigationStack{
            
            ZStack{
                Color.blue.ignoresSafeArea()
                VStack{
                    Text("xT")
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                    
                    
                    TextField(
                        "Kullanıcı Adı",
                        text: $userName
                    )
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(.white)
                    .cornerRadius(10)
                    .textInputAutocapitalization(.never)
                    
                    
                    SecureField(
                        "Şifre",
                        text: $password
                    )
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(.white)
                    .cornerRadius(10)
                    .textInputAutocapitalization(.never)
                    
                    
                    
                    Button("Giriş Yap"){
                        login()
                    }
                    .foregroundColor(.blue)
                    .frame(width: 300, height: 50)
                    .background(.white)
                    .cornerRadius(10)
                    
                    
                }
            }
            .navigationDestination(isPresented: $isLogged){
                MainView()
            }
        }
        
        .navigationBarBackButtonHidden(true)
    }
    
    func login(){
        if userName == "exTypen" && password == "123"{
            isLogged = true
            print("okey")
        }else{
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
