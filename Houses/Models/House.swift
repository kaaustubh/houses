//
//  House.swift
//  Houses
//
//  Created by Kaustubh on 08/02/21.
//

import Foundation

struct House: Codable {
    let url: String
    let name, region, coatOfArms, words: String
    let titles, seats: [String]
    let currentLord, heir, overlord: String
    let founded: String
    let founder: String
    let diedOut: String
    let ancestralWeapons: [String]
    let cadetBranches, swornMembers: [String]
}

typealias Houses = [House]
