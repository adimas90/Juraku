//
//  RekomendasiJurusanView.swift
//  EDU_TEAM2
//
//  Created by Reinaldo Lordianto on 22/11/21.
//

import SwiftUI

struct RekomendasiJurusanView: View {
    @StateObject var myRekomen:RekomendasiJurusan = RekomendasiJurusan()
    @StateObject var datas = ReadData()
    var body: some View {
        VStack{
            let majors = myRekomen.findMajor()
            ForEach(0..<majors.count){ item in
                ForEach(datas.dataJurusan){sapiman in
                    if majors[item] == sapiman.namaJurusan{
                        HStack{
                            NavigationLink(destination: DetailJurusanView(jurusan: sapiman)) {
                            jurusanCardViewDaftar(jurusan: sapiman)
                                
                            }.accentColor(Color.black)
                        }
                    }
                }
                
            }
            Spacer()
            
        }.padding(.top,20).navigationBarTitle("Rekomendasi Jurusan",displayMode: .inline)
            .onAppear(){
                //refresh score
                myRekomen.i = LoadScore(quiz: "lastScore")
                myRekomen.result = LoadResult(quiz: "lastResult")
                myRekomen.LJK = LoadLJK(quiz: "lastLJK")
                myRekomen.calculateResult()
            }
    }
}

struct RekomendasiJurusanViewMainScreen : View {
    @StateObject var myRekomen:RekomendasiJurusan = RekomendasiJurusan()
    @StateObject var datas = ReadData()
    var body: some View{
        let majors = myRekomen.findMajor()
        ForEach(0..<3){ item in
            ForEach(datas.dataJurusan){test in
                if majors[item] == test.namaJurusan{
                    HStack{
                        NavigationLink(destination: DetailJurusanView(jurusan: test)) {
                            jurusanCardViewDaftar(jurusan: test)
                        }.accentColor(Color.black)
                    }
                }
            }
            
        }.onAppear(){
            //refresh score
            myRekomen.i = LoadScore(quiz: "lastScore")
            myRekomen.result = LoadResult(quiz: "lastResult")
            myRekomen.LJK = LoadLJK(quiz: "lastLJK")
            myRekomen.calculateResult()
        }
    }
}

struct RekomendasiJurusanView_Previews: PreviewProvider {
    static var previews: some View {
        RekomendasiJurusanView()
    }
}
