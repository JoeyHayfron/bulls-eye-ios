//
//  BackgroundView.swift
//  BullsEye
//
//  Created by Joseph Acquah on 09/10/2022.
//

import SwiftUI


struct TopView: View {
    @Binding var game: Game
    @State var leaderboardIsShowing: Bool = false
    var body: some View {
        HStack {
            Button(action: {
                game.restartGame()
            }) {
                RoundViewsStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button(action: {
                leaderboardIsShowing = true
            }) {
                RoundViewsFilled(systemName: "list.dash")
            }
            .sheet(isPresented: $leaderboardIsShowing, onDismiss: {}, content: {
                LeaderBoardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
            })
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
     
    var body: some View {
        VStack(spacing: 5.0) {
            Text(title.uppercased())
                .bold()
                .font(.caption)
                .foregroundColor(Color("TextColor"))
                .kerning(1.5)
            Text(text)
                .bold()
                .font(.title3)
                .kerning(-0.2)
                .foregroundColor(Color("TextColor"))
                .frame(width: 68.0, height: 55.78)
                .overlay(
                    RoundedRectangle(cornerRadius: 21.0)
                        .strokeBorder(Color("RoundedButtonStrokeColor"), lineWidth: 2.0)
                )
        }

    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}



struct BackgroundView: View {
    @Binding var game: Game
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
    }
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(1..<6) { ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(RadialGradient(gradient: Gradient(colors: [Color("RingsStrokeColor").opacity(0.8 * opacity), Color("RingsStrokeColor").opacity(0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 300))
                    .frame(width: size, height: size)
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
        BackgroundView(game: .constant(Game())).previewLayout(.fixed(width: 560, height: 320))
        BackgroundView(game: .constant(Game()))
            .preferredColorScheme(.dark)
        BackgroundView(game: .constant(Game())).previewLayout(.fixed(width: 560, height: 320))
            .preferredColorScheme(.dark)
            
    }
}
