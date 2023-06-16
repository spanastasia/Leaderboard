//
//  Account.swift
//  Leaderboard
//
//  Created by Anastasiia Spiridonova on 15.06.2023.
//

import Foundation

enum LeaderboardStatus {
    case moveUp
    case moveDown
}

struct Account: Identifiable {
    let id: String
    let name: String
    let userName: String
    let score: Int
    let avatarURL: URL?
    let staus: LeaderboardStatus
}
