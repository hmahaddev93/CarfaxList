//
//  PartialModalStyle.swift
//  CarfaxList
//
//  Created by Khatib Mahad H. on 8/8/21.
//

import SwiftUI

public struct PartialModalStyle {

    public enum PartialModalBackground {
        case solid(Color)
        case blur(UIBlurEffect.Style)
    }
    
    public enum PartialModalHanderBarStyle {
        case solid(Color)
        case none
    }
    
    var background: PartialModalBackground
    var handlerBarStyle: PartialModalHanderBarStyle
    var iPadCloseButtonColor: Color
    var enableCover: Bool
    var coverColor: Color
    var blurEffectStyle: UIBlurEffect.Style?
    var cornerRadius: CGFloat

    var minTopDistance: CGFloat
    
    public init(background: PartialModalBackground,
                accentColor: Color,
                enableCover: Bool,
                coverColor: Color,
                blurEffectStyle: UIBlurEffect.Style? = nil,
                cornerRadius: CGFloat,
                minTopDistance: CGFloat
    ) {
        self.init(
            background: background,
            handlerBarStyle: .solid(accentColor),
            iPadCloseButtonColor: accentColor,
            enableCover: enableCover,
            coverColor: coverColor,
            blurEffectStyle: blurEffectStyle,
            cornerRadius: cornerRadius,
            minTopDistance: minTopDistance
        )
    }
  
    public init(background: PartialModalBackground,
                handlerBarStyle: PartialModalHanderBarStyle,
                iPadCloseButtonColor: Color,
                enableCover: Bool,
                coverColor: Color,
                blurEffectStyle: UIBlurEffect.Style? = nil,
                cornerRadius: CGFloat,
                minTopDistance: CGFloat
    ) {
        self.background = background
        self.handlerBarStyle = handlerBarStyle
        self.iPadCloseButtonColor = iPadCloseButtonColor
        self.enableCover = enableCover
        self.coverColor = coverColor
        self.cornerRadius = cornerRadius
        self.minTopDistance = minTopDistance
    }
}

extension PartialModalStyle {

    public static func defaultStyle() -> PartialModalStyle {
        return PartialModalStyle(background: .solid(Color(UIColor.tertiarySystemBackground)),
                                 handlerBarStyle: .solid(Color(UIColor.systemGray2)),
                                 iPadCloseButtonColor: Color(UIColor.systemGray2),
                                 enableCover: true,
                                 coverColor: Color.black.opacity(0.4),
                                 blurEffectStyle: nil,
                                 cornerRadius: 10,
                                 minTopDistance: 110
        )
    }
}
