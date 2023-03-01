//
//  DetailUniversitasView.swift
//  EduTeam
//
//  Created by Reinaldo Lordianto on 19/10/21.
//

import SwiftUI

struct DetailUniversitasView: View {
    var namaKampus: String
    @StateObject var datas = ReadDataUniv()
    @State var namaUniv : String = ""
    @State var tentangUniv : String = ""
    @State var Lokasi: String = ""
    @State var Akreditasi : String = ""
    @State var Website :String = ""
    @StateObject var univ : UnivElement = UnivElement(id: UUID(), jurusan: "", universitas: "", tentang: "", lokasi: "", akreditasi: "", website: "")
    var body: some View {
        ScrollView{
            
                VStack{                    
                    websiteView(univ: univ)
                }.background(Color(hex: 0xF2F2F6))
            
            
        }.navigationBarTitleDisplayMode(.inline)
            .onAppear(){
                for i in datas.dataUniv{
                    if i.Universitas == namaKampus{
                        univ.Website = i.Website
                        univ.Universitas = i.Universitas
                        univ.Akreditasi = i.Akreditasi
                        univ.Lokasi = i.Lokasi
                        univ.Tentang = i.Tentang
                        univ.Jurusan = i.Jurusan
                        univ.id = i.id
                        univ.objectWillChange.send()
                    }
                }
            }
    }
}
