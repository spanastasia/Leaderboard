//
//  TabsView.swift
//  Leaderboard
//
//  Created by Anastasiia Spiridonova on 15.06.2023.
//

import SwiftUI

enum TabOption {
    case region
    case national
    case global
    
    var title: String {
        switch self {
        case .region:
            return "Region"
        case .national:
            return "National"
        case .global:
            return "Global"
        }
    }
}

struct TabsView: View {
    @Binding var selectedOption: TabOption
    private var options: [TabOption]
    var body: some View {
        HStack(alignment: .center) {
            ForEach(options, id: \.title) { option in
                ZStack(alignment: .bottom) {
                    Button(
                        action: {
                            withAnimation {
                                selectedOption = option
                            }
                        }
                    ) {
                        Text(option.title)
                            .font(.interMedium(size: 15))
                            .foregroundColor(.black)
                    }
                    .padding(.vertical, 16)
                    if option == selectedOption {
                        Rectangle()
                            .frame(width: 45, height: 3)
                            .foregroundColor(.selection)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 24)
        .background(Color.tabBackground)
        .cornerRadius(12)
    }
    
    init(options: [TabOption] = [.region, .national, .global], selectedOption: Binding<TabOption>) {
        self.options = options
        self._selectedOption = selectedOption
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView(selectedOption: .constant(.global))
    }
}
