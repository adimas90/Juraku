//
//  ContentView.swift
//  Simple Quiz Game
//
//  Created by Alberto Panzera on 16/05/2020.
//  Copyright © 2020 Alberto Panzera. All rights reserved.
//

import SwiftUI
 
//first view of the app
struct TestHomeView: View {
    @State private var showModal = false
    let tesminat_soal = Bundle.main.decode([TesMinatElement].self, from: "csvjson-2.json")

    //var for the score
    @Binding var i : Int
    @Binding var result: [String:Double]
    @Binding var LJK : [Int]
    @Binding var halamanTes:Bool
    @Binding var sudahTes : String
    
    var body: some View {
        
            ZStack{
                Color(red: 242/255, green: 242/255, blue: 246/255)
                    .edgesIgnoringSafeArea(.all)
                VStack(){
                    Spacer()
                    //Isi konten kotak putih
                    VStack(spacing: 20){
                        Text("Panduan Sebelum Memulai Tes").bold()
                        Text("1. Dalam tes ini terdapat 42 pertanyaan.\n2. Pilihlah jawaban **setuju** atau **tidak setuju** berdasarkan keadaan kamu saat ini.\n3. Tes ini akan memakan waktu ±15 menit.\n4. Temukan posisi senyaman mungkin dan pastikan tidak ada kegiatan lain yang sedang kamu lakukan saat menjawab tes.\n5. Jawablah setiap pertanyaan dengan jujur dan teliti.\n6. Jika sudah paham klik tombol **Mulai**.")
                        
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 20)
                                                                .stroke(Color.white,lineWidth: 1 )).background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                                                                .padding()
                    .onAppear(){ //refresh score
                    self.i = LoadScore(quiz: "lastScore")
                    self.result = LoadResult(quiz: "lastResult")
                    calculateResult()
                    }
                
                    Spacer()
                    //Button Mulai
                    if LJK[41] != 2 {
                        Button {
                            self.i = 0
                            self.result = ["R":0,"I":0,"A":0,"S":0,"E":0,"C":0]
                            self.LJK = [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]
                                  self.showModal.toggle()
                                } label: {
                                    Text("Mulai")
                                        .bold()
                                        .frame(width: UIScreen.main.bounds.width-40, height: 48)
                                        .background(Color(hex: 0x638ECC))
                                        .foregroundColor(Color.white)
                                        .cornerRadius(10)
                                    
                                }.padding(.bottom)
                            .padding(.horizontal)
                            .sheet(isPresented: $showModal) {
                            TestView(halamanTes: $halamanTes, showModal: self.$showModal, i : self.$i, result : self.$result, LJK : self.$LJK, sudahTes: $sudahTes)
                        
                        }

                    }else if i != 0 {
                        
                        Button {
                            self.i = 0
                            self.result = ["R":0,"I":0,"A":0,"S":0,"E":0,"C":0]
                            self.LJK = [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]
                                  self.showModal.toggle()
                                } label: {
                                    Text("Mulai")
                                        .bold()
                                        .frame(width: UIScreen.main.bounds.width-40, height: 48)
                                        .background(Color(hex: 0x638ECC))
                                        .foregroundColor(Color.white)
                                        .cornerRadius(10)
                                    
                                }.padding(.bottom)
                            .padding(.horizontal)
                            .sheet(isPresented: $showModal) {
                            TestView(halamanTes: $halamanTes, showModal: self.$showModal, i : self.$i, result : self.$result, LJK : self.$LJK, sudahTes: $sudahTes)
                        
                        }
                        
                    }else{
                        Button {
                            self.i = 0
                            self.result = ["R":0,"I":0,"A":0,"S":0,"E":0,"C":0]
                            self.LJK = [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]
                                  self.showModal.toggle()
                                } label: {
                                    Text("Mulai")
                                        .bold()
                                        .frame(width: UIScreen.main.bounds.width-40, height: 48)
                                        .background(Color(hex: 0x638ECC))
                                        .foregroundColor(Color.white)
                                        .cornerRadius(10)
                                    
                                }.padding(.bottom)
                            .padding(.horizontal)
                            .sheet(isPresented: $showModal) {
                            TestView(halamanTes: $halamanTes, showModal: self.$showModal, i : self.$i, result : self.$result, LJK : self.$LJK, sudahTes: $sudahTes)
                        
                        }
                    }
                }.navigationBarTitle("Tes RIASEC",displayMode: .inline)
            }
        }
    
    func calculateResult(){
        self.result = ["R":0,"I":0,"A":0,"S":0,"E":0,"C":0]
        var index = 0
        for data in (self.LJK) {
            if(data == 1){
                switch tesminat_soal[index].indikator{
                case "R":
                    self.result["R"] = self.result["R"]! + 1
                case "I":
                    self.result["I"] = self.result["I"]! + 1
                case "A":
                    self.result["A"] = self.result["A"]! + 1
                case "S":
                    self.result["S"] = self.result["S"]! + 1
                case "E":
                    self.result["E"] = self.result["E"]! + 1
                case "C":
                    self.result["C"] = self.result["C"]! + 1
                default:
                    self.i = self.i
                }
            }
            index = index +  1
            
        }
    }
}


