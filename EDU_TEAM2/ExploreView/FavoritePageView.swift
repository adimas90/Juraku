//
//  FavoritePageView.swift
//  EduTeam
//
//  Created by Reinaldo Lordianto on 13/10/21.
//

import SwiftUI

struct FavoritePageView: View {
    @State var sort: Int = 0
    @StateObject var datas = ReadData()
    var columnsIkon = Array(repeating: GridItem(.flexible(minimum: 100, maximum: 200)), count: 2)
    var columnsDaftar = Array(repeating: GridItem(.flexible(minimum: 100, maximum: 200)), count: 1)
    var body: some View {
            ScrollView{
                VStack{
                    if sort == 0{
                    VStack{
                        var datasCount = datas.dataJurusan
                            LazyVGrid(columns: columnsIkon, spacing: 20){
                                ForEach(0..<10){hasil in
                                    NavigationLink(destination: DetailJurusanView(jurusan: datasCount[hasil])) {
                                        jurusanCardViewIkon(jurusan: datasCount[hasil])
                                    }.accentColor(Color.black)
                                }
                            }
                        
                        }
                        
                    }else{
                        VStack{
                                    ForEach(datas.dataJurusan){hasil in
                                        NavigationLink(destination: DetailJurusanView(jurusan: hasil)) {
                                            jurusanCardViewDaftar(jurusan: hasil)
                                        }.accentColor(Color.black)
                                    }
                                
                        }.padding()
                    }
                }
            }
            .navigationBarTitle(Text("Terbanyak Diminati"))
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

struct FavoritePageView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePageView()
    }
}
