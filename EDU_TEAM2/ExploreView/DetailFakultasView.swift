//
//  DetailFakultasView.swift
//  EduTeam
//
//  Created by Reinaldo Lordianto on 18/10/21.
//

import SwiftUI

struct DetailFakultasView: View {
    @State private var sort: Int = 0
    var columnsIkon = Array(repeating: GridItem(.flexible(minimum: 100, maximum: 200)), count: 2)
    var columnsDaftar = Array(repeating: GridItem(.flexible(minimum: 100, maximum: 350)), count: 1)
    @State var urut = false
    @Binding var jurusan: JurusanElement
    @StateObject var datas = ReadData()
    var body: some View {
        ScrollView{
            Spacer()
            VStack{
                HStack{
                    if sort == 0 {
                            LazyVGrid(columns: columnsIkon, spacing: 20){
                                ForEach(datas.dataJurusan.filter{data in
                                    return data.fakultas == jurusan.fakultas
                                    
                                }){ hasil in
                                            NavigationLink(destination: DetailJurusanView(jurusan: hasil)){
                                                jurusanCardViewIkon(jurusan: hasil)
                                    }.accentColor(Color.black)
                                }
                            }
                    }else{
                            LazyVGrid(columns: columnsDaftar, spacing: 20){
                                ForEach(datas.dataJurusan.filter{data in
                                    return data.fakultas == jurusan.fakultas
                                    
                                }){ hasil in
                                    NavigationLink(destination: DetailJurusanView(jurusan: hasil)){
                                        jurusanCardViewDaftar(jurusan: hasil)
                                    }.accentColor(Color.black)
                                }
                            }.padding()
                        Spacer()   
                    }
                    Spacer()
                }
                Spacer()
                }
        }.navigationTitle(jurusan.fakultas).navigationBarTitleDisplayMode(.inline)
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
    }
}
//struct DetailFakultasView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailFakultasView()
//    }
//}
