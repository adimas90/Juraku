//
//  ButtonModifier.swift
//  Quiz
//
//  Created by Dennis Parussini on 10.08.19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import SwiftUI

struct AnswerButtonModifierCourse: ViewModifier {
    var backcolor : Color
    func body(content: Content) -> some View {
        content
            .frame(width: 320, height: 48, alignment: .center)
            .background(backcolor)
            .cornerRadius(10)
    }
}

struct AnswerButtonCourse: View {
    var backColor: Color
    var answer: String
    var option: Option
    var foregroundColor : Color
    var onTap: () -> Void
    @State var selectedBtn: Int = 1
    
    
    var body: some View {
        
        Button(action: {
            self.onTap()
            self.selectedBtn = self.option.id
        }) {
            Text(answer)
                .modifier(AnswerButtonModifierCourse(backcolor: backColor))
                .foregroundColor(foregroundColor)
                .font(.system(size: 17, weight: .bold))
        }
    }
}

