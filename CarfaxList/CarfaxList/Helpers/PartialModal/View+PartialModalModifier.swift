//
//  View+PartialModalModifier.swift
//  CarfaxList
//
//  Created by Khatib Mahad H. on 8/8/21.
//

import SwiftUI

@available(iOSApplicationExtension, unavailable)
extension View {
    public func addPartialModal(
        style: PartialModalStyle = PartialModalStyle.defaultStyle()) -> some View {
        self.modifier(
            CarfaxList.PartialModal(
                style: style
            )
        )
    }
}
