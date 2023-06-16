//
//  LeaderboardViewModel.swift
//  Leaderboard
//
//  Created by Anastasiia Spiridonova on 15.06.2023.
//

import Foundation

final class LeaderboardViewModel: ObservableObject {
    @Published var selectedOption: TabOption = .region {
        didSet {
            Task { [weak self] in
                await self?.getLeaderboardData()
            }
        }
    }
    @Published var leaderboardData: [Account] = []
    
    private let leaderboardProvider: LeaderboardProvider
    
    init(leaderboardProvider: LeaderboardProvider = LeaderboardService()) {
        self.leaderboardProvider = leaderboardProvider
        Task { [weak self] in
            await self?.getLeaderboardData()
        }
    }
    
    @MainActor func getLeaderboardData() async {
        switch selectedOption {
        case .region:
            leaderboardData = await leaderboardProvider.fetchRegionLeaderboard()
        case .national:
            leaderboardData = await leaderboardProvider.fetchNationalLeaderboard()
        case .global:
            leaderboardData = await leaderboardProvider.fetchGlobalLeaderboard()
        }
    }
}
