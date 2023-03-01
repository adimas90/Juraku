//
//  HasilTesView.swift
//  EDU_TEAM2
//
//  Created by Winner Tjandrawan on 26/10/21.
//

import SwiftUI

struct HasilTesView: View {
    @StateObject var datas = ReadData()
    @State var showArtikelRiasec = false
    @State var indexArtikel : Int = 0
    @State var sudahTest = true
    @StateObject var myRekomen:RekomendasiJurusan = RekomendasiJurusan()
    @Binding var halamanTes:Bool
    @Binding var i : Int
    @Binding var result: [String:Double]
    @Binding var LJK : [Int]
    @Binding var sudahTes : String
        var body: some View {
            ZStack{
                Color(hex: "F2F2F6")
                ScrollView{
                    VStack{
                        Spacer()
                        VStack{
                            //Skor RIASEC Baris pertama
                            HStack{
                                Spacer()
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
                                Spacer()
                            }
                            Text("Terakhir tes pada \(UserDefaults.standard.string(forKey: "Tanggal") ?? "")").font(.caption).foregroundColor(.gray)
                            
                        }
                        .padding(.all,10)
                        .background(Color.white)
                        .cornerRadius(10)
                        
                        //Section Hasil Tes RIASEC detail
                        Spacer(minLength: 15)
                        //Section Header
                        HStack{
                            Text("Hasil Tes RIASEC").font(.headline).bold()
                            Spacer()
                        }
                        Spacer()
                        //5 baris performa tiap RIASEC
                        VStack{
                            VStack{
                                HStack{
                                    Text("Realistic").foregroundColor(.black)
                                    Spacer()
                                    Text(String(format: "%.0f", myRekomen.result["R"] ?? 0)).foregroundColor(Color(hex: "757575"))
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                }
                                if let value = myRekomen.result["R"] as? Double{
                                    ProgressView(value: value, total: 7)
                                        .frame(height: 10)
                                        .accentColor(Color(hex: "638ECC"))
                                        .scaleEffect(CGSize(width: 1.0, height: 2.0))
                                }
                                
                            }.padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .onTapGesture {
                                showArtikelRiasec = true
                                indexArtikel = 0
                            }
                            
                            VStack{
                                HStack{
                                    Text("Investigative")
                                    Spacer()
                                    Text(String(format: "%.0f", myRekomen.result["I"] ?? 0)).foregroundColor(Color(hex: "757575"))
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                }
                                if let value = myRekomen.result["I"] as? Double{
                                    ProgressView(value: value, total: 7)
                                        .frame(height: 10)
                                        .accentColor(Color(hex: "638ECC"))
                                        .scaleEffect(CGSize(width: 1.0, height: 2.0))
                                }
                                
                            }.padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .onTapGesture {
                                showArtikelRiasec = true
                                indexArtikel = 1
                            }
                            
                            VStack{
                                HStack{
                                    Text("Artistic")
                                    Spacer()
                                    Text(String(format: "%.0f", myRekomen.result["A"] ?? 0)).foregroundColor(Color(hex: "757575"))
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                }
                                if let value = myRekomen.result["A"] as? Double{
                                    ProgressView(value: value, total: 7)
                                        .frame(height: 10)
                                        .accentColor(Color(hex: "638ECC"))
                                        .scaleEffect(CGSize(width: 1.0, height: 2.0))
                                }
                                
                            }.padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .onTapGesture {
                                showArtikelRiasec = true
                                indexArtikel = 2
                            }
                            
                            VStack{
                                
                                HStack{
                                    Text("Social")
                                    Spacer()
                                    Text(String(format: "%.0f", myRekomen.result["S"] ?? 0)).foregroundColor(Color(hex: "757575"))
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                }
                                if let value = myRekomen.result["S"] as? Double{
                                    ProgressView(value: value, total: 7)
                                        .frame(height: 10)
                                        .accentColor(Color(hex: "638ECC"))
                                        .scaleEffect(CGSize(width: 1.0, height: 2.0))
                                }
                                
                            }.padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .onTapGesture {
                                showArtikelRiasec = true
                                indexArtikel = 3
                            }
                            
                            VStack{
                                HStack{
                                    Text("Enterprising")
                                    Spacer()
                                    Text(String(format: "%.0f", myRekomen.result["E"] ?? 0)).foregroundColor(Color(hex: "757575"))
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                }
                                if let value = myRekomen.result["E"] as? Double{
                                    ProgressView(value: value, total: 7)
                                        .frame(height: 10)
                                        .accentColor(Color(hex: "638ECC"))
                                        .scaleEffect(CGSize(width: 1.0, height: 2.0))
                                }
                            }.padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .onTapGesture {
                                showArtikelRiasec = true
                                indexArtikel = 4
                            }
                            
                            VStack{
                                HStack{
                                    Text("Conventional")
                                    Spacer()
                                    Text(String(format: "%.0f", myRekomen.result["C"] ?? 0)).foregroundColor(Color(hex: "757575"))
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                }
                                if let value = myRekomen.result["C"] as? Double{
                                    ProgressView(value: value, total: 7)
                                        .frame(height: 10)
                                        .accentColor(Color(hex: "638ECC"))
                                        .scaleEffect(CGSize(width: 1.0, height: 2.0))
                                }
                            }.padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .onTapGesture {
                                showArtikelRiasec = true
                                indexArtikel = 5
                            }
                            
                        }
                        
                        HStack{
                            Text("Rekomendasi Jurusan").font(.headline).bold()
                            Spacer()
                        }.padding(.vertical,10)
                        
                        VStack(alignment:.leading){
                            if sudahTest{
                                let majors = myRekomen.findMajor()
                                //print(majors.count)
                                ForEach(0..<majors.count){ item in
                                    ForEach(datas.dataJurusan){hasil in
                                        if majors[item] == hasil.namaJurusan{
                                            HStack{
                                                NavigationLink(destination: DetailJurusanView(jurusan: hasil)) {
                                                    jurusanCardViewDaftar(jurusan: hasil)
                                                }.accentColor(Color.black)
                                            }
                                        }
                                    }
                                    
                                }
                            }else{
                                HStack{
                                    Image(systemName: "person.fill")
                                        .resizable()
                                        .frame(width: 40, height: 40, alignment: .center)
                                    Text("Belum melakukan tes").font(.title2)
                                    Spacer()
                                }
                            }
                        }
                        .padding(.bottom, 20)
                        .padding(.top, 20)
                        .background(Color.white)
                        .cornerRadius(10)
                        
                        Spacer(minLength: 20)
                        NavigationLink(
                            destination: TestHomeView(i: $i, result: $result, LJK: $LJK,halamanTes: $halamanTes, sudahTes: $sudahTes)){
                                HStack{
                                    Spacer()
                                    Text("Tes Ulang").font(.system(size: 15, weight: .bold))
                                        .foregroundColor(.white)
                                    Spacer()
                                }.padding(.all)
                                .background(Color(hex: "638ECC"))
                                .border(Color(hex: "0079FF"), width: 1)
                                .cornerRadius(10)
                                
                        }
                    }.navigationBarTitle("Hasil Tes RIASEC",displayMode: .inline)
                    .padding(.all,20)
                }
            }
            
            .onAppear(){ //refresh score
                myRekomen.i = LoadScore(quiz: "lastScore")
                myRekomen.result = LoadResult(quiz: "lastResult")
                myRekomen.LJK = LoadLJK(quiz: "lastLJK")
                myRekomen.calculateResult()
            }
            .sheet(isPresented: $showArtikelRiasec, content: {
                ArtikelRiasecView(indexArtikel: $indexArtikel)
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

//struct HasilTesView_Previews: PreviewProvider {
//    static var previews: some View {
//        HasilTesView()
//    }
//}
