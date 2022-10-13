//
//  LeaderBoardView.swift
//  BullsEye
//
//  Created by Joseph Acquah on 12/10/2022.
//

import SwiftUI

struct LeaderBoardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                TableHeadersView()
                VStack (spacing: 10) {
                    ForEach(game.leaderboardEntries.indices) { entry in
                        RowView(index: entry, score: game.leaderboardEntries[entry].score, date: game.leaderboardEntries[entry].date)
                    }
                }
            }
        }
        
    }
}


struct HeaderView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Binding var leaderboardIsShowing: Bool
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    Text("LEADERBOARD")
                        .font(.title)
                        .fontWeight(.black)
                        .kerning(2.0)
                        .padding(.leading)
                    Spacer()
                } else {
                    Text("LEADERBOARD")
                        .font(.title)
                        .fontWeight(.black)
                        .kerning(2.0)
                }
            }
  
            HStack {
                Spacer()
                Button(action: {
                    leaderboardIsShowing = false
                }) {
                    RoundViewsFilled(systemName: "xmark")
                }
                .padding(.trailing)
            }
        }
    }
}

struct TableHeadersView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 56.0)
            Spacer()
            InstructionsText(text: "Score")
                .frame(width: 50.0)
            Spacer()
            InstructionsText(text: "Date")
                .frame(width: 170.0)
        }
        .frame(maxWidth: 480.0)
        .padding(.trailing)
        .padding(.leading)
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game())
    static var previews: some View {
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .previewLayout(.fixed(width: 560, height: 320))
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .preferredColorScheme(.dark)
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 560, height: 320))
    }
}
