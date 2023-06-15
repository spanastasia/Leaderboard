//
//  Font+Inter.swift
//  Leaderboard
//
//  Created by Anastasiia Spiridonova on 15.06.2023.
//

import SwiftUI

extension Font {
    static func interLight(size: CGFloat) -> Font {
        .custom("Inter-Light", size: size)
    }
    
    static func interMedium(size: CGFloat) -> Font {
        .custom("Inter-Medium", size: size)
    }
    
    static func interSemiBold(size: CGFloat) -> Font {
        .custom("Inter-SemiBold", size: size)
    }
    
    static func interBold(size: CGFloat) -> Font {
        .custom("Inter-Bold", size: size)
    }
}
