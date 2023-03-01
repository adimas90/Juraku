//
//  ArtikelRiasecView.swift
//  EDU_TEAM2
//
//  Created by Winner Tjandrawan on 26/10/21.
//

import SwiftUI

struct ArtikelRiasecView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var indexArtikel : Int
    @State var arrayRiasec = riasecList[0]
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    Group{
                        
                        Image(arrayRiasec.nama).resizable().frame(height: 236)
                        Text(arrayRiasec.penjelasan)
                        Spacer(minLength: 20)
                    }
                    Group{
                        Text("Yang Perlu Diketahui").font(.title3).bold()
                        Text(arrayRiasec.yangPerluDiketahui)
                        Spacer(minLength: 20)
                    }
                    Group{
                        Text("Kelebihan Utama").font(.title3).bold()
                        Text(arrayRiasec.kelebihanUtama)
                        Spacer(minLength: 20)
                    }
                    Group{
                        Text("Pekerjaan dan Karir").font(.title3).bold()
                        Text(arrayRiasec.pekerjaanKarir)
                        Spacer(minLength: 20)
                    }
                    Group{
                        Text("Pelajaran yang dapat Dipelajari").font(.title3).bold()
                        Text(arrayRiasec.pelajaran)
                    }
                    
                }.padding(20)
                .onAppear(){
                    arrayRiasec = riasecList[indexArtikel]
                }
            }.navigationBarTitle("Artikel RIASEC",displayMode: .inline)
            .navigationBarItems(trailing: Button("Selesai"){
                self.presentationMode.wrappedValue.dismiss()
            }
            .accentColor(Color(hex: "638ECC"))
            )
        }
    }
}

struct ArtikelRiasecView_Previews: PreviewProvider {
    @State static var indexArtikel = 0
    static var previews: some View {
        ArtikelRiasecView(indexArtikel: .constant(indexArtikel))
    }
}
