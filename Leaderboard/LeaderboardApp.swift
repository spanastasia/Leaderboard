//
//  LeaderboardApp.swift
//  Leaderboard
//
//  Created by Anastasiia Spiridonova on 15.06.2023.
//

import SwiftUI

@main
struct LeaderboardApp: App {
    var body: some Scene {
        WindowGroup {
            LeaderBoardView(viewModel: LeaderboardViewModel(leaderboardProvider: LeaderboardService()))
        }
    }
}
