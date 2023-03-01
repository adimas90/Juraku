//
//  TesMinatModel.swift
//  EDU_TEAM2
//
//  Created by Ahmad Nur Alifullah on 01/11/21.
//

import Foundation

struct TesMinatElement: Codable {
    let idSoal: Int
    let english, indo, indikator: String

    enum CodingKeys: String, CodingKey {
        case idSoal = "id_soal"
        case english, indo, indikator
    }
}

typealias TesMinat = [TesMinatElement]


func SaveResult(quiz : String , result : [String : Double]){
    UserDefaults.standard.set(result, forKey: quiz)
}

func SaveScore(quiz : String , score : Int){
    UserDefaults.standard.set(score, forKey: quiz)
}

func SaveLJK(quiz : String , LJK : [Int]){
    UserDefaults.standard.set(LJK, forKey: quiz)
}

func LoadResult (quiz : String) -> [String : Double]{
    if let data = (UserDefaults.standard.object(forKey: quiz) as? [String : Double]) {
        var simpan:[String : Double] = [String : Double]()
//        for (key, value) in data{
//            simpan
//        }
        simpan["R"] = data["R"]
        simpan["I"] = data["I"]
        simpan["A"] = data["A"]
        simpan["S"] = data["S"]
        simpan["E"] = data["E"]
        simpan["C"] = data["C"]
        //return ["R" : data["R"]!,"I" : data["I"]!,"A" : data["A"]!,"S" : data["S"]!,"E" : data["E"]!,"C" : data["C"]! ]
        return simpan
    }else {
        return ["R":0,"I":0,"A":0,"S":0,"E":0,"C":0]
    }
}

func LoadScore (quiz : String) -> Int{
    if let data = UserDefaults.standard.integer(forKey: quiz) as? Int {
        return data
    }else {
        return 1
    }
}

func LoadLJK (quiz : String) -> [Int]{
    if let data = UserDefaults.standard.object(forKey: quiz) as? [Int] {
        return data
    }else {
        return [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]
    }
}
