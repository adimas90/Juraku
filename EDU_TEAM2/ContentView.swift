//
//  ContentView.swift
//  EDU_TEAM2
//
//  Created by alvin hariyono on 11/10/21.
//

import SwiftUI

struct ContentView: View {
    @State private var onboardinDone = false
    @EnvironmentObject var viewModel:AppViewModel
    var data = OnboardingDataModel.data
    let defaults = UserDefaults.standard
    //
    //
    @State var nama: String = UserDefaults.standard.string(forKey: "Nama") ?? ""
    @State var email: String = UserDefaults.standard.string(forKey: "Email") ?? ""
    @State var sudahOnBoarding: Bool = UserDefaults.standard.bool(forKey: "SudahOnBoarding")
    @State var halamanTes = false
    @State var konfirmasiTes = "false"
    @State var i : Int = LoadScore(quiz: "lastScore")
    @State var result: [String:Double] = LoadResult(quiz: "lastResult")
    @State var LJK : [Int] = LoadLJK(quiz: "lastLJK")
    @State var sudahTes: String = UserDefaults.standard.string(forKey: "SudahTes") ?? "false"
    var body: some View {
        Group {
            if !sudahOnBoarding{
                if !onboardinDone {
                    OnboardingViewPure(data: data, doneFunction: {
                        self.onboardinDone = true
                        defaults.set(true, forKey: "SudahOnBoarding")
                        print("done onboarding")
                    })
                } else {
                    
                    if email != ""{
                        if konfirmasiTes == "true" || sudahTes == "true"{
                            TabView{
                                EksplorasiView(email: $email,halamanTes: $halamanTes,i: $i, result: $result, LJK: $LJK, sudahTes: $sudahTes)
                                    .tabItem {
                                        Image(systemName: "graduationcap.fill")
                                        Text("Eksplorasi")
                                    }
                                ProfilView(halamanTes: $halamanTes,i: $i, result: $result, LJK: $LJK, sudahTes: $sudahTes)
                                    .tabItem{
                                        Image(systemName: "person.fill").renderingMode(.template)
                                        Text("Profil")
                                    }
                            }.accentColor(Color(hex: "638ECC"))
                                .background(Color(hex: "D8D8D8"))
                        }else if konfirmasiTes == "false"{
                            BoardingTesMinat(konfirmasiTes: $konfirmasiTes, halamantes: $halamanTes)
                        }
                    }else {
                        TabView{
                            EksplorasiView(email: $email,halamanTes: $halamanTes,i: $i, result: $result, LJK: $LJK, sudahTes: $sudahTes)
                                .tabItem {
                                    Image(systemName: "graduationcap.fill")
                                    Text("Eksplorasi")
                                }
                            ProfilView(halamanTes: $halamanTes,i: $i, result: $result, LJK: $LJK, sudahTes: $sudahTes)
                                .tabItem{
                                    Image(systemName: "person.fill").renderingMode(.template)
                                    Text("Profil")
                                }
                        }.accentColor(Color(hex: "638ECC"))
                            .background(Color(hex: "D8D8D8"))
                    }
                    
                }
            }else{
                if email != ""{
                    if konfirmasiTes == "true" || sudahTes == "true"{
                        TabView(selection: .constant(1)){
                            EksplorasiView(email: $email,halamanTes: $halamanTes,i: $i, result: $result, LJK: $LJK, sudahTes: $sudahTes)
                                .tabItem {
                                    Image(systemName: "graduationcap.fill")
                                    Text("Eksplorasi")
                                }.tag(0)
                            ProfilView(halamanTes: $halamanTes,i: $i, result: $result, LJK: $LJK, sudahTes: $sudahTes)
                                .tabItem{
                                    Image(systemName: "person.fill").renderingMode(.template)
                                    Text("Profil")
                                }.tag(1)
                        }.accentColor(Color(hex: "638ECC"))
                            .background(Color(hex: "D8D8D8"))
                    }else if konfirmasiTes == "false"{
                        BoardingTesMinat(konfirmasiTes: $konfirmasiTes, halamantes: $halamanTes)
                    }
                }else{
                    TabView{
                        EksplorasiView(email: $email,halamanTes: $halamanTes,i: $i, result: $result, LJK: $LJK, sudahTes: $sudahTes)
                            .tabItem {
                                Image(systemName: "graduationcap.fill")
                                Text("Eksplorasi")
                            }
                        ProfilView(halamanTes: $halamanTes,i: $i, result: $result, LJK: $LJK, sudahTes: $sudahTes)
                            .tabItem{
                                Image(systemName: "person.fill").renderingMode(.template)
                                Text("Profil")
                            }
                    }.accentColor(Color(hex: "638ECC"))
                        .background(Color(hex: "D8D8D8"))
                }
            }
            
            
        }.onAppear(){
            email = UserDefaults.standard.string(forKey: "Email") ?? ""
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
