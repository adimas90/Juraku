//
//  User.swift
//  EDU_TEAM2
//
//  Created by Winner Tjandrawan on 26/10/21.
//

import Foundation

let defaults = UserDefaults.standard
let nama = defaults.string(forKey: "Nama")
let email = defaults.string(forKey: "Email")
let image = defaults.data(forKey: "Foto")
let sudahTes = defaults.string(forKey: "SudahTes")
let onBoarding = defaults.bool(forKey: "SudahOnBoarding")
