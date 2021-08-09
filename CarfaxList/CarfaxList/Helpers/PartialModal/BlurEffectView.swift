//
//  BlurEffectView.swift
//  CarfaxList
//
//  Created by Khatib Mahad H. on 8/8/21.
//

import SwiftUI

struct BlurEffectView: UIViewRepresentable {

    /// The style of the Blut Effect View
    var style: UIBlurEffect.Style = .systemMaterial

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

