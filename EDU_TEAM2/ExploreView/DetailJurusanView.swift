//
//  DetailJurusanView.swift
//  EduTeam
//
//  Created by Reinaldo Lordianto on 18/10/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct DetailJurusanView: View {
    @StateObject var datas = ReadDataUniv()
    
    @State var mipa = "Matematika dan IPA (MIPA)"
    @State var olahraga = "Ilmu Olahraga"
    @State var pendidikan = "Pendidikan"
    @State var ekoBisnis = "Ekonomi dan Bisnis"
    @State var pertanian = "Pertanian"
    @State var kesehatan = "Kesehatan"
    @State var teknik = "Teknik"
    @State var seni = "Seni"
    @State var ilmuTerapan = "Profesi dan Ilmu Terapan"
    @State var sosialHumaniora = "Sosial dan Humaniora"
    @State var sastraBudaya = "Sastra dan Budaya"
    @State var gambarjurusan = "IT"
    
    @State var gambarKampus = ""
    @State var dataUniversitas : [UnivElement] = [UnivElement]()
    
    @State var showModalView = false
    @ObservedObject var pelajaran = PelajaranViewModel()
    @State var checkPelajaran = false
    @ObservedObject var jurusan: JurusanElement
    @State var toBeDeleted: IndexSet?
    @State private var  alertIsPresent = false
    @State private var alertBerhasilPresent = false
    @State private var alertHapusPresent = false
    @State private var alertSudahLogin = false
    @State private var indexDelete : Pelajaran = Pelajaran(id: "", namaJurusan: "")
    @State var sudahLogin = false
    @State var univ : String = ""
    
    let defaults = UserDefaults.standard
    
    @State var nama: String = UserDefaults.standard.string(forKey: "Nama") ?? ""
    @State var email: String = UserDefaults.standard.string(forKey: "Email") ?? ""
    
    var body: some View {
        ScrollView{
                VStack{
                    HStack{
                        Image(gambarjurusan).resizable().frame(width: 70, height: 70).cornerRadius(10)
                        Text(jurusan.namaJurusan).bold()
                        Spacer()
                    }.padding(.horizontal).padding(.top)
                    Divider().padding(.horizontal)
                    HStack{
                        VStack{
                            HStack{
                                Image(systemName: "questionmark.circle").resizable().frame(width: 15, height: 15).foregroundColor(.gray)
                                Text("Tentang Jurusan Ini").font(.system(size: 15)).foregroundColor(.gray)
                                Spacer()
                            }
                            Text(jurusan.definisi)
                        }.padding()
                    }.background(Color(hex: 0xFFFFFF)).cornerRadius(10).padding(.horizontal).padding(.bottom,10).padding(.top,5)
                    
                    HStack{
                        VStack{
                            HStack{
                                Image(systemName: "books.vertical").resizable().frame(width: 15, height: 15).foregroundColor(.gray)
                                Text("Mata Kuliah").font(.system(size: 15)).foregroundColor(.gray)
                                Spacer()
                            }
                            let matakuliah = jurusan.matkul
                            ForEach(0..<5){index in
                                HStack{
                                    Text("- \(matakuliah[index])")
                                    Spacer()
                                }
                                
                            }
                            
                        }.padding()
                    }.background(Color(hex: 0xFFFFFF)).cornerRadius(10).padding(.horizontal).padding(.bottom,10)
                    
                    
                    Button(action: {
                        showModalView.toggle()
                    }, label:
                            {
                        HStack{
                            VStack{
                                HStack{
                                    Image(systemName: "lightbulb").resizable().frame(width: 10, height: 15).foregroundColor(.gray)
                                    Text("Karakter Siswa yang Cocok").font(.system(size: 15)).foregroundColor(.gray)
                                    Spacer()
                                    Image(systemName: "chevron.right").foregroundColor(.gray)
                                }
                                    HStack{
                                        Text(jurusan.karakter)
                                        Spacer()
                                    }
                                    
                                
                                
                            }.padding()
                        }.background(Color(hex: 0xFFFFFF)).cornerRadius(10).padding(.horizontal).padding(.bottom,10)
                    }
                    ).foregroundColor(.black)
                    
                    HStack{
                        VStack{
                            HStack{
                                Image(systemName: "briefcase").resizable().frame(width: 15, height: 15).foregroundColor(.gray)
                                Text("Profesi dan Karir").font(.system(size: 15)).foregroundColor(.gray)
                                Spacer()
                            }
                            ForEach(jurusan.profesi.indices){index in
                                HStack{
                                    Text("- \(jurusan.profesi[index])")
                                    Spacer()
                                }
                                
                            }
                            
                        }.padding()
                    }.background(Color(hex: 0xFFFFFF)).cornerRadius(10).padding(.horizontal).padding(.bottom,10)
                    
                    HStack{
                        VStack{
                            HStack{
                                Image(systemName: "building.2").resizable().frame(width: 15, height: 15).foregroundColor(.gray)
                                Text("Kampus dengan Jurusan Ini").font(.system(size: 15)).foregroundColor(.gray)
                                Spacer()
                            }
                            ForEach(jurusan.kampus.indices){index in
                                NavigationLink(destination: DetailUniversitasView(namaKampus: jurusan.kampus[index])) {
                                    HStack{
                                        ForEach(dataUniversitas){hasil in
                                            if hasil.Universitas == jurusan.kampus[index]{
                                                Image(hasil.Universitas).resizable()
                                                    .scaledToFit().frame(width: 50, height: 50)
                                                
                                            }
                                            
                                        }
                                        VStack{
                                            Spacer()
                                            Text(jurusan.kampus[index])
                                            Spacer()
                                        }
                                        Spacer()
                                        Image(systemName: "chevron.right").foregroundColor(.gray)
                                    }.padding(.leading,20)
                                        .padding(.top,5)
                                        .padding(.bottom,5)
                                }.accentColor(Color.black)
                                Divider().padding(.leading,20).padding(.horizontal,-20)
                            }
                            
                        }.padding()
                    }.background(Color(hex: 0xFFFFFF)).cornerRadius(10).padding(.horizontal).padding(.bottom,10)
                    VStack{
                        
                    }.frame(height: 100)
                  
                
                }.background(Color(hex: 0xF2F2F6))
                    .sheet(isPresented: $showModalView, content: {BottomViewRiasec()})

            
            
        }.navigationBarTitleDisplayMode(.inline)
            .onAppear(perform:
                        {
                checkPelajaranDatabase()
                email = UserDefaults.standard.string(forKey: "Email") ?? ""
                if email == ""{
                    sudahLogin = false
                }else{
                    sudahLogin = true
                }
                checkFakultas()
                for item in datas.dataUniv{
                    if !dataUniversitas.contains(where: {coba in
                        item.Universitas == coba.Universitas
                    }){
                        dataUniversitas.append(item)
                    }
                    
                }
            }
                        )
            .overlay(
                ZStack{
                    VStack{
                        Spacer()
                        HStack{
                            Text("dhjsiahnajduhks")
                        }.frame(maxWidth: .infinity).frame(height: 100).background(Color(hex: 0x787880)).padding(.bottom,0.1).opacity(0.16).blur(radius: 5)
                        
                    }
                    VStack{
                        Spacer()
                        if checkPelajaran{
                            Button(action: {
                                alertHapusPresent = true
                            }) {
                                Text("Hapus Dari Pelajaran")
                                    .bold()
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .border(Color(hex: 0xC14D3F))
                                    .background(Color(hex: 0xC14D3F))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding()
                            }
                        }else{
                            Button(action: {
                                alertIsPresent = true
                                
                            }) {
                                Text("Tambah Ke Pelajaran")
                                    .bold()
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color(hex: 0x638ECC))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding()
                            }.alert(isPresented: $alertIsPresent) {
                                Alert(
                                    title: Text("Tambahkan Jurusan ?"),
                                    message: Text("Jurusan akan disimpan dalam pelajaran"),
                                    primaryButton: .default(Text("Tidak")){
                                        alertIsPresent = false
                                    },
                                    secondaryButton: .default(Text("Ya")){
                                        alertIsPresent = false
        //                                pelajaran.addData(namaJurusan: jurusan.namaJurusan)
                                        if sudahLogin {
                                            add(namaJurusan: jurusan.namaJurusan)
                                            DispatchQueue.main.async {
                                            checkPelajaran = true
                                            alertBerhasilPresent = true
                                                
                                            }
                                        }
                                        else{
                                            DispatchQueue.main.async {
                                                alertSudahLogin = true
                                            }
                                        }
                                    }
                                )
                            }
                        }
                        
                        HStack{
                            Text("").alert(isPresented: $alertBerhasilPresent){
                                Alert(
                                    
                                    title: Text("Berhasil Ditambahkan"),
                                    message: Text("Kamu dapat mengaksesnya di Pelajaran"),
                                    dismissButton: .default(Text("OK"))
                                )
                            }
                            
                            Text("").alert(isPresented: $alertHapusPresent){
                                Alert(
                                    
                                    title: Text("Hapus dari Pelajaran?"),
                                    message: Text("Jurusan akan dihapus dari Pelajaran"),
                                    primaryButton: .default(Text("Tidak")){
                                        alertHapusPresent = false
                                    },
                                    secondaryButton: .default(Text("Ya")){
                                        alertHapusPresent = false
                                        DispatchQueue.main.async {
                                        pelajaran.deleteData(pelajaranDelete: indexDelete)
                                        checkPelajaran = false
                                        }
                                    }
                                )
                            }
                            Text("").alert(isPresented: $alertSudahLogin) {
                                Alert(
                                    title: Text("Gagal Ditambahkan"),
                                    message: Text("Mohon untuk masuk ke akun terlebih dahulu"),
                                    dismissButton: .default(Text("Ok"))
                                  
                                )
                            }
                        }
                        
                    }.background(Color.clear)
                    
                }
                
            )
                

        
    }
    
    func checkFakultas(){
        if jurusan.fakultas == mipa{
            gambarjurusan = "Mipa"
        }else if jurusan.fakultas == olahraga{
            gambarjurusan = "Olahraga"
        }else if jurusan.fakultas == pendidikan{
            gambarjurusan = "Pendidikan"
        }else if jurusan.fakultas == ekoBisnis{
            gambarjurusan = "EkonomiBisnis"
        }else if jurusan.fakultas == pertanian{
            gambarjurusan = "Pertanian"
        }else if jurusan.fakultas == kesehatan{
            gambarjurusan = "Kesehatan"
        }else if jurusan.fakultas == teknik{
            gambarjurusan = "Teknik"
        }else if jurusan.fakultas == seni{
            gambarjurusan = "Seni"
        }else if jurusan.fakultas == ilmuTerapan{
            gambarjurusan = "Olahraga"
        }else if jurusan.fakultas == sosialHumaniora{
            gambarjurusan = "SosialHumaniora"
        }else if jurusan.fakultas == sastraBudaya{
            gambarjurusan = "SastraBudaya"
        }
    }
    
    func add(namaJurusan: String){
        pelajaran.addData(namaJurusan: namaJurusan)
    }
    func checkPelajaranDatabase(){
        pelajaran.getData{hasil in
            for item in pelajaran.listPelajaran{
                if jurusan.namaJurusan == item.namaJurusan {
                    checkPelajaran = true
                    indexDelete = Pelajaran(id: item.id, namaJurusan: item.namaJurusan)
                }
                
            }
        }
        
    }
    func delete(at offsets: IndexSet){
        self.toBeDeleted = offsets
    }

}




//
//struct DaftarKampusview: View{
//    @Binding var jurusan: JurusanElement
//    var body: some View{
//        
//    }
//}

//struct DetailJurusanView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailJurusanView(jurusan: <#Binding<JurusanElement>#>)
//    }
//}
