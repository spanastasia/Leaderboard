//
//  LeaderboardProvider.swift
//  Leaderboard
//
//  Created by Anastasiia Spiridonova on 15.06.2023.
//

import Foundation

protocol LeaderboardProvider {
    func fetchRegionLeaderboard() async -> [Account]
    func fetchNationalLeaderboard() async -> [Account]
    func fetchGlobalLeaderboard() async -> [Account]
}

class LeaderboardService: LeaderboardProvider {
    func fetchRegionLeaderboard() async -> [Account] {
        regionLeaderboard.sorted(by: { $0.score > $1.score })
    }
    
    func fetchNationalLeaderboard() async -> [Account] {
        nationalLeaderboard.sorted(by: { $0.score > $1.score })
    }
    
    func fetchGlobalLeaderboard() async -> [Account] {
        globalLeaderboard.sorted(by: { $0.score > $1.score })
    }
    
    private func imageURL(for imageName: String) -> URL? {
        URL(string: "https://loremflickr.com/320/240")
    }
}

private extension LeaderboardService {
    private var regionLeaderboard: [Account] {
        [
            .init(
                id: "mat",
                name: "Mat",
                userName: "mat",
                score: 1847,
                avatarURL: imageURL(for: "avatar1"),
                staus: .moveUp
            ),
            .init(
                id: "sam",
                name: "Sam",
                userName: "sam",
                score: 1456,
                avatarURL: imageURL(for: "avatar2"),
                staus: .moveUp
            ),
            .init(
                id: "john",
                name: "John",
                userName: "john",
                score: 1345,
                avatarURL: imageURL(for: "avatar3"),
                staus: .moveUp
            ),
            .init(
                id: "jane",
                name: "Jane",
                userName: "jane",
                score: 1234,
                avatarURL: imageURL(for: "avatar3"),
                staus: .moveUp
            ),
            .init(
                id: "bob",
                name: "Bob",
                userName: "bob",
                score: 1157,
                avatarURL: imageURL(for: "avatar4"),
                staus: .moveDown
            ),
            .init(
                id: "garry",
                name: "Garry",
                userName: "garry",
                score: 1145,
                avatarURL: imageURL(for: "avatar5"),
                staus: .moveDown
            ),
            .init(
                id: "eve",
                name: "Eve",
                userName: "eve",
                score: 1111,
                avatarURL: imageURL(for: "avatar1"),
                staus: .moveUp
            ),
            .init(
                id: "michael",
                name: "Michael",
                userName: "michael",
                score: 982,
                avatarURL: imageURL(for: "avatar2"),
                staus: .moveDown
            ),
            .init(
                id: "clifford",
                name: "Clifford",
                userName: "clifford",
                score: 932,
                avatarURL: imageURL(for: "avatar3"),
                staus: .moveUp
            ),
            .init(
                id: "tara",
                name: "Tara",
                userName: "tara",
                score: 900,
                avatarURL: imageURL(for: "avatar4"),
                staus: .moveDown
            )
        ]
    }
    
    private var nationalLeaderboard: [Account] {
        regionLeaderboard + [
            .init(
                id: "dave",
                name: "Dave",
                userName: "dave",
                score: 2014,
                avatarURL: imageURL(for: "avatar1"),
                staus: .moveUp
            ),
            .init(
                id: "olly",
                name: "Olly",
                userName: "olly",
                score: 1897,
                avatarURL: imageURL(for: "avatar2"),
                staus: .moveDown
            ),
            .init(
                id: "pascal",
                name: "Pascal",
                userName: "pascal",
                score: 1756,
                avatarURL: imageURL(for: "avatar4"),
                staus: .moveUp
            ),
            .init(
                id: "quincy",
                name: "Quincy",
                userName: "quincy",
                score: 1234,
                avatarURL: imageURL(for: "avatar5"),
                staus: .moveUp
            ),
            .init(
                id: "ruben",
                name: "Ruben",
                userName: "ruben",
                score: 1157,
                avatarURL: imageURL(for: "avatar6"),
                staus: .moveDown
            ),
            .init(
                id: "jacob",
                name: "Jacob",
                userName: "jacob",
                score: 999,
                avatarURL: nil,
                staus: .moveDown
            )
        ]
    }
    
    private var globalLeaderboard: [Account] {
        nationalLeaderboard + [
            .init(
                id: "megan",
                name: "Megan",
                userName: "megan",
                score: 1716,
                avatarURL: nil,
                staus: .moveDown
            ),
            .init(
                id: "martin",
                name: "Martin",
                userName: "martin",
                score: 1085,
                avatarURL: imageURL(for: "avatar3"),
                staus: .moveUp
            ),
            .init(
                id: "patric",
                name: "Patric",
                userName: "patric",
                score: 982,
                avatarURL: imageURL(for: "avatar4"),
                staus: .moveUp
            ),
            .init(
                id: "barbie",
                name: "Barbie",
                userName: "barbie",
                score: 678,
                avatarURL: imageURL(for: "avatar5"),
                staus: .moveUp
            )
        ]
    }
}
