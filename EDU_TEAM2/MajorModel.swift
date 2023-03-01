//
//  MajorModel.swift
//  EDU_TEAM2
//
//  Created by Ahmad Nur Alifullah on 17/11/21.
//

import Foundation
// MARK: - WelcomeElement
struct MajorRiasec: Codable {
    let id: Int
    let riasec: String
    let majorIndo: [String]

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case riasec = "RIASEC"
        case majorIndo = "Major Indo"
    }
}

