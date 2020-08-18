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
    let status: Status?
    let species: Species?
    let gender: Gender?
    let location: Location?
    let image: String?
}

enum Gender: String, Codable, Hashable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable, Hashable {
    let name: String?
}

enum Species: String, Codable, Hashable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable, Hashable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

// MARK: - Sections
enum Sections {
    case main
}
