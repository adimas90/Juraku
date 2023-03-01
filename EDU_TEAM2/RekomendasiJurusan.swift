//
//  RekomendasiJurusan.swift
//  EDU_TEAM2
//
//  Created by Reinaldo Lordianto on 22/11/21.
//

import Foundation

class RekomendasiJurusan : ObservableObject{
    let majorriasec = Bundle.main.decode([MajorRiasec].self, from: "RIASEC Major-Table.json")
    let tesminat_soal = Bundle.main.decode([TesMinatElement].self, from: "csvjson-2.json")
    @Published var result: [String:Double] = LoadResult(quiz: "lastResult")
    @Published var LJK : [Int] = LoadLJK(quiz: "lastLJK")
    @Published var i : Int = LoadScore(quiz: "lastScore")
    func findMajor()-> [String]{
        var majors = [String]()
        var indikator = [String]()
        if let resultsorted = riasecSorting() as? [[String]]{
            //pilihan satu dan dua masuk indikator
            indikator.append(resultsorted[0][0]+resultsorted[1][0])
            
            if resultsorted[0][0] == resultsorted[1][0]{
                indikator.append(resultsorted[1][0]+resultsorted[0][0])
            }
            
            //jika pilihan 2 dan 3 memiliki nilai sama maka pilihan 1 dan 3 masuk indikator
            if resultsorted[1][0] == resultsorted[2][0]{
                indikator.append(resultsorted[0][0]+resultsorted[2][0])
            }
            //jika pilihan 2 dan 3 memiliki nilai sama maka pilihan 1 dan 3 masuk indikator
            if resultsorted[0][0] == resultsorted[2][0]{
                indikator.append(resultsorted[1][0]+resultsorted[2][0])
            }
            //memasukkan tiap indikator dalam rekomendasi jurusan
            for item in indikator{
                for major in self.majorriasec{
                    if item == major.riasec{
                        for j in major.majorIndo{
                            majors.append("\(j)")
                        }
                    }
                }
            }
        }
        return majors
    }
    
    //Sorting Result Riasec
    func riasecSorting()->[[String]]{
        var resultsorted1 = [[String]]()
        var dummy_value : Double
        var dummy_key : String
        var i = 0
        var j = self.result.count - 1
        var result_key : [String] = ["R","I","A","S","E","C"]
        var result_value : [Double] = [self.result["R"] ?? 0.0,self.result["I"] ?? 0.0,self.result["A"] ?? 0.0,self.result["S"] ?? 0.0,self.result["E"] ?? 0.0,self.result["C"] ?? 0.0]
        while i < self.result.count{
            j = 5
            while j > i{
                if result_value[j] > result_value[j-1]{
                    dummy_value = result_value[j-1]
                    result_value[j-1] = result_value[j]
                    result_value[j] = dummy_value
                    
                    dummy_key = result_key[j-1]
                    result_key[j-1] = result_key[j]
                    result_key[j] = dummy_key
                }
                j = j - 1
            }
            i = i + 1
        }
        for n in 0..<self.result.count{
            resultsorted1.append(["\(result_key[n])", "\(result_value[n])"])
        }
        return resultsorted1
    }
    
    //Calculates Result Riasec From LJK
    func calculateResult(){
        self.result = ["R":0,"I":0,"A":0,"S":0,"E":0,"C":0]
        var index = 0
        for data in (self.LJK) {
            if(data == 1){
                switch tesminat_soal[index].indikator{
                case "R":
                    self.result["R"] = self.result["R"]! + 1
                case "I":
                    self.result["I"] = self.result["I"]! + 1
                case "A":
                    self.result["A"] = self.result["A"]! + 1
                case "S":
                    self.result["S"] = self.result["S"]! + 1
                case "E":
                    self.result["E"] = self.result["E"]! + 1
                case "C":
                    self.result["C"] = self.result["C"]! + 1
                default:
                    self.i = self.i
                }
            }
            index = index +  1
            
        }
    }
}
