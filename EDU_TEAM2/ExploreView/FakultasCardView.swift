//
//  FakultasCardView.swift
//  EduTeam
//
//  Created by Reinaldo Lordianto on 05/10/21.
//

import SwiftUI

extension Color {
init(hex: Int, opacity: Double = 1.0) {
    let red = Double((hex & 0xff0000) >> 16) / 255.0
    let green = Double((hex & 0xff00) >> 8) / 255.0
    let blue = Double((hex & 0xff) >> 0) / 255.0
    self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
}
}

struct FakultasCardView: View {
    @Binding var jurusan: JurusanElement
    @State var warna = Color(hex: 0xF27E51)
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
    var body: some View {
        VStack{
            Spacer()
            Text(jurusan.fakultas).font(.system(size: 17, weight: .bold)).foregroundColor(Color.white)
            Spacer()
            
        }.frame(width: 150, height: 80).background(warna).cornerRadius(10)
            .onAppear(perform: checkWarna)
    }
    
    func checkWarna(){
        if jurusan.fakultas == mipa{
            warna = Color(hex: 0xD04337)
        }else if jurusan.fakultas == olahraga{
            warna = Color(hex: 0xF27E51)
        }else if jurusan.fakultas == pendidikan{
            warna = Color(hex: 0xFAA03A)
        }else if jurusan.fakultas == ekoBisnis{
            warna = Color(hex: 0x72B65A)
        }else if jurusan.fakultas == pertanian{
            warna = Color(hex: 0x3B7129)
        }else if jurusan.fakultas == kesehatan{
            warna = Color(hex: 0x0A9892)
        }else if jurusan.fakultas == teknik{
            warna = Color(hex: 0x004AAD)
        }else if jurusan.fakultas == seni{
            warna = Color(hex: 0x8131F4)
        }else if jurusan.fakultas == ilmuTerapan{
            warna = Color(hex: 0x686868)
        }else if jurusan.fakultas == sosialHumaniora{
            warna = Color(hex: 0xA7745A)
        }else if jurusan.fakultas == sastraBudaya{
            warna = Color(hex: 0x5F2D1E)
        }
    }
}

struct jurusanCardViewIkon: View{
    @ObservedObject var jurusan: JurusanElement
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
    @State var gambarjurusan = ""
    var body: some View{
        VStack{
            Image(gambarjurusan).resizable().scaledToFit().frame(width: 200, height: 160)
            VStack{
                Text(jurusan.namaJurusan).font(.system(size: 17)).frame(height: 45)
            }.cornerRadius(10)
        }.frame(width: 160, height: 210).cornerRadius(10).background(Color.white).padding(.top, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(hex: 0xC9C9C9), lineWidth: 1).position(x:80,y: 120)
                
        )
            .onAppear(){
                checkFakultas()
            }
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
}

struct jurusanCardViewDaftar: View{
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
    @ObservedObject var jurusan: JurusanElement
    var body: some View{
        HStack{
            Image(gambarjurusan).resizable().frame(width: 40, height: 40).cornerRadius(10)
            Text(jurusan.namaJurusan).font(.system(size: 20))
            Spacer()
        }.padding(.horizontal)
        .onAppear(){
            checkFakultas()
        }
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
}

//struct FakultasCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        FakultasCardView()
//    }
//}
