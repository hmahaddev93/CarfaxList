//
//  Vehicle.swift
//  CarfaxList
//
//  Created by Khatib H. on 7/30/21.
//

import Foundation

struct Vehicle: Codable {
    let year: Int
    let make: String
    let model: String
    let trim: String
    let currentPrice: Double
    let mileage: Double
    let dealer: Dealer
    let images: VehicleImages
}

struct VehicleImages: Codable {
    let large: [String]
    let medium: [String]
    let small: [String]
}
