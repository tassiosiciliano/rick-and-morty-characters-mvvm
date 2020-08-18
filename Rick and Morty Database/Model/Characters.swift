//
//  Characters.swift
//  Rick and Morty Database
//
//  Created by Tassio Siciliano Donati on 15/04/20.
//  Copyright © 2020 Tassio Siciliano Donati. All rights reserved.
//

import Foundation

// MARK: - User
struct User: Codable, Hashable {
    let info: Info
    let results: [Results]
}

// MARK: - Info
struct Info: Codable, Hashable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - Result
struct Results: Codable, Hashable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let location: Location?
    let image: String?
}

// MARK: - Location
struct Location: Codable, Hashable {
    let name: String?
}

// MARK: - Sections
enum Sections {
    case main
}
