import SwiftUI
import Firebase
import FirebaseFirestore


struct Pelajaran : Identifiable {
    var id : String
    var namaJurusan : String
}

class PelajaranViewModel: ObservableObject {
    @Published var listPelajaran = [Pelajaran]()
    
    func addData(namaJurusan: String){
        
        let db = Firestore.firestore()

        db.collection("pelajaran").addDocument(data: ["namaJurusan":namaJurusan]){error in
            
            if error == nil {
                self.getData{result in
                    if result == "sukses"{
                        
                    }
                }
            }else{
                print("Error add data broo")
            }
        }
    }
    
    func deleteData(pelajaranDelete: Pelajaran){
        @ObservedObject var pelajaran = PelajaranViewModel()
        let db = Firestore.firestore()
        
        
        db.collection("pelajaran").document(pelajaranDelete.id).delete(){error in
            if error == nil{
                DispatchQueue.main.async {
                    self.listPelajaran.removeAll{ pelajaran in
                        return pelajaran.id == pelajaranDelete.id
                    }
                }
            }else{
                print("error delete data bro")
            }
        }
    }
    
    func getData(completion:@escaping(String) ->()){
        let db = Firestore.firestore()
        
        db.collection("pelajaran").getDocuments { snapshot, error in
            
            //cek error
            if error == nil{
                //jika tidak ada error
                if let snapshot = snapshot {
                    //update list property di main thread
                    DispatchQueue.main.async {
                        //get all documents dan buat pelajaran
                        self.listPelajaran = snapshot.documents.map{ d in
                            //buat item pelajaran for each documents
                            
                            return Pelajaran(id: d.documentID, namaJurusan: d["namaJurusan"] as? String ?? "")
                            
                        }
                        completion("sukses")
                    }
                    
                }
            }else{
                print("error get data broo")
                completion("error")
            }
        }
    }
}


