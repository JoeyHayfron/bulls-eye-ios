//
//  CustomAlert.swift
//  BullsEye
//
//  Created by Joseph Acquah on 11/10/2022.
//

import SwiftUI

struct CustomAlert: View {
    @Binding var alertIsVisible: Bool
    @Binding var game: Game
    @Binding var sliderValue: Double
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
//        ZStack {
//            Color.black.opacity(0.5)
//                .edgesIgnoringSafeArea(.all)
                VStack (spacing: 10) {
                    InstructionsText(text: "The Sider Value is")
                    BigNumberText(text: String(roundedValue))
                    Text("You scored \(points) Points\n🎉🎉🎉")
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .font(.subheadline)
                        .lineSpacing(12.0)
                    Button(action: {
                        withAnimation {
                            alertIsVisible = false
                        }
                        game.startNewRound(points: points)
                    }) {
                        Text("Start New Round")
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .foregroundColor(Color.white)
                            .font(.body)
                            .cornerRadius(12.0)
                    }
                }
                .padding()
                .frame(maxWidth: 300)
                .background(Color("BackgroundColor"))
                .cornerRadius(21)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 5, y: 5)
//        }
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(true)
    static private var game = Binding.constant(Game())
    static private var sliderValue = Binding.constant(50.0)
    static var previews: some View {
        CustomAlert(alertIsVisible: alertIsVisible, game: game, sliderValue: sliderValue)
        CustomAlert(alertIsVisible: alertIsVisible, game: game, sliderValue: sliderValue).previewLayout(.fixed(width: 560, height: 320))
        CustomAlert(alertIsVisible: alertIsVisible, game: game, sliderValue: sliderValue)
            .preferredColorScheme(ColorScheme.dark)
        CustomAlert(alertIsVisible: alertIsVisible, game: game, sliderValue: sliderValue)
            .preferredColorScheme(ColorScheme.dark)
            .previewLayout(.fixed(width: 560, height: 320))
    }
}
