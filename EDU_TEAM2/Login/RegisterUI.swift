//
//  RegisterUI.swift
//  EDU_TEAM2
//
//  Created by Adimas Surya Perdana Putra on 26/10/21.
//

import SwiftUI

struct RegisterUI: View {
    @Binding var isClosedRegister: Bool
    @Binding var isClosedLogin: Bool
    @EnvironmentObject var viewModel:AppViewModel
    @State private var showToastAlert = false
    var body: some View {
        VStack{
            if viewModel.signedIn{
                ContentView()
            }else{
                Register(isClosedRegister: $isClosedRegister, isClosedLogin: $isClosedLogin)
            }
        }
        .onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

//struct RegisterUI_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterUI()
//    }
//}

struct Register : View {
    @EnvironmentObject var viewModel: AppViewModel
    @State var username : String = ""
    @State var password : String = ""
    @State var email : String = ""
    @State var confirmpassword : String = ""
    @Binding var isClosedRegister : Bool
    @Binding var isClosedLogin : Bool
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue:244.0/255.0, opacity: 1.0)
    
    var body : some View {
        ZStack{
            Color.white
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        isClosedRegister = false
                        
                    }) {
                        Image(systemName: "xmark.circle.fill").resizable().frame(width: 25, height: 25).foregroundColor(Color.gray)
                    }
                }.padding()
                HStack{
                    Text("Daftar")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(Color.black)
                    
                    
                }
                .background(Color.white)
                .edgesIgnoringSafeArea(.top)
                .padding(.bottom, 50)
                
                //form Files
                
                VStack(alignment: .leading, spacing:20){
                    
                    TextField("Nama Lengkap", text: $username).modifier(TextFieldClearButton(text: $username))
                        .disableAutocorrection(true)
                        .frame(height: 60)
                        .padding(.horizontal)
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray).opacity(0.3))
                    
                    TextField("Email", text: $email).modifier(TextFieldClearButton(text: $email))
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .frame(height: 60)
                        .padding(.horizontal)
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray).opacity(0.3))
                    
                    //                    Text("Password")
                    SecureField("Kata Sandi", text: $password).modifier(TextFieldClearButton(text: $password))
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .frame(height: 60)
                        .padding(.horizontal)
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray).opacity(0.3))
                    
                    SecureField("Konfirmasi Kata Sandi", text: $confirmpassword).modifier(TextFieldClearButton(text: $confirmpassword))
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .frame(height: 60)
                        .padding(.horizontal)
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray).opacity(0.3))
                    Spacer(minLength: 20)
                    
                    
                }.padding(.horizontal)
                
                VStack{
                    Button(action:{
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        viewModel.signUp(nama: username, email: email, password: password)
                        
                        
                    }){
                        Spacer()
                        HStack{
                            Text("Daftar")
                                .bold()
                                .font(.callout)
                                .foregroundColor(.white)
                            
                                .padding(.horizontal)
                        }.frame(width: 350, height: 50)
                            .background(Color(hex: "638ECC"))
                            .cornerRadius(10)
                        Spacer()
                    }
                    
                    
                    
                    
                    SignInWithApple()
                        .padding(.horizontal,5)
                    
                    
                    HStack{
                        Text("Sudah memiliki akun?").opacity(0.5).font(.system(size: 14))
                        Button(action:{
                            isClosedLogin = true
                            isClosedRegister = false
                        }){
                            Text("Masuk")
                                .bold()
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: "638ECC"))
                        }
                    }
                }.padding(.bottom,30)
                
            }
            
            Spacer()
        }
    }
}
