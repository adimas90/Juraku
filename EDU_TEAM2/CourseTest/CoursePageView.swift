//
//  CoursePageView.swift
//  EduTeam
//
//  Created by Ahmad Nur Alifullah on 26/10/21.
//


import SwiftUI

var pageview : [TesCourseElement] = [
    TesCourseElement(id: 1,
                     matkul: [
                        MataKuliah(matkul: "Algoritma", bab: [Bab(id : 0, bab: "Apa Itu Algoritma?", subbab: [Subbab(isi: "Algoritma adalah urutan langkah logis yang digunakan untuk menyelesaikan suatu masalah. Singkatnya, sebuah masalah harus diselesaikan dengan beberapa langkah yang logis. Dalam kehidupan sehari-hari, contoh algoritma bisa digambarkan dengan berbagai macam hal. Salah satu contohnya adalah aktivitas memasak air. Algoritmanya tentu saja berhubungan dengan aktivitas dalam memasak air.", gambar: [""])]),
                                                              Bab(id: 1, bab: "Contoh Algoritma",subbab: [Subbab(isi: "Misalnya saja yaitu:\n1. Siapkan panci yang sesuai,\n2. Masukkan air ke dalam panci tersebut, tutup panci,\n3. Letakkan panci pada kompor,\n4. hidupkan kompor dengan nyala api sedang,\n5. apabila air mendidih,\n6. matikan kompor,\n7. angkat panci dari kompor.\n\nDeretan langkah tersebut merupakan algoritma dari akitivitas memasak air.\n\nSementara itu, di dalam ilmu komputer dan matematika, algoritma didefinisikan sebagai prosedur dari berbagai macam langkah penghitungan, penalaran secara otomatis, sampai pemrosesan data. ", gambar: [""])]),
                                                              Bab(id: 2, bab: "Flowchart", subbab: [Subbab(isi: "Flowchart adalah presentasi grafis untuk menggambarkan proses spesifik sebuah algoritma. Pengaplikasiannya seperti berikut ini :\n\nPerlu Bawa Payung?\n1. Apakah hujan?\n2. Jika tidak hujan, kamu tidak perlu bawa payung\n3. Jika hujan, segera cari payung\n4. Ketika payung sudah ketemu, bawa payungnya\n5. Jika payung tidak ketemu pastikan apakah masih hujan dan akan kembali berputar ke poin 2 dan 3", gambar: ["bab3"])])]),
                        MataKuliah(matkul: "Data Visual", bab: [Bab(id : 0, bab: "Apa Itu Visualisasi Data?", subbab: [Subbab(isi: "Visualisasi data merupakan sebuah kumpulan data yang telah di convert menjadi tampilan grafis atau visual. Harapannya, dengan menggunakan elemen visual tersebut, pembaca akan lebih mudah memahami tren, outliers, dan pola dalam suatu data.\nDalam dunia bisnis atau kepentingan lainnya, visualisasi data memungkinkan para pembuat keputusan untuk melihat analitik yang disajikan secara visual.\nHal ini membantu mereka untuk memahami konsep yang sulit serta mengidentifikasi pola baru. Hal ini akan membuat pengambilan keputusan menjadi lebih mudah dan tepat.", gambar: ["DataVisual_1"]), Subbab(isi: "Dari sini para pemangku kepentingan dapat dengan mudah mengambil keputusan karena data telah disajikan secara visual karena relatif dapat dipahami dengan mudah", gambar: [])]), Bab(id: 1, bab: "Chart/Grafik Data",subbab: [Subbab(isi: "Chart atau grafik data merupakan bentuk visualisasi dari data itu sendiri. Ada bermacam - macam tipe chart serta penggunaan yang berbeda - beda, tergantung akan kebutuhan dalam memvisualisasikan data yang ada.\nAdapun contoh chart yang umum digunakan oleh perusahaan yaitu :\n\n1. Grafik batang, umumnya digunakan untuk data berupa pertumbuhan atau perkembangan sesuatu, biasanya disajikan dalam bentuk grafik garis namun grafik batang juga dapat digunakan untuk menyajikan data pertumbuhan sekaligus melihat perbandingannya.", gambar: ["DataVisual_2"]), Subbab(isi: "2. Grafik lingkaran, umumnya digunakan untuk menyajikan data dalam bentuk persentase. Keterbatasan grafik ini dalam menyajikan data, umumnya hanya berupa data dari tabel satu arah. Kelebihan menyajikan data dalam bentuk grafik lingkaran adalah dari segi visualisasi. Visualisasi pada grafik lingkaran memiliki banyak sekali karakter yang unik dan enak dilihat. Sehingga karakter data yang sedikit yang masih dapat disajikan dalam bentuk grafik lingkaran akan sangat baik jika menggunakan grafik ini.", gambar: ["DataVisual_3"]), Subbab(isi: "3. Grafik Garis, umumnya digunakan untuk menyajikan data berupa trend/perkembangan suatu informasi dari waktu ke waktu. Dengan menggunakan grafik garis kita dapat melihat adanya sebuah trend menaik atau menurun pada suatu data dalam waktu tertentu.", gambar: ["DataVisual_4"])])])],
                     pertanyaan: [])
]

struct CoursePageView: View {
    var idmatkul : Int
    @Binding var materi : Bool
    @Binding var quiz : Bool
    var body: some View {
        if idmatkul == 0 || idmatkul == 1 {
            ZStack{
                TabView{
                    ForEach(0..<pageview[0].matkul[idmatkul].bab.count){ num in
                        ScrollView{
                            ZStack{
                                VStack(alignment: .center){
                                    Text("\(pageview[0].matkul[idmatkul].matkul)")
                                        .font(Font.title.bold())
                                    Text("")
                                    HStack{
                                        Text("\(pageview[0].matkul[idmatkul].bab[num].bab)")
                                            .font(Font.headline.bold())
                                        Spacer()
                                    }
                                    ForEach(0..<pageview[0].matkul[idmatkul].bab[num].subbab.count){ nom in
                                        HStack{
                                            Text("\(pageview[0].matkul[idmatkul].bab[num].subbab[nom].isi)")
                                            Spacer()
                                        }
                                            
                                        if pageview[0].matkul[idmatkul].bab[num].subbab[nom].gambar.count > 0 {
                                            ForEach(0..<pageview[0].matkul[idmatkul].bab[num].subbab[nom].gambar.count){ no in
                                                Image((pageview[0].matkul[idmatkul].bab[num].subbab[nom].gambar[no]))
                                                //                                            .frame(width: 350, height: .none, alignment: .center)
                                                    .resizable()
                                                    .scaledToFit()
                                                
                                                Spacer()
                                                if num == pageview[0].matkul[idmatkul].bab.count-1{
                                                    if nom == pageview[0].matkul[idmatkul].bab[num].subbab.count-1{
                                                        HStack{
                                                            Spacer()
                                                            VStack{
                                                                Button{
                                                                    self.materi = false
                                                                    self.quiz = true
                                                                }label:{
                                                                    Image(systemName: "chevron.forward").resizable()
                                                                        .frame(width: 10, height: 20)
                                                                        .foregroundColor(Color.black)
                                                                        
                                                                }
                                                            }.frame(width: 40, height: 40)
                                                                .background(Color(hex: 0xD8D8D8))
                                                                .cornerRadius(10)
                                                            
                                                        }
                                                    }
                                                    
                                                }
                                                
                                                
//                                                    .overlay(RoundedRectangle(cornerRadius: 1)
//                                                                .stroke(Color.black,lineWidth: 1 )).background(RoundedRectangle(cornerRadius: 1).fill(Color.gray))
                                            }
                                        }
                                        
                                        
                                        Spacer()
                                    }
                                    
                                    
                                    
                                    
                                }.padding()
                            }
                            
                        }.onAppear(perform: {
                            if num == (pageview[0].matkul[idmatkul].bab.count - 1){
                                if var currentbab = LoadcurrentBab(quiz: "loadcurrentbab") as? [[Int]]{
                                    currentbab[self.idmatkul][0] = 2
                                    if currentbab[self.idmatkul][1] == 0{
                                        currentbab[self.idmatkul][1] = 1
                                    }
                                    SavecurrentBab(quiz: "loadcurrentbab", result: currentbab)
                                }
                                
                            }
                        })
                        
                    }
                }.tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
        }else{
            Text("Simulasi belum tersedia")
        }
            
    }
    
}

//struct CoursePageView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoursePageView(idmatkul: 0, materi: true, quiz: false)
//    }
//}
