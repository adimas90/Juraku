//
//  PelajaranView.swift
//  EDU_TEAM2
//
//  Created by Winner Tjandrawan on 26/10/21.
//

import SwiftUI
import Firebase

struct PelajaranView: View {
    @ObservedObject var pelajaran = PelajaranViewModel()
    var listPelajaran = [Pelajaran]()
    @State var showActionSheet = false
    @State var toBeDeleted: IndexSet?
    
    init(){
        pelajaran.getData{_ in }
    }
    
    var body: some View {
        VStack{
            List{
                ForEach(pelajaran.listPelajaran){ item in
                    Section{
                        NavigationLink(
                            destination: HomeCourse(idmatkul : idChoosen(item.namaJurusan))){
                                HStack{
                                    Image("Teknik")
                                        .resizable()
                                        .frame(width: 80, height: 80, alignment: .center)
                                        .cornerRadius(10)
                                    VStack{
                                        Text(item.namaJurusan)
                                            .font(.headline)
                                            .bold()
                                    }
                                }.padding(.all, 10)
                            }
                    }
                }.onDelete(perform: delete)
            }.listStyle(InsetListStyle())
            
        }.navigationBarTitle("Pelajaran",displayMode: .inline)
        .actionSheet(isPresented: $showActionSheet, content: {
            ActionSheet(
                title: Text(""),
                message: Text("Apakah kamu mau menghapus pelajaran ini?").bold(),
                buttons: [
                    .destructive(Text("Hapus"), action: {
                        pelajaran.deleteData(pelajaranDelete: self.pelajaran.listPelajaran[toBeDeleted?.first ?? 0])
                    }),
                    .cancel(Text("Batal"))
            ])
        })
        .onAppear(perform: getDatas)
    }
    
    func getDatas(){
        pelajaran.getData{_ in }
    }
    
    func delete(at offsets: IndexSet){
        self.toBeDeleted = offsets
        self.showActionSheet = true
        // pelajaran.deleteData(pelajaranDelete: self.pelajaran.listPelajaran[offsets.first ?? 0])
    }
    func idChoosen(_ nama : String)-> Int{
        if nama == "Ilmu Komputer" || nama == "Teknik Informatika"{
            return 0
        }else if nama == "Sistem Informasi"{
            return 1
        }else{
            return 2
        }
    }
}

struct PelajaranView_Previews: PreviewProvider {
    static var previews: some View {
        PelajaranView()
    }
}
