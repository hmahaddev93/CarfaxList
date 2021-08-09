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
        // Clear all download cache
        URLCache.shared.removeAllCachedResponses()
    }
    
    var body: some Scene {
        WindowGroup {
            let modalManager: PartialModalManager = PartialModalManager()
            VehicleListView()
                .environmentObject(modalManager)
        }
    }
}
