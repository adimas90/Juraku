//
//  OnboardingModel.swift
//  Onboarding
//
//  Created by Augustinas Malinauskas on 06/07/2020.
//  Copyright © 2020 Augustinas Malinauskas. All rights reserved.
//

import Foundation
import SwiftUI

struct OnboardingDataModel {
    var image: String
    var heading: String
    var text: String
}

extension OnboardingDataModel {
    static var data: [OnboardingDataModel] = [
        OnboardingDataModel(image: "Explore", heading: "Eksplorasi Jurusan", text: "Mencari informasi tentang jurusan menjadi mudah dengan Juraku"),
        OnboardingDataModel(image: "Simulasi", heading: "Simulasi Jurusan", text: "Juraku mempermudah dalam mengetahui suatu jurusan dengan simulasi jurusan"),
        OnboardingDataModel(image: "Rekomendasi", heading: "Rekomendasi Jurusan", text: "Dapatkan rekomendasi jurusan yang ideal untukmu melalui tes"),
        
    ]
}
