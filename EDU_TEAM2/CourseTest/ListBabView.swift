//
//  ListBabView.swift
//  EduTeam
//
//  Created by Ahmad Nur Alifullah on 27/10/21.
//

import SwiftUI

struct ListBabView: View {
    @Binding var showModal :Bool
    @Binding var materi : Bool
    @Binding var quiz : Bool
    var Bablist = [["Materi I: Algoritma", "Kuis I: Algoritma", "Praktikum: Coming soon"],["Materi I: Data Visual", "Kuis I: Data Visual", "???"]]
    var currentBab : [[Int]] = LoadcurrentBab(quiz: "loadcurrentbab")
    var idmatkul : Int
    var body: some View {
        NavigationView{
            if idmatkul == 0 || idmatkul == 1{
                VStack{
                    VStack{
                        ForEach(0..<Bablist[idmatkul].count){num in
                            Button(action: {
                                if num == 1{
                                    self.materi = false
                                    self.quiz = true
                                    self.showModal.toggle()
                                }else if num == 0{
                                    self.materi = true
                                    self.quiz = false
                                    self.showModal.toggle()
                                }
                                
                            }, label: {
                                HStack{
                                    if currentBab[idmatkul][num] == 2 {
                                        Image(systemName: "rosette")
                                            .font(.system(size: 25))
                                            .frame(width: 40, height: 40)
                                            .background(Color(hex: 0xEEA350))
                                            .foregroundColor(Color.white)
                                            .cornerRadius(10)
                                        
                                        //                        .resizable()
                                        //                        .scaledToFit()
                                        //                        .frame(height : 50)
                                        //                        .cornerRadius(10)
                                    } else if currentBab[idmatkul][num] == 1 {
                                        Image(systemName: "lock")
                                            .font(.system(size: 25))
                                                .frame(width: 40, height: 40)
                                                .background(Color(hex: 0x9B9496))
                                                .foregroundColor(Color.white)
                                                .cornerRadius(10)
                                    } else {
                                        Image(systemName: "questionmark" )
                                            .font(.system(size: 22))
                                                .frame(width: 40, height: 40)
                                                .background(Color(hex: 0x9B9496))
                                                .foregroundColor(Color.white)
                                                .cornerRadius(10)
                                    }
                                    Text("\(Bablist[idmatkul][num])").font(.system(size: 22))
                                        .foregroundColor(Color.black)
                                    Spacer()
                                }.opacity(opacityList(num)).padding(.horizontal)
                            })
                        }
                        Spacer()
                    }.padding()
                        
                    
                    Spacer()
                }
                .navigationBarTitle("Bab")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                        // Add your custom back button here
                        .navigationBarItems(leading:
                            Button(action: {
                            self.showModal.toggle()
                            }) {
                                HStack {
                                    Text("Tutup")
                                }
                        })
            }else{
                Text("Belum tersedia")
                    .navigationBarTitle("Bab")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
    func opacityList(_ num : Int)->Double{
        if self.idmatkul == 1 || self.idmatkul == 0  {
            if num == 2 {
                return 0.5
            }
            return 1
        }else{
            return 1
        }
    }
}
