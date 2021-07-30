//
//  CarfaxListApp.swift
//  CarfaxList
//
//  Created by Khateeb Mahad Hussain on 7/30/21.
//

import SwiftUI
import UIKit

@main
struct CarfaxListApp: App {
    
    init() {
        URLCache.shared.removeAllCachedResponses()
    }
    
    var body: some Scene {
        WindowGroup {
            VehicleListView()
        }
    }
}
