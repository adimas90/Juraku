//
//  ContentView.swift
//  EduTeam
//
//  Created by Ahmad Nur Alifullah on 29/09/21.
//

import SwiftUI

var testCourse : [TesCourseElement] = [
    TesCourseElement(id: 1,
                     matkul: [
                        MataKuliah(matkul: "Algoritma", bab: [Bab(id : 0, bab: "Apa Itu Algoritma?", subbab: [Subbab(isi: "Algoritma adalah urutan langkah logis yang digunakan untuk menyelesaikan suatu masalah. Singkatnya, sebuah masalah harus diselesaikan dengan beberapa langkah yang logis. Dalam kehidupan sehari-hari, contoh algoritma bisa digambarkan dengan berbagai macam hal. Salah satu contohnya adalah aktivitas memasak air. Algoritmanya tentu saja berhubungan dengan aktivitas dalam memasak air.", gambar: ["Indo"])]),
                                                              Bab(id: 1, bab: "Contoh Algoritma",subbab: [Subbab(isi: "Misalnya saja yaitu:\n1. Siapkan panci yang sesuai,\n2. Masukkan air ke dalam panci tersebut, tutup panci,\n3. Letakkan panci pada kompor,\n4. hidupkan kompor dengan nyala api sedang,\n5. apabila air mendidih,\n6. matikan kompor,\n7. angkat panci dari kompor.\n\nDeretan langkah tersebut merupakan algoritma dari akitivitas memasak air.\n\nSementara itu, di dalam ilmu komputer dan matematika, algoritma didefinisikan sebagai prosedur dari berbagai macam langkah penghitungan, penalaran secara otomatis, sampai pemrosesan data. ", gambar: ["Indo"])]),
                                                              Bab(id: 2, bab: "Flowchart", subbab: [Subbab(isi: "Flowchart adalah presentasi grafis untuk menggambarkan proses spesifik sebuah algoritma. Pengaplikasiannya seperti berikut ini :\n\nPerlu Bawa Payung?\n1. Apakah hujan?\n2. Jika tidak hujan, kamu tidak perlu bawa payung\n3. Jika hujan, segera cari payung\n4. Ketika payung sudah ketemu, bawa payungnya\n5. Jika payung tidak ketemu pastikan apakah masih hujan dan akan kembali berputar ke poin 2 dan 3", gambar: ["bab3"])])])],
                     pertanyaan: [[
                        Pertanyaan(pertanyaan: "Apakah benar algoritma hanya ditemukan dalam pemrograman saja?",jawaban: "Salah", gambar: "" ,explanation: Explanation(gambar: "", explain: "Algoritma dapat kita temukan dalam kehidupan sehari-hari. Ingat, contoh algoritma bisa digambarkan dengan berbagai macam hal. Salah satu contohnya adalah aktivitas memasak air.\nAlgoritmanya yaitu:\n1. Siapkan panci yang sesuai,\n2. Masukkan air ke dalam panci tersebut, tutup panci,\n3. Letakkan panci pada kompor,\n4. hidupkan kompor dengan nyala api sedang,\n5. apabila air mendidih,\n6. matikan kompor,\n7. angkat panci dari kompor. ") , option: [Option(id: 0, option: "Benar"), Option(id: 1, option: "Salah")] ),
                        Pertanyaan(pertanyaan: "Kalimat yang paling sesuai dengan gambar flowchart diatas adalah", jawaban: "Angkat tangan jika menang lomba", gambar : "courseno2",explanation: Explanation(gambar: "", explain: "Ini Pemabahasan soal nomor 2") , option: [Option(id: 0, option: "Angkat tangan jika menang lomba"),Option(id: 1, option: "Angkat tangan jika kalah lomba")]),
                        Pertanyaan(pertanyaan: "3. Bahasa Pemrograman yang digunakan dalam Xcode?", jawaban: "Swift",gambar: "xcode",explanation: Explanation(gambar: "", explain: "Ini Pemabahasan soal nomor 3") , option: [Option(id: 0, option: "Java"),Option(id: 1, option: "Swift"),Option(id: 2, option: "Python")])],
                                  [Pertanyaan(pertanyaan: "Jika total hasil panen kebun Pak Tani pada bulan ini adalah 150 kilogram, berapa jumlah hasil panen kentangnya?", jawaban: "35kg", gambar: "DatavisualQuiz_1", explanation: Explanation(gambar: "DatavisulQuiz_1", explain: "Dari diagram batang di atas, kita bisa mengetahui hasil panen yang sudah diketahui,\n\nyaitu:\nCabai = 20 kg\nWortel = 35 kg\nTomat = 25 kg\nUbi = 35 kg\n\nTotal hasil panen yang diketahui\n= 20 + 35 + 25 + 35 = 115 kg.\n\nDiketahui seluruh hasil panen kebun Pak Tani adalah 150 kg.\n\nMaka, hasil panen kentang = hasil panen seluruhnya - hasil panen yang diketahui.Hasil panen kentang = 150 - 115 = 35 kg") , option: [Option(id: 0, option: "35kg"), Option(id: 1, option: "65kg")]),
                                   Pertanyaan(pertanyaan: "Berapakah jumlah siswa yang mengikuti ekskul musik?", jawaban: "175 siswa", gambar: "DatavisualQuiz_2", explanation: Explanation(gambar: "DatavisualQuiz_2", explain: "Penjelasan no 2"), option:[Option(id: 0, option: "175 siswa"), Option(id: 1, option: "195 siswa")]),
                                   Pertanyaan(pertanyaan: "Berapa jumlah keseluruhan siswa?", jawaban: "20 siswa", gambar: "DatavisualQuiz_3", explanation: Explanation(gambar: "DatavisualQuiz_3", explain: "2 siswa menyukai apel + 4 siswa menyukai jeruk + 7 siswa menyukai mangga + 5 siswa menyukai semangka + 2 siswa menyukai manggis = 20"), option: [Option(id: 0, option: "20 siswa"), Option(id: 1, option: "30 siswa")])]]
                    )
]


struct TestCourseView: View {
    @State private var showModal = false
    let tescourse_soal = testCourse
    var totalsoal : Int!
    @State var i : [Int] = LoadScoreCourse(quiz: "lastScoreCourse")
    @State var LJK_course : [[Int]] = LoadLJK_course(quiz: "lastLJKCourse", soal1: testCourse[0].pertanyaan[0].count, soal2 : testCourse[0].pertanyaan[1].count )
    @State var iscorrect : [[Bool]] = LoadisCorrect(quiz: "lastisCorrect", soal1: testCourse[0].pertanyaan[0].count, soal2 : testCourse[0].pertanyaan[1].count)
    @State var jawaban : String!
    @State var explanation : String = "Ini Penjelasan yaaa"
    @State var isclickedEnabled : Bool = true
    @State private var isAlert = false
    @Binding var showModal1 :Bool
    @Binding var materi :Bool
    @Binding var quiz :Bool
    
    var idmatkul : Int
    
    
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
                        self.materi = true
                        self.quiz = false
                        self.showModal1 = true
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
                            Text("\(self.i[idmatkul] + 1) / 3")
                                .bold()
                                .frame( alignment: .center)
                                .padding(.horizontal , 25)
                                .padding(.vertical , 8)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.white,lineWidth: 1 )).background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 218/255, green: 218/255, blue: 218/255)))
                            Spacer()
                            if (tescourse_soal[0].pertanyaan[idmatkul][self.i[idmatkul]].gambar != ""){
                                Image("\(tescourse_soal[0].pertanyaan[idmatkul][self.i[idmatkul]].gambar)")
                                //                                    .frame(width: 300, height: .none, alignment: .center)
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal)
                            }
                            if(self.i[idmatkul] < tescourse_soal[0].pertanyaan[idmatkul].count){
                                Text(tescourse_soal[0].pertanyaan[idmatkul][self.i[idmatkul]].pertanyaan)
                                    .frame(width: 300, height: .none, alignment: .center)
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 20, weight: .semibold))
                                    .padding()
                                //answer 0
                                Spacer()
                                ForEach(tescourse_soal[0].pertanyaan[idmatkul][self.i[idmatkul]].option, id : \.id) {num in
                                    AnswerButtonCourse(backColor: highlightColor(num : num.id), answer: "\(tescourse_soal[0].pertanyaan[idmatkul][self.i[idmatkul]].option[num.id].option)", option : tescourse_soal[0].pertanyaan[idmatkul][self.i[idmatkul]].option[num.id], foregroundColor: foregroundColor(num: num.id)){
                                        
                                        if self.isclickedEnabled{
                                            if checkAnswer(answer:tescourse_soal[0].pertanyaan[idmatkul][self.i[idmatkul]].option[num.id].option ){
                                                Sound.playRightAnswerSound()
                                                self.iscorrect[idmatkul][self.i[idmatkul]] = true
                                                self.isclickedEnabled.toggle()
                                                
                                            }else {
                                                Sound.playWrongAnswerSound()
                                                self.iscorrect[idmatkul][self.i[idmatkul]] = false
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                                                    explanation = tescourse_soal[0].pertanyaan[idmatkul][self.i[idmatkul]].explanation.explain
                                                    self.showModal.toggle()
                                                }
                                            }
                                            self.LJK_course[idmatkul][self.i[idmatkul]] = num.id
                                        }
                                    }
                                }
                            }
                        }
                        .sheet(isPresented: $showModal) {
                            ExplanationAnswer(showModal : self.$showModal, explanation: self.$explanation)
                        }
                        .padding(10)
                        .background(Color.white)
                        .padding(.horizontal,25)
                        .cornerRadius(20)
                        
                        Spacer()
                        HStack(alignment: .center, spacing: 10, content: {
                        })
                            .padding(.bottom)
                        HStack{
                            Button(action: {
                                self.i[idmatkul] = self.i[idmatkul] - 1
                            }, label: {Label(title: {
                                Text("\t")
                            }, icon: {
                                Image(systemName: "chevron.left.square.fill").resizable()
                                    .foregroundColor(.gray)
                                    .frame(width: 20, height: 20)
                                
                            })})
                                .disabled(isFirstQuestion())
                                .opacity(opacityAnswerButton(isFirstQuestion()))
                            
                            Button(action: {
                                explanation = tescourse_soal[0].pertanyaan[idmatkul][self.i[idmatkul]].explanation.explain
                                self.showModal.toggle()
                            }, label: {
                                Image(systemName: "questionmark.square.fill").resizable()
                                    .foregroundColor(.gray)
                                    .frame(width: 20, height: 20)
                                Text("\t")
                                
                            }).sheet(isPresented: $showModal) {
                                ExplanationAnswer(showModal : self.$showModal, explanation: self.$explanation)
                            }
                            .disabled(disabledButton())
                            .opacity(opacityAnswerButton(disabledButton()))
                            
                            
                            Button(action: {
                                if self.i[idmatkul] == tescourse_soal[0].pertanyaan[idmatkul].count - 1 {
                                    self.isAlert = true
                                    
                                }else {
                                    if self.LJK_course[idmatkul][self.i[idmatkul]+1] == 10{
                                        self.isclickedEnabled.toggle()
                                    }
                                    self.i[idmatkul] = self.i[idmatkul] + 1
                                    
                                }
                            }, label: {
                                //                                if self.i[idmatkul] == tescourse_soal[0].pertanyaan[idmatkul].count - 1 {
                                //                                    Text("Submit")
                                //                                        .foregroundColor(Color.gray)
                                //                                }else{
                                Image(systemName: "chevron.right.square.fill").resizable()
                                    .foregroundColor(.gray)
                                    .frame(width: 20, height: 20)
                                //                                }
                            })
                                .disabled(disabledButton())
                                .opacity(opacityAnswerButton(disabledButton()))
                                .alert(isPresented: $isAlert) { () -> Alert in
                                    Alert(title: Text("Kuis Selesai"), message: Text("Tekan OK untuk melanjutkan"), primaryButton: .default(Text("Okay"), action: {
                                        DispatchQueue.main.async {
                                            self.quiz = false
                                            print("Okay Click")
                                        }
                                        
                                        if var currentbab = LoadcurrentBab(quiz: "loadcurrentbab") as? [[Int]]{
                                            currentbab[idmatkul][1] = 2
                                            SavecurrentBab(quiz: "loadcurrentbab", result: currentbab)
                                        }
                                    }), secondaryButton: .cancel())
                                }
                            
                        }
                        Spacer()
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .onAppear(perform: {
            self.i  = LoadScoreCourse(quiz: "lastScoreCourse")
            self.LJK_course = LoadLJK_course(quiz: "lastLJKCourse", soal1: testCourse[0].pertanyaan[0].count, soal2 : testCourse[0].pertanyaan[1].count)
            self.iscorrect = LoadisCorrect(quiz: "lastisCorrect", soal1: testCourse[0].pertanyaan[0].count, soal2 : testCourse[0].pertanyaan[1].count)
        })
        .onDisappear(perform: {
            SaveLJK_course(quiz: "lastLJKCourse", result: self.LJK_course)
            SaveisCorrect(quiz: "lastisCorrect", result: self.iscorrect)
            SaveScoreCourse(quiz: "lastScoreCourse", score: self.i)
            self.materi = true
            self.quiz = false
            self.showModal1 = true
        })
        
    }
    func opacityAnswerButton(_ status : Bool) -> Double{
        if status{
            return 0.5
        }else{
            return 1
        }
    }
    
    func checkAnswer(answer: String)->Bool{
        return answer == tescourse_soal[0].pertanyaan[idmatkul][self.i[idmatkul]].jawaban
    }
    func progress ()-> CGFloat{
        let fraction = CGFloat(self.i[idmatkul]+1) / CGFloat(tescourse_soal[0].pertanyaan[idmatkul].count)
        let width = UIScreen.main.bounds.width - 48
        
        return fraction * width
    }
    
    func disabledButton ()->Bool{
        if self.iscorrect[idmatkul][self.i[idmatkul]] == false {
            return true
        }else {
            return false
        }
    }
    
    func isFirstQuestion()->Bool{
        if self.i[idmatkul] == 0 {
            return true
        }else{
            return false
        }
    }
    
    func isLastQuestion()->Bool{
        if self.i[idmatkul] == 42 {
            return true
        }else{
            return false
        }
    }
    
    func highlightColor(num : Int)->Color{
        if self.LJK_course[idmatkul][self.i[idmatkul]] == num {
            if self.iscorrect[idmatkul][self.i[idmatkul]]{
                return Color(hex: 0x72B65A)
            }else{
                return Color(hex: 0xC14D3F)
            }
        } else {
            return Color(hex: 0xF2F2F6)
        }
    }
    func foregroundColor(num : Int)->Color{
        if self.LJK_course[idmatkul][self.i[idmatkul]] == num {
            if self.iscorrect[idmatkul][self.i[idmatkul]]{
                return Color.white
            }else{
                return Color.white
            }
        } else {
            return Color.black
        }
    }
    
}
