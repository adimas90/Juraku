//
//  HomeCourse.swift
//  EDU_TEAM2
//
//  Created by Ahmad Nur Alifullah on 07/11/21.
//

import SwiftUI

struct HomeCourse: View {
    @State private var showModal = false
    @State private var materi = true
    @State private var quiz = false
    var idmatkul : Int
    var body: some View {
        ZStack{
            if materi{
                CoursePageView(idmatkul: self.idmatkul, materi: self.$materi, quiz: self.$quiz)
                    
            }else if quiz{
                Rectangle().fullScreenCover(isPresented: $quiz){
                    TestCourseView(showModal1: self.$showModal,materi: self.$materi, quiz: self.$quiz, idmatkul : self.idmatkul)
                }
               
                   
            }
        }
        .navigationBarItems(trailing:Button(action:{
            self.showModal.toggle()
        }, label :{
          Image(systemName: "list.bullet")
        })).sheet(isPresented: $showModal) {
            ListBabView(showModal: self.$showModal, materi: self.$materi, quiz: self.$quiz, idmatkul: self.idmatkul)
        }
            
    }
    func hideBar()->Bool{
        if self.idmatkul == 0 || self.idmatkul == 1{
            return false
        }else{
            return true
        }
    }
}

struct HomeCourse_Previews: PreviewProvider {
    static var previews: some View {
        HomeCourse(idmatkul: 0)
    }
}
