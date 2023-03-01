//
//  ButtonModifier.swift
//  Quiz
//
//  Created by Dennis Parussini on 10.08.19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import SwiftUI

struct AnswerButtonModifier: ViewModifier {
    var backcolor : Color
    func body(content: Content) -> some View {
        content
            .frame(width: 320, height: 48, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(hex: 0xDADADA),lineWidth: 1 )).background(RoundedRectangle(cornerRadius: 10).fill(backcolor))
    }
}

struct AnswerButton: View {
    var backColor: Color
    var answer: String
    var foregroundColor : Color
    var onTap: () -> Void
    
    var body: some View {
        Button(action: {
            self.onTap()
        }) {
            if backColor != Color.white{
                Text(answer)
                    .frame(width: 550)
                    .modifier(AnswerButtonModifier(backcolor: backColor))
                    .foregroundColor((foregroundColor))
                    .font(.system(size: 17, weight: .bold))
                    
            }else{
                Text(answer)
                    .frame(width: 550)
                    .modifier(AnswerButtonModifier(backcolor: backColor))
                    .foregroundColor(Color.gray)
                    .font(.system(size: 17, weight: .bold))
            }
            
        }
    }
}

struct AnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        AnswerButton(backColor: Color.white, answer: "Hello", foregroundColor: Color.white, onTap: {})
    }
}
