//
//  LeaderBoardView.swift
//  Leaderboard
//
//  Created by Anastasiia Spiridonova on 15.06.2023.
//

import SwiftUI

struct LeaderBoardView: View {
    @ObservedObject private var viewModel: LeaderboardViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                TabsView(selectedOption: $viewModel.selectedOption)
                    .padding(.horizontal, 29)
                    .padding(.top)
                
                LeadersView(accounts: $viewModel.leaderboardData)
                    .padding(.horizontal, 24)
                    .padding(.top, 21)
                
                if viewModel.leaderboardData.count > 3 {
                    let accounts = viewModel.leaderboardData.suffix(from: 3)
                    ScrollView() {
                        ForEach(accounts) { account in
                            accountRow(account)
                        }
                        .padding(.horizontal, 26)
                        .padding(.top, 5)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.backgroundGray.clipShape(RoundedCorner(radius: 45, corners: [.topLeft, .topRight])))
                    .ignoresSafeArea()
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Leaderboard")
                        .font(.interBold(size: 20))
                }
            }
        }
    }
    
    init(viewModel: LeaderboardViewModel) {
        self.viewModel = viewModel
    }
    
    private func accountRow(_ account: Account) -> some View {
        ZStack(alignment: .bottom) {
            HStack(spacing: 21) {
                AsyncImage(url: account.avatarURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ZStack {
                        Color.focusedGray
                        Image(systemName: "person")
                    }
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                VStack(alignment: .leading, spacing: 4) {
                    Text(account.name)
                        .font(.interMedium(size: 14))
                    Text("@\(account.userName)")
                        .font(.interLight(size: 12))
                }
                Spacer()
                VStack(spacing: 6) {
                    Text(String(account.score))
                        .font(.interBold(size: 14))
                    Triangle()
                        .frame(width: 13, height: 10)
                        .foregroundColor(account.staus == .moveUp ? .heilightGreen : .cherry)
                        .rotationEffect(account.staus == .moveUp ? .zero : .radians(.pi))
                }
            }
            .padding(.vertical, 18)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.dividerGray)
        }
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView(viewModel: LeaderboardViewModel(leaderboardProvider: LeaderboardService()))
    }
}
