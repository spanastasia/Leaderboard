//
//  LeadersView.swift
//  Leaderboard
//
//  Created by Anastasiia Spiridonova on 15.06.2023.
//

import SwiftUI

struct LeadersView: View {
    @Binding var accounts: [Account]
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .bottom, spacing: 0) {
                if accounts.count > 1 {
                    sideAccountView(account: accounts[1], heilightColor: .heighlightBlue, roundedCorners: [.topLeft, .bottomLeft], width: geometry.size.width / 3)
                    
                }
                if accounts.count > 0 {
                    centralAccountView(account: accounts[0], width: geometry.size.width / 3)
                }
                if accounts.count > 2 {
                    sideAccountView(account: accounts[2], heilightColor: .heilightGreen, roundedCorners: [.topRight, .bottomRight], width: geometry.size.width / 3)
                }
            }
        }
    }
    
    private func sideAccountView(account: Account, heilightColor: Color, roundedCorners: UIRectCorner, width: CGFloat) -> some View {
        VStack(spacing: -12) {
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
            .frame(width: 68, height: 68)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(heilightColor, lineWidth: 3)
            }
            .zIndex(1)
            VStack(spacing: 4) {
                Text(account.name)
                    .font(.interMedium(size: 14))
                    .padding(.top, 17)
                Text(String(account.score))
                    .font(.interBold(size: 15))
                    .foregroundColor(heilightColor)
                Text("@" + account.userName)
                    .font(.interLight(size: 11))
                    .padding(.top, 5)
            }
            .frame(width: width, height: 113)
            .background(Color.backgroundGray)
            .clipShape(RoundedCorner(radius: 12, corners: roundedCorners))
        }
    }
    
    private func centralAccountView(account: Account, width: CGFloat) -> some View {
        VStack(spacing: 2) {
            Image("crown")
            VStack(spacing: -33) {
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
                .frame(width: 82, height: 82)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(Color.heighlightYellow, lineWidth: 3)
                }
                .zIndex(1)
                VStack(spacing: 4) {
                    Text(account.name)
                        .font(.interMedium(size: 14))
                        .padding(.top, 36)
                    Text(String(account.score))
                        .font(.interBold(size: 15))
                        .foregroundColor(.heighlightYellow)
                    Text("@" + account.userName)
                        .font(.interLight(size: 11))
                        .padding(.top, 9)
                }
                .frame(width: width, height: 159)
                .background(Color.focusedGray)
                .clipShape(RoundedCorner(radius: 12, corners: [.topLeft, .topRight]))
            }
        }
    }
}

struct LeadersView_Previews: PreviewProvider {
    static var previews: some View {
        LeadersView(accounts:
                .constant([
                    .init(
                        id: "martin",
                        name: "Martin",
                        userName: "martin",
                        score: 1085,
                        avatarURL: URL(string: "https://loremflickr.com/320/240"),
                        staus: .moveUp
                    ),
                    .init(
                        id: "patric",
                        name: "Patric",
                        userName: "patric",
                        score: 982,
                        avatarURL: URL(string: "https://loremflickr.com/320/240"),
                        staus: .moveUp
                    ),
                    .init(
                        id: "barbie",
                        name: "Barbie",
                        userName: "barbie",
                        score: 678,
                        avatarURL: URL(string: "https://loremflickr.com/320/240"),
                        staus: .moveUp
                    )
                ])
        )
    }
}
