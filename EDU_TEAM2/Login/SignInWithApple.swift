//
//  SignInWithApple.swift
//  EDU_TEAM2
//
//  Created by Adimas Surya Perdana Putra on 03/11/21.
//

import SwiftUI
import AuthenticationServices

struct SignInWithApple: View {
    
    @StateObject var loginData = LoginViewModel()
    
    var body: some View {
        SignInWithAppleButton { (request) in
            
            loginData.nonce = randomNonceString()
            request.requestedScopes =  [.email, .fullName]
            request.nonce = sha256(loginData.nonce)
            
        } onCompletion: { (result) in
            
            switch result{
            case .success(let user):
                print("success")
                guard let credential = user.credential as? ASAuthorizationAppleIDCredential else{
                    print("error with firebase")
                    return
                }
                loginData.autheticate(credential: credential)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        .signInWithAppleButtonStyle(.black)
        .frame(height: 50)
        .cornerRadius(10)
        .padding()
    }
}

struct SignInWithApple_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithApple()
    }
}

