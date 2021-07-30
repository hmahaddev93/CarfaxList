//
//  Dealer.swift
//  CarfaxList
//
//  Created by Khatib Mahad H. on 7/30/21.
//

import Foundation

struct Dealer: Codable {
    let address: String
    let city: String
    let state: String
    let zipCode: String
    let phone: String
    
    enum CodingKeys: String, CodingKey {
        case address
        case city
        case state
        case zipCode = "zip"
        case phone
    }
}
