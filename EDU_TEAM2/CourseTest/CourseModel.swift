//
//  CourseModel.swift
//  EDU_TEAM2
//
//  Created by Ahmad Nur Alifullah on 06/11/21.
//

import Foundation
struct TesCourseElement: Codable {
    let id : Int
    let matkul  : [MataKuliah]
    let pertanyaan : [[Pertanyaan]]

}
struct MataKuliah: Codable{
    let matkul : String
    let bab : [Bab]
    
}
struct Bab : Codable, Identifiable{
    let id: Int
    let bab : String
    let subbab : [Subbab]
}
struct Pertanyaan: Codable {
    let pertanyaan, jawaban, gambar : String
    let explanation : Explanation
    let option : [Option]
}
struct Explanation : Codable{
    let gambar : String
    let explain : String
}
struct Option: Codable, Identifiable{
    let id : Int
    let option : String
}
struct Subbab : Codable{
    let isi : String
    let gambar : [String]
}

func LoadLJK_course (quiz : String, soal1 : Int, soal2 : Int ) -> [[Int]]{
    if let data = UserDefaults.standard.object(forKey: quiz) as? [[Int]] {
        return data
    }else {
        return [Array(repeating: 10, count: soal1), Array(repeating: 10, count: soal2)]
    }
}

func LoadisCorrect (quiz : String, soal1 : Int, soal2 : Int) -> [[Bool]]{
    if let data = UserDefaults.standard.object(forKey: quiz) as? [[Bool]] {
        return data
    }else {
        return [Array(repeating: false, count: soal1),Array(repeating: false, count: soal2)]
    }
}
func LoadcurrentBab (quiz : String) -> [[Int]]{
    if let data = UserDefaults.standard.object(forKey: quiz) as? [[Int]] {
        return data
    }else {
        return [[1,0,0,0,0,0],[1,0,0]]
    }
}
func LoadScoreCourse (quiz : String) -> [Int]{
    if let data = UserDefaults.standard.integer(forKey: quiz) as? [Int] {
        return data
    }else {
        return [0,0]
    }
}
func SaveScoreCourse(quiz : String , score : [Int]){
    UserDefaults.standard.set(score, forKey: quiz)
}

func SavecurrentBab(quiz : String , result : [[Int]]){
    UserDefaults.standard.set(result, forKey: quiz)
}

func SaveLJK_course(quiz : String , result : [[Int]]){
    UserDefaults.standard.set(result, forKey: quiz)
}

func SaveisCorrect(quiz : String , result : [[Bool]]){
    UserDefaults.standard.set(result, forKey: quiz)
}
