//
//  ProfilView.swift
//  EDU_TEAM2
//
//  Created by Winner Tjandrawan on 26/10/21.
//

import SwiftUI

struct ProfilView: View {
    init(halamanTes : Binding<Bool>,i : Binding<Int>, result : Binding<[String:Double]>, LJK : Binding<[Int]>, sudahTes : Binding<String>) {
        UITableView.appearance().sectionFooterHeight = 0
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = .white
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        self._halamanTes = halamanTes
        self._i = i
        self._result = result
        self._LJK = LJK
        self._sudahTes = sudahTes
    }
    @State private var namaUser : String = ""
    let defaults = UserDefaults.standard
    @EnvironmentObject var viewModel:AppViewModel
    @State var nama: String = UserDefaults.standard.string(forKey: "Nama") ?? ""
    @State var email: String = UserDefaults.standard.string(forKey: "Email") ?? ""
    @State var foto = UserDefaults.standard.data(forKey: "Foto")
    @State var image = UIImage()
    @State var sudahLogin = true
    @State var registerPage = false
    @State var loginPage = false
    @StateObject var myRekomen:RekomendasiJurusan = RekomendasiJurusan()
    @Binding var halamanTes: Bool
    @Binding var i : Int
    @Binding var result: [String:Double]
    @Binding var LJK : [Int]
    @Binding var sudahTes : String
    
    
    var body: some View {
        NavigationView{
            ZStack{
                if registerPage{
                    Rectangle().fullScreenCover(isPresented: $registerPage) {
                        RegisterUI(isClosedRegister: $registerPage, isClosedLogin: $loginPage)
                    }
                }else if loginPage{
                    Rectangle().fullScreenCover(isPresented: $loginPage) {
                        LoginUI(isClosedRegister: $registerPage, isClosedLogin: $loginPage)
                    }
                }
                VStack{
                    if (sudahLogin == false){
                        VStack{
                            VStack{
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                
                                Text("Daftar untuk Melanjutkan")
                                    .font(.headline)
                                    .bold()
                                    .padding(.top,5)
                                
                                
                                Text("Segera daftar untuk dapat mengakses fitur tes minat dan pelajaran!")
                                    .multilineTextAlignment(.center)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.top,5)
                            }.padding(.horizontal, 20)
                                .padding(.top,50)
                            
                            
                            Spacer()
                            VStack{
                                Button("Daftar"){
                                    registerPage = true
                                    //RegisterUI()
                                }.frame(width: UIScreen.main.bounds.width - 40,height: 50)
                                .font(.subheadline.bold())
                                    .background(Color(hex: "638ECC"))
                                    .border(Color(hex: "0079FF"), width: 1)
                                    .accentColor(.white)
                                    .cornerRadius(10.0)
                                HStack{
                                    Text("Sudah memiliki akun?").foregroundColor(.gray).font(.system(size: 14))
                                    Button("Masuk", action: {
                                        loginPage = true
                                    }).accentColor(Color(hex: "638ECC")).font(.system(size: 14))
                                    
                                }.font(.callout)
                                    .padding(.top,10)
                            }.padding(.top)
                        }
                        .padding(20)
                        .padding(.vertical, 50)
                        .background(Color.white)
                    }
                    else if (sudahLogin == true){
                        VStack{
                            NavigationLink(destination: EditProfil(nama: $nama, email: $email, image: $image)){
                                HStack{
                                    Image(uiImage: self.image)
                                        .resizable()
                                        .frame(width: 72, height: 72)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.black, lineWidth: 1))
                                    VStack(alignment: .leading){
                                        Spacer(minLength: 10)
                                        Text(nama).font(.title2)
                                        Spacer(minLength: 5)
                                        Text(email).foregroundColor(.gray).font(.footnote)
                                        Spacer(minLength: 10)
                                    }
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color(hex: "999999"))
                                }
                                .padding()
                                .frame(height: 92)
                                .background(Color.white)
                                .cornerRadius(10)
                            }.foregroundColor(.black)
                            
                            if(sudahTes == "false"){
                                NavigationLink(destination: TestHomeView(i: $i, result: $result, LJK: $LJK,halamanTes: $halamanTes, sudahTes: $sudahTes),isActive: $halamanTes){
//
                                }
                                
                                Button() {
                                    halamanTes = true
                                } label: {
                                    VStack{
                                        HStack{
                                            Image(systemName: "brain")
                                            Text("Hasil Tes RIASEC")
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(Color(hex: "999999"))
                                        }
                                        HStack{
                                            Text("Klik untuk mengambil Tes").foregroundColor(Color(hex: "777777")).font(.caption)
                                            Spacer()
                                        }.padding(.top,1)
                                            .padding(.bottom,-5)
                                        
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .foregroundColor(.black)
                                }.padding(.top,10)

                            }
                            else if(sudahTes == "true"){
                                NavigationLink(destination: HasilTesView(halamanTes: $halamanTes,i: $i, result: $result, LJK: $LJK, sudahTes: $sudahTes)){
                                    VStack{
                                        HStack{
                                            Image(systemName: "brain")
                                            Text("Hasil Tes RIASEC")
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(Color(hex: "999999"))
                                        }
                                        VStack{
                                            //Skor RIASEC Baris pertama
                                            HStack{
                                                //Kolum pertama
                                                VStack{
                                                    if let resultsorted = myRekomen.riasecSorting() as? [[String]]{
                                                        Text("\(resultsorted[0][0])").font(.largeTitle).bold()
                                                        Text(TextRiasec(riasec: "\(resultsorted[0][0])")).font(.caption).foregroundColor(.gray).bold()
                                                        let mydouble = Double(resultsorted[0][1])
                                                        Text(String(format: "%.0f", mydouble ?? 0)).font(.caption).foregroundColor(.gray)
                                                    }else {
                                                        Text("??").font(.largeTitle).bold()
                                                        Text("??").font(.caption).foregroundColor(.gray).bold()
                                                        Text("??").font(.caption).foregroundColor(.gray)
                                                    }
                                                    
                                                }.frame(width: 85, alignment: .center)
                                                Divider().frame(height: 80)
                                                //Kolum Kedua
                                                VStack{
                                                    if let resultsorted = myRekomen.riasecSorting() as? [[String]]{
                                                        Text("\(resultsorted[1][0])").font(.largeTitle).bold()
                                                        Text(TextRiasec(riasec: "\(resultsorted[1][0])")).font(.caption).foregroundColor(.gray).bold()
                                                        let mydouble = Double(resultsorted[1][1])
                                                        Text(String(format: "%.0f", mydouble ?? 0)).font(.caption).foregroundColor(.gray)
                                                    } else {
                                                        Text("??").font(.largeTitle).bold()
                                                        Text("??").font(.caption).foregroundColor(.gray).bold()
                                                        Text("??").font(.caption).foregroundColor(.gray)
                                                    }
                                                }.frame(width: 85, alignment: .center)
                                                Divider().frame(height: 80)
                                                //Kolum Ketiga
                                                    VStack{
                                                        if let resultsorted = myRekomen.riasecSorting() as? [[String]]{
                                                            Text("\(resultsorted[2][0])").font(.largeTitle).bold()
                                                            Text(TextRiasec(riasec: "\(resultsorted[2][0])")).font(.caption).foregroundColor(.gray).bold()
                                                            let mydouble = Double(resultsorted[2][1])
                                                            Text(String(format: "%.0f", mydouble ?? 0)).font(.caption).foregroundColor(.gray)
                                                        }else {
                                                            Text("??").font(.largeTitle).bold()
                                                            Text("??").font(.caption).foregroundColor(.gray).bold()
                                                            Text("??").font(.caption).foregroundColor(.gray)
                                                        }
                                                    }.frame(width: 85, alignment: .center)
                                            }
                                            .padding(.top,-5)
                                            
                                            Text("Terakhir tes pada \(UserDefaults.standard.string(forKey: "Tanggal") ?? "")").font(.caption).foregroundColor(.gray)
                                        }
                                        .background(Color.white)
                                        .cornerRadius(10)
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .onAppear(){
                                        sudahTes = UserDefaults.standard.string(forKey: "SudahTes") ?? "false"
                                        myRekomen.i = LoadScore(quiz: "lastScore")
                                        myRekomen.result = LoadResult(quiz: "lastResult")
                                        myRekomen.LJK = LoadLJK(quiz: "lastLJK")
                                        myRekomen.calculateResult()
                                    }
                                }.foregroundColor(.black)
                            }
                            
                            NavigationLink(destination: PelajaranView()){
                                HStack{
                                    Image(systemName: "books.vertical")
                                    Text("Pelajaran Saya")
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color(hex: "999999"))
                                }
                                .padding()
                                .frame(height: 40)
                                .background(Color.white)
                                .cornerRadius(10)
                            }.foregroundColor(.black)
                            
                            Spacer()
                            
                            Button("Keluar"){
                                viewModel.signOut()
                                sudahLogin = false
                                DispatchQueue.main.async {
                                    defaults.set("", forKey: "Email")
                                    defaults.set("", forKey: "Nama")
                                    print(UserDefaults.standard.string(forKey: "Email") ?? "")
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width - 40,height: 50)
                            .font(.subheadline.bold())
                            .background(Color(hex: "C14D3F"))
                            .accentColor(.white)
                            .cornerRadius(10.0)
                        }
                        .padding(20)
                    }
                }
                .background(Color.init(hex: "F2F2F6"))
                .navigationBarTitle("Profil")
            }
            
        }
        .background(Color.init(hex: "F2F2F6"))
        .accentColor(Color(hex: "638ECC"))
        .onAppear(perform: {
            print("sudahTes")
            if let data = UserDefaults.standard.data(forKey: "Foto"){
                let decoded = try! PropertyListDecoder().decode(Data.self, from: data)
                self.image = UIImage(data: decoded)!
                
            }
            else{
                self.image = UIImage(systemName: "person.fill")!
            }
            email = UserDefaults.standard.string(forKey: "Email") ?? ""
            if email == ""{
                sudahLogin = false
            }else{
                sudahLogin = true
            }
        })
    }
    
    func TextRiasec(riasec : String)-> String{
        if riasec == "R" {
            return "Realistic"
        }else if riasec == "I"{
            return "Investigative"
        }else if riasec == "A"{
            return "Artistic"
        }else if riasec == "S"{
            return "Social"
        }else if riasec == "E"{
            return "Enterprising"
        }else{
            return "Conventional"
        }
    }
}


