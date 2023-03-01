//
//  AfterLogin.swift
//  EDU_TEAM2
//
//  Created by Adimas Surya Perdana Putra on 02/11/21.
//

import SwiftUI
//import Firebase
import FirebaseAuth

struct AfterLogin: View {
    var body: some View {
        FirstPage()
    }
}

struct AfterLogin_Previews: PreviewProvider {
    static var previews: some View {
        AfterLogin()
    }
}

struct FirstPage: View {
    @EnvironmentObject var viewModel:AppViewModel
    @AppStorage("log_status") var log_Status = false
     var body: some View {
        VStack{
            Text("You are Sign In!")
//                                        Button(action: {
//
//                                            DispatchQueue.global(qos: .background).async {
//                                                try? Auth.auth().signOut()
//                                            }
//
//                                            withAnimation(.easeInOut){
//                                                log_Status = false
//                                            }
//
//                                            viewModel.signOut()
//
//                                        }){
//                                            Image(systemName: "arrowshape.turn.up.right.circle")
//                                        }
//                )
            Button(action: {
                DispatchQueue.global(qos: .background).async {
                    try? Auth.auth().signOut()
                }
                
                withAnimation(.easeInOut){
                    log_Status = false
                }
                
                viewModel.signOut()
            }, label: {
                Text("Sign Out")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                
            })
        }
    }
}
