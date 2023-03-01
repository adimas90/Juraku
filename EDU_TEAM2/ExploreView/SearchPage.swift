//
//  SearchPage.swift
//  EduTeam
//
//  Created by Reinaldo Lordianto on 25/10/21.
//

import SwiftUI


struct search: View{
    var columnsIkon = Array(repeating: GridItem(.flexible(minimum: 100, maximum: 200)), count: 2)
    var columnsDaftar = Array(repeating: GridItem(.flexible(minimum: 100, maximum: 200)), count: 1)
    @Binding var searchText : String
    @Binding var jurusan :[JurusanElement]
    @Binding var email : String
    @State var fakultasList :[JurusanElement] = [JurusanElement]()
    @Binding var sort: Int
    @Binding var sorts: Int
    @Binding var urut :Bool 
    @StateObject var myRekomen:RekomendasiJurusan = RekomendasiJurusan()
    @State var sudahLogin = false
    @StateObject var datas = ReadData()
    @State var alertSudahLogin = false
    @Environment(\.isSearching) var isSearching
    
    @Binding var halamanTes:Bool
    @Binding var i : Int
    @Binding var result: [String:Double]
    @Binding var LJK : [Int]
    @Binding var sudahTes : String
    
    var body: some View{
        VStack{
            
            if !isSearching{
                HStack{
                    Text("Rekomendasi Jurusan").bold().font(.system(size: 22))
                    Spacer()
                    if sudahTes == "true"{
                        NavigationLink(destination:RekomendasiJurusanView()){
                            Text("Lihat Semua").font(.system(size: 15))
                        }
                    }
                }.padding(.horizontal).padding(.top,20)
                
                if sudahTes == "true"{
                    let majors = myRekomen.findMajor()
                    VStack{
                        
                        RekomendasiJurusanViewMainScreen()
                    }

                    
                }
                else{
                    //MUNCULIN JURUSAN BERDASARKAN HASIL TEST RIASEC
                   
                    if sudahLogin{
                        NavigationLink(destination: TestHomeView(i:$i,result:$result,LJK:$LJK,halamanTes: $halamanTes, sudahTes: $sudahTes)) {
                            VStack{
                                VStack{
                                    Spacer()
                                    Text("Ambil tes RIASEC untuk melihat hasil").bold()
                                }.padding().frame(width: UIScreen.main.bounds.width-40, height: 170).background(Image("bannerRiasec").resizable()).cornerRadius(10)
                                    .foregroundColor(Color.white)
                                    
                            }
                            
                        }.accentColor(Color.black)
                    }else{
                        Button(action: {
                            
                            alertSudahLogin = true
                        }) {
                            VStack{
                                Spacer()
                                Text("Ambil Tes RIASEC untuk melihat hasil").bold()
                            }.padding().frame(width: UIScreen.main.bounds.width-40, height: 170).background(Image("bannerRiasec").resizable()).cornerRadius(10)
                                .foregroundColor(Color.white)
                        }
                       
                    }
                    
                }
                Divider()
                
                ScrollView(.horizontal,  showsIndicators: false){
                    HStack{
                        ForEach($fakultasList){hasil in
                            NavigationLink(destination: DetailFakultasView(jurusan: hasil)) {
                            FakultasCardView(jurusan: hasil)
                            }.accentColor(Color.black)
                        }
                    }
                    
                }.padding(.top,10)
                    .padding(.bottom,10)
                    .padding(.leading,15)
                Divider()
                VStack{
                    HStack{
                        
                        Text("Terbanyak Diminati").font(.system(size: 22)).bold()
                        Spacer()
                        NavigationLink(destination: FavoritePageView()) {
                                        Text("Lihat Semua").font(.system(size: 15))
                                    }
                    }.padding(.horizontal)
                    
                    if sort == 0{
                    VStack{
                            LazyVGrid(columns: columnsIkon, spacing: 20){
                                let hasil = datas.dataJurusan
                                ForEach(0..<2){item in
                                    NavigationLink(destination: DetailJurusanView(jurusan: hasil[item])) {
                                        jurusanCardViewIkon(jurusan: hasil[item])
                                    }.accentColor(Color.black)
                                    
                                }
                            }
                    }.padding(.top,-10)
                        
                    }else{
                        VStack{
                                let hasil = datas.dataJurusan
                                ForEach(0..<3){item in
                                    NavigationLink(destination: DetailJurusanView(jurusan: hasil[item])) {
                                        jurusanCardViewDaftar(jurusan: hasil[item])
                                    }.accentColor(Color.black)
                                }
                        }
                    }
                    Spacer()
                }
            }
            
            else{
                VStack{
                    
                    HStack(spacing: 0){
                        JurusanList(jurusan: $jurusan, searchText: $searchText, sort: $sort)
                    }
                    
                }.padding(.top)
            }
            Spacer()
        }.alert(isPresented: $alertSudahLogin) {
            Alert(
                title: Text("Masuk Terlebih Dahulu"),
                message: Text("Untuk mengambil tes, kamu diharapkan memiliki akun terlebih dahulu"),
                dismissButton: .default(Text("Ok"))
              
            )
        }
        .navigationTitle(Text("Explorasi"))
            .toolbar {
                           ToolbarItem(placement: .primaryAction) {
                               Menu {
                                   Picker(selection: $sort, label: Text("Sorting options")) {
                                                            Label("Ikon", systemImage: "square.grid.2x2").tag(0)
                                                            Label("Daftar", systemImage: "list.bullet").tag(1)
                                                           }
                                   

                                  
                               }
                               label: {
                                   Label("More", systemImage: "ellipsis.circle")
                               }
                           }
                       }
            .onAppear(perform: {
                for item in datas.dataJurusan{
                    if !fakultasList.contains(where: {coba in
                        item.fakultas == coba.fakultas
                    }){
                        fakultasList.append(item)
                    }
                    
                }
                if !urut{
                    jurusan = ReadData().dataJurusan.sorted {$0.namaJurusan < $1.namaJurusan}
                    urut.toggle()
                }else if urut{
                    jurusan = ReadData().dataJurusan.sorted {$0.namaJurusan > $1.namaJurusan}
                    urut.toggle()
                }
                email = UserDefaults.standard.string(forKey: "Email") ?? ""
                if email == ""{
                    sudahLogin = false
                }else{
                    sudahLogin = true
                }
                
            })
    }
}

struct JurusanList: View{
    @Binding var jurusan : [JurusanElement]
    @Binding var searchText : String
    @Binding var sort : Int
    var columnsIkon = Array(repeating: GridItem(.flexible(minimum: 100, maximum: 300)), count: 2)
    var body: some View{
        ScrollView(.vertical){
            VStack{
                if sort == 1 {
                    ForEach(jurusan.filter({ searchText.isEmpty ? true : $0.namaJurusan.localizedStandardContains(searchText)})){data in
                        NavigationLink(destination: DetailJurusanView(jurusan: data)){
                            jurusanCardViewDaftar(jurusan: data)
                        }.accentColor(.black)

                    }
                }else{
                    LazyVGrid(columns: columnsIkon, spacing: 20){
                        ForEach(jurusan.filter({ searchText.isEmpty ? true : $0.namaJurusan.localizedStandardContains(searchText)})){data in
                            NavigationLink(destination: DetailJurusanView(jurusan: data)){
                                jurusanCardViewIkon(jurusan: data)
                            }.accentColor(.black)
                            
                        }
                    }
                }
                
                
            }.padding(.bottom)
        }.frame(width: UIScreen.main.bounds.width)
    }
}
