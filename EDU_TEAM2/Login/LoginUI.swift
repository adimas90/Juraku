//
//  ContentView.swift
//  Testing
//
//  Created by Adimas Surya Perdana Putra on 05/10/21.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject{
    
    let auth = Auth.auth()
    
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser !== nil
    }
    
    //fungsi untuk login
    
    func signIn(nama: String, email: String, password: String){
        let defaults = UserDefaults.standard
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            //success
            DispatchQueue.main.async {
                self?.signedIn = true
                defaults.set(email, forKey: "Email")
                print(email)
            }
        }
    }
    
    func signUp(nama: String, email: String, password: String){
        let defaults = UserDefaults.standard
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
                defaults.set(nama, forKey: "Nama")
                defaults.set(email, forKey: "Email")
                print("test \(nama)")
                print("test \(email)")
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
    
}

struct LoginUI: View {
//    @EnvironmentObject var userAuth : AuthUser
    @Binding var isClosedRegister: Bool
    @Binding var isClosedLogin: Bool
    @EnvironmentObject var viewModel:AppViewModel
    @State private var showToastAlert = false
    var body: some View {
        VStack{
            if viewModel.signedIn{
                ContentView()
            }else{
                Login(isClosedRegister: $isClosedRegister, isClosedLogin: $isClosedLogin)
            }
        }
        .onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct Home: View {
    @EnvironmentObject var viewModel:AppViewModel
//    @EnvironmentObject var userAuth : AuthUser
    var body: some View {
        NavigationView{
            ZStack{
                Color.blue
                Text("Home")
                    .foregroundColor(.white)
                
                    .navigationBarTitle("Home", displayMode: .inline)
                    .navigationBarItems(trailing:
                                            Button(action: {}){
                            Image(systemName: "arrowshape.turn.up.right.circle")
                        }
                    )
            }
        }
    }
}

struct Login: View {
//    @EnvironmentObject var userAuth : AuthUser
    @EnvironmentObject var viewModel: AppViewModel
    @State var email : String = ""
    @State var password : String = ""
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
                        isClosedLogin = false
                        
                    }) {
                        Image(systemName: "xmark.circle.fill").resizable().frame(width: 25, height: 25).foregroundColor(Color.gray)
                    }
                }.padding()
                VStack{
                                Text("Masuk")
                                    .bold()
                                    .font(.largeTitle)
                                    .foregroundColor(Color.black)
                                    .padding(.bottom,120)
                                
                    VStack(alignment: .leading){
                        VStack{
                            TextField("Username/E-Mail", text: $email).modifier(TextFieldClearButton(text: $email))
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .frame(height: 60)
                                .padding(.horizontal)
                                .cornerRadius(16)
                                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray).opacity(0.3))
                            Text("")
                            SecureField("Kata Sandi", text: $password).modifier(TextFieldClearButton(text: $password))
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .frame(height: 60)
                                .padding(.horizontal)
                                .cornerRadius(16)
                                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray).opacity(0.3))
                        }.padding(.horizontal)
                        
                      
                        
                        HStack{
                            Spacer()
                            Button(action: {
                                
                            }, label: {
                                Text("Lupa Kata Sandi?").font(.system(size: 12))
                            })
                            
                            
                        }.padding(.horizontal)
                        Spacer()
                        VStack{
                            HStack{
                                Button(action:{
                                    guard !email.isEmpty, !password.isEmpty else {
                                        return
                                    }
                                    viewModel.signIn(nama: nama ?? "", email: email, password: password)
                                }){
                                    Text("Masuk")
                                        .bold()
                                        .font(.callout)
                                        .foregroundColor(.white)
                                        .frame(width: 350, height: 50)
                                        .background(Color(hex: "638ECC"))
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                }
                                
                            }
                            
                            
                            SignInWithApple()
                                .padding(.horizontal,5)
                            
                            HStack{
                                Spacer()
                                Text("Belum memiliki akun?").opacity(0.5).font(.system(size: 14))
                                
                                Button(action:{
                                    isClosedLogin = false
                                    isClosedRegister = true
                                }){
                                    Text("Daftar")
                                        .bold().font(.system(size: 14))
                                        .foregroundColor(Color(hex: "638ECC"))
                                }
                                
                                Spacer()
                            }
                        }.padding(.bottom,30)
                        
                    }
                }
            }
            
        }
    }
}

//
//struct ErrorAlert: View {
//    var body: some View {
//        NavigationLink("Coba lagi", destination:Login(, isClosedRegister:))
//    }
//}



//struct LoginUI_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginUI()
//    }
//}




