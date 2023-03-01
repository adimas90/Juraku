//
//  EksplorasiView.swift
//  EDU_TEAM2
//
//  Created by Winner Tjandrawan on 26/10/21.
//

import SwiftUI

struct EksplorasiView: View {
    @StateObject var datas = ReadData()
    var columnsIkon = Array(repeating: GridItem(.flexible(minimum: 100, maximum: 200)), count: 2)
    var columnsDaftar = Array(repeating: GridItem(.flexible(minimum: 100, maximum: 200)), count: 1)
    let defaults = UserDefaults.standard
    @State var jurusan :[JurusanElement] = ReadData().dataJurusan
    @State var sorts: Int = 0
    @State var urut = false
    @Environment(\.isSearching) var isSearching
    
    @StateObject var myRekomen:RekomendasiJurusan = RekomendasiJurusan()
    
    @State var nama: String = UserDefaults.standard.string(forKey: "Nama") ?? ""
    @Binding var email : String
    @State private var sort: Int = 0
    @State var offset : CGFloat = UIScreen.main.bounds.width
    @State var ikonView = true
    @State var searchText : String = ""
    @State var sudahLogin = false
    @State var alertSudahLogin = false
    @State var searchChange = true
    
    @Binding var halamanTes:Bool
    @Binding var i : Int
    @Binding var result: [String:Double]
    @Binding var LJK : [Int]
    @Binding var sudahTes : String
    
    var body: some View {
        NavigationView{
            ScrollView{
                
                search(searchText: $searchText, jurusan: $jurusan, email: $email, sort: $sort, sorts: $sorts, urut: $urut, halamanTes: $halamanTes,i: $i, result: $result, LJK: $LJK, sudahTes: $sudahTes)
                
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                
                .navigationTitle(Text("Explorasi"))
                .toolbar {
                               ToolbarItem(placement: .primaryAction) {
                                   Menu {
                                       Picker(selection: $sort, label: Text("Sorting options")) {
                                                                Label("Ikon", systemImage: "square.grid.2x2").tag(0)
                                                                Label("Daftar", systemImage: "list.bullet").tag(1)
                                                               }
                                       Section {
                                           Button(action: {
                                               if !urut{
                                                   jurusan = ReadData().dataJurusan.sorted {$0.namaJurusan < $1.namaJurusan}
                                                   urut.toggle()
                                               }else if urut{
                                                   jurusan = ReadData().dataJurusan.sorted {$0.namaJurusan > $1.namaJurusan}
                                                   urut.toggle()
                                               }
        
                                           }) {
                                               if !urut{
                                                   Label("Name", systemImage: "chevron.up")
                                               }else if urut{
                                                   Label("Name", systemImage: "chevron.down")
                                               }
        
                                           }
                                       }


                                      
                                   }
                                   label: {
                                       Label("More", systemImage: "ellipsis.circle")
                                   }
                               }
                           }
            }
           

         
            
        }
            
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }

    
}

//struct EksplorasiView_Previews: PreviewProvider {
//    static var previews: some View {
//        EksplorasiView()
//    }
//}
