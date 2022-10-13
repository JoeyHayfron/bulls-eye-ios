//
//  ContentView.swift
//  BullsEye
//
//  Created by Joseph Acquah on 04/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
           BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                    .transition(.scale)
                if alertIsVisible {
                    CustomAlert(alertIsVisible: $alertIsVisible, game: $game, sliderValue: $sliderValue)
                        .transition(.scale)
                } else {
                    HitMeButtonView(alertIsVisible: $alertIsVisible, game: $game, sliderValue: $sliderValue)
                        .transition(.scale)
                }

            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
        }
    }
}


struct InstructionsView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionsText(text: "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
            BigNumberText(text:  String(game.target))
        }
    }
}

struct HitMeButtonView: View {
    @Binding var alertIsVisible: Bool
    @Binding var game: Game
    @Binding var sliderValue: Double
    
    var body: some View {
        Button(action: {
            withAnimation {
                alertIsVisible = true
            }
        }) {
            Text("Hit Me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(21.0)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 560, height: 320))
        ContentView()
            .preferredColorScheme(ColorScheme.dark)
        ContentView()
            .preferredColorScheme(ColorScheme.dark)
            .previewLayout(.fixed(width: 560, height: 320))
    }
}
