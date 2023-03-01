//
//  ModelUniv.swift
//  EDU_TEAM2
//
//  Created by Reinaldo Lordianto on 17/11/21.
//

import Foundation

class UnivElement: Decodable, Identifiable, ObservableObject{
    var id:UUID = UUID()
    var Jurusan: String
    var Universitas: String
    var Tentang: String
    var Lokasi: String
    var Akreditasi: String
    var Website: String
    
    init(id:UUID, jurusan:String, universitas:String, tentang:String, lokasi:String, akreditasi:String, website:String){
        self.id = id
        self.Jurusan = jurusan
        self.Universitas = universitas
        self.Tentang = tentang
        self.Lokasi = lokasi
        self.Akreditasi = akreditasi
        self.Website = website
    }
    
   

    enum CodingKeys: String, CodingKey {
        case Jurusan
        case Universitas
        case Tentang
        case Lokasi
        case Akreditasi
        case Website
    }
}

class ReadDataUniv: ObservableObject{
    @Published var dataUniv = [UnivElement]()
    
    init(){
        loadData()
    }
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "dataUniv", withExtension: "json")
        else{
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        
        let dataUniv = try? JSONDecoder().decode([UnivElement].self, from: data!)
        self.dataUniv = dataUniv!
    }
    
}

typealias Universitas = [UnivElement]
