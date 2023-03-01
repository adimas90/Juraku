//
//  ContentView.swift
//  EduTeam
//
//  Created by Ahmad Nur Alifullah on 29/09/21.
//

import SwiftUI

struct TestView: View {
    let tesminat_soal = Bundle.main.decode([TesMinatElement].self, from: "csvjson-2.json")
    
    @StateObject var myRekomen:RekomendasiJurusan = RekomendasiJurusan()
    //test
    @Binding var halamanTes:Bool
    
    @Binding var showModal: Bool
    @Binding var i : Int
    @Binding var result: [String:Double]
    @Binding var LJK : [Int]
    @State private var isAlert = false
    @Binding var sudahTes : String
    
    var body: some View {
        ZStack{
            Color(red: 242/255, green: 242/255, blue: 246/255)
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                        Capsule()
                            .inset(by: -1)
                            .stroke(Color.gray, lineWidth: 1)
                            .background(Color.white.opacity(0.7))
                            .frame(height: 9)
                        Capsule()
                            .fill(Color(hex: 0x638ECC))
                            .frame(width: progress(), height: 9)
                    })
                    Button(action:{
                        self.result = ["R":0,"I":0,"A":0,"S":0,"E":0,"C":0]
                        self.i = 0
                        self.LJK = [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]
                        SaveLJK(quiz: "lastLJK", LJK: self.LJK)
                        SaveScore(quiz: "lastScore", score: self.i)
                        SaveResult(quiz: "lastResult", result: result)
                        self.showModal.toggle()
                    },label: {
                        Image(systemName: "x.circle.fill").resizable()
                            .foregroundColor(.gray)
                            .frame(width: 20, height: 20)
                    })
                }
                .padding(.horizontal)
                .padding(.top , 15)
                HStack(alignment: .center, spacing: 10, content: {
                    
                })
                    .padding(.bottom)
                VStack(alignment: .center, spacing: 20){
                    VStack(){
                        VStack{
                            Text("\(self.i + 1) / 42").bold()
                                .font(.system(size: 18))
                                .frame( alignment: .center)
                                .padding(.horizontal , 25)
                                .padding(.vertical , 8)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.white,lineWidth: 1 )).background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 218/255, green: 218/255, blue: 218/255)))
                            
                            Spacer()
                            if(self.i < tesminat_soal.count){
                                Text(tesminat_soal[self.i].indo)
                                    .frame(width: 300, height: .none, alignment: .center)
                                    .font(.system(size: 20, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                    .font(.title3)
                                    .padding()
                                //answer 0
                                Spacer()
                                AnswerButton(backColor: highlightColoryes(), answer: "Setuju", foregroundColor: foregroundColoryes()){
                                    self.LJK[self.i] = 1
                                }
                                AnswerButton(backColor: highlightColorno(), answer: "Tidak Setuju", foregroundColor: foregroundColorno()){
                                    self.LJK[self.i] = 0
                                }
                            }
                        }
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(10)
                        Spacer()
                        HStack(alignment: .center, spacing: 10, content: {
                            
                        })
                            .padding(.bottom)
                        HStack{
                            Button(action: {
                                self.i = self.i - 1
                            }, label: {Label(title: {
                                Text("\t\t")
                            }, icon: {
                                if isFirstQuestion(){
                                    Image(systemName: "chevron.left.square.fill").resizable()
                                        .foregroundColor(.gray)
                                        .frame(width: 20, height: 20)
                                }else{
                                    Image(systemName: "chevron.left.square.fill").resizable()
                                        .foregroundColor(Color(hex: 0x638ECC))
                                        .frame(width: 20, height: 20)
                                }
                                
                                
                            })})
                                .disabled(isFirstQuestion())
                                .opacity(opacityAnswerButton(isFirstQuestion()))
                            Button(action: {
                                if self.i == 41 {
                                    self.isAlert = true
                                }else {
                                    self.i = self.i + 1
                                }
                            }, label: {
                                if self.i == 41 {
                                    if disabledButton(){
                                        Image(systemName: "chevron.right.square.fill").resizable()
                                            .foregroundColor(.gray)
                                            .frame(width: 20, height: 20)
                                    }else{
                                        Image(systemName: "chevron.right.square.fill").resizable()
                                            .foregroundColor(Color(hex: 0x638ECC))
                                            .frame(width: 20, height: 20)
                                    }
                                }else{
                                    if disabledButton(){
                                        Image(systemName: "chevron.right.square.fill").resizable()
                                            .foregroundColor(.gray)
                                            .frame(width: 20, height: 20)
                                    }else{
                                        Image(systemName: "chevron.right.square.fill").resizable()
                                            .foregroundColor(Color(hex: 0x638ECC))
                                            .frame(width: 20, height: 20)
                                    }
                                }
                            }).disabled(disabledButton())
                                .opacity(opacityAnswerButton(disabledButton()))
                                .alert(isPresented: $isAlert) { () -> Alert in
                                    Alert(title: Text("Tes Telah Selesai"), message: Text("Tekan OK untuk melanjutkan"), primaryButton: .default(Text("Okay"), action: {
                                        let dateFormatter = DateFormatter()
                                        dateFormatter.dateFormat = "dd MMM yyyy"
                                        let dateStr = dateFormatter.string(from: Date())
                                        UserDefaults.standard.set(dateStr, forKey: "Tanggal")
                                        UserDefaults.standard.set("true", forKey: "SudahTes")
                                        sudahTes = "true"
                                        print("Okay Click")
                                        self.showModal.toggle()
                                        SaveLJK(quiz: "lastLJK", LJK: self.LJK)
                                        SaveScore(quiz: "lastScore", score: self.i)
                                        SaveResult(quiz: "lastResult", result: self.result)
                                        myRekomen.calculateResult()
                                        halamanTes = false
                                    }), secondaryButton: .cancel())
                                }
                            
                        }
                        Spacer()
                    }
                    Spacer()
                }
                Spacer()
            }
        }.onDisappear(perform: {
            if i != 41 {
                self.result = ["R":0,"I":0,"A":0,"S":0,"E":0,"C":0]
                self.i = 0
                self.LJK = [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]
                SaveLJK(quiz: "lastLJK", LJK: self.LJK)
                SaveScore(quiz: "lastScore", score: self.i)
                SaveResult(quiz: "lastResult", result: result)
            }
            //                SaveLJK(quiz: "lastLJK", LJK: self.LJK)
            //                SaveScore(quiz: "lastScore", score: self.i)
            //                SaveResult(quiz: "lastResult", result: self.result)
            //                calculateResult()
        })
    }
    func opacityAnswerButton(_ status : Bool) -> Double{
        if status{
            return 0.5
        }else{
            return 1
        }
    }
    
    func progress ()-> CGFloat{
        let fraction = CGFloat(self.i) / CGFloat(42)
        let width = UIScreen.main.bounds.width - 30
        
        return fraction * width
    }
    
    func disabledButton ()->Bool{
        if self.LJK[self.i] == 2 {
            return true
        }else {
            return false
        }
    }
    
    func isFirstQuestion()->Bool{
        if self.i == 0 {
            return true
        }else{
            return false
        }
    }
    
    func isLastQuestion()->Bool{
        if self.i == 42 {
            return true
        }else{
            return false
        }
    }
    
    func highlightColoryes()->Color{
        if self.LJK[self.i] == 1 {
            return Color(hex: 0xEEA350)
        } else {
            return Color(hex: 0xF2F2F6)
        }
    }
    
    func highlightColorno()->Color{
        if self.LJK[self.i] == 0 {
            return Color(hex : 0xEEA350)
        } else {
            return Color(hex: 0xF2F2F6)
        }
    }
    func foregroundColoryes()->Color{
        if self.LJK[self.i] == 1 {
            return Color.white
        } else {
            return Color.black
        }
    }
    
    func foregroundColorno()->Color{
        if self.LJK[self.i] == 0 {
            return Color.white
        } else {
            return Color.black
        }
    }
}

