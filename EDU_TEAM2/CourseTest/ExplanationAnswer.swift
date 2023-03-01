//
//  ExplanationAnswer.swift
//  EduTeam
//
//  Created by Ahmad Nur Alifullah on 26/10/21.
//

import SwiftUI

struct ExplanationAnswer: View {
    @Binding var showModal: Bool
    @Binding var explanation : String
    
    var body: some View {
        VStack{
            Text("\(explanation)")
                .padding()
            Spacer()
        }
        .navigationBarTitle("Penjelasan")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
                // Add your custom back button here
                .navigationBarItems(trailing:
                    Button(action: {
                    self.showModal.toggle()
                    }) {
                        HStack {
                            Text("Selesai")
                        }
                })
    }
}


