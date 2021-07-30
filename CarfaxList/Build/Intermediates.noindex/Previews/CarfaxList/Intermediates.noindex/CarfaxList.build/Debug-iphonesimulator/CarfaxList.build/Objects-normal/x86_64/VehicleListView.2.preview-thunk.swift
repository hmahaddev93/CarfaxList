@_private(sourceFile: "VehicleListView.swift") import CarfaxList
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/zebra/Zla/Dev/hmahad_git_space/CarfaxList/CarfaxList/CarfaxList/VehicleListView.swift", line: 19)
        AnyView(VehicleListView())
    #sourceLocation()
    }
}

extension VehicleListView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/zebra/Zla/Dev/hmahad_git_space/CarfaxList/CarfaxList/CarfaxList/VehicleListView.swift", line: 12)
        AnyView(Text(__designTimeString("#9047.[1].[0].property.[0].[0].arg[0].value", fallback: "Hello, world!"))
            .padding())
    #sourceLocation()
    }
}

import struct CarfaxList.VehicleListView
import struct CarfaxList.ContentView_Previews