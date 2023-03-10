//
//  OnboardingStepView.swift
//  Onboarding
//
//  Created by Augustinas Malinauskas on 06/07/2020.
//  Copyright © 2020 Augustinas Malinauskas. All rights reserved.
//

import SwiftUI

struct OnboardingStepView: View {
    var data: OnboardingDataModel
    
    var body: some View {
        VStack {
            Image(data.image)
                .resizable()
                .scaledToFit()
                .frame(width: 290, height: 290)
                .padding(.bottom, 50)
            
            Text(data.heading)
                .font(.system(size: 28, design: .rounded))
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            Text(data.text)
                .font(.system(size: 16, design: .rounded))
                .fontWeight(.light)
                .frame(width: 290)
                .foregroundColor(Color(hex: 0x7C7C7C))
            
                .multilineTextAlignment(.center)
        }
        .padding()
        .padding(.bottom, 100)
    }
}

struct OnboardingStepView_Previews: PreviewProvider {
    static var data = OnboardingDataModel.data[0]
    static var previews: some View {
        OnboardingStepView(data: data)
    }
}
