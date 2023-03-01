//
//  ModelJurusan.swift
//  EduTeam
//
//  Created by Reinaldo Lordianto on 05/10/21.
//

import Foundation

// MARK: - JurusanElement
class JurusanElement: Decodable, Identifiable, ObservableObject {
    var id = UUID()
    var idJurusan: Int
    var namaJurusan, definisi, alasan, karakter: String
    var matkul, profesi, similiar: [String]
    var kampus: [String]
    var fakultas: String
    
    init(id: UUID, idJurusan:Int, namaJurusan:String, definisi:String, alasan:String, matkul:[String], karakter:String, profesi:[String], similiar:[String], kampus:[String], fakultas:String){
        self.id = id
        self.idJurusan = idJurusan
        self.namaJurusan = namaJurusan
        self.definisi = definisi
        self.alasan = alasan
        self.matkul = matkul
        self.karakter = karakter
        self.profesi = profesi
        self.similiar = similiar
        self.kampus = kampus
        self.fakultas = fakultas
    }

    enum CodingKeys: String, CodingKey {
        case idJurusan
        case namaJurusan
        case definisi
        case alasan
        case matkul
        case karakter
        case profesi
        case similiar
        case kampus
        case fakultas
    }
}

class ReadData: ObservableObject{
    @Published var dataJurusan = [JurusanElement]()
    
    init(){
        loadData()
    }
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "databaseJurusan", withExtension: "json")
        else{
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        
        let dataJurusan = try? JSONDecoder().decode([JurusanElement].self, from: data!)
        self.dataJurusan = dataJurusan!
    }
    
}

typealias Jurusan = [JurusanElement]
