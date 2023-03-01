//
//  BoardingTesMinat.swift
//  EduTeam
//
//  Created by Ahmad Nur Alifullah on 01/11/21.
//

import SwiftUI

struct BoardingTesMinat: View {
    @Binding var konfirmasiTes : String
    @Binding var halamantes : Bool
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(alignment: .center, spacing: 10 ){
            Spacer()
            Image("Ambil Tes Sekarang")
                .resizable()
                .scaledToFit()
                .frame(width: 290, height: 290)
                .padding(.bottom, 50)
            Text("Ambil Tes Sekarang?").font(.system(size: 28)).bold()
                .font(Font.title.bold())
            HStack{
                Text("Dengan mengambil tes ini, kamu akan lebih mengetahui jurusan idealmu").multilineTextAlignment(.center)
                    .foregroundColor(Color.gray)
                    .frame(width: 290)
                    .font(.system(size: 16))
                    
            }.padding(.bottom,40)
            

            AnswerButton(backColor: Color(red: 99/255, green: 142/255, blue: 204/255), answer: "Mulai Tes", foregroundColor: Color.white, onTap: {
                halamantes = true
                konfirmasiTes = "true"
                
            })
            Button{
                konfirmasiTes = "true"
                halamantes = false
            }label:{
                Text("Nanti saja").foregroundColor(Color.gray)
                    .font(.system(size: 17)).padding(.horizontal)
                    .padding(.top,5)
            }
            
        }.padding(.bottom,80)
        
        
    }
}

//struct BoardingTesMinat_Previews: PreviewProvider {
//    static var previews: some View {
//        BoardingTesMinat()
//    }
//}
