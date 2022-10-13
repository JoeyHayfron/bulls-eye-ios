//
//  TextViews.swift
//  BullsEye
//
//  Created by Joseph Acquah on 09/10/2022.
//

import SwiftUI

struct InstructionsText: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .font(.footnote)
            .lineSpacing(4.0)
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.black)
            .font(.largeTitle)
            .kerning(-1.0)
    }
}

struct LabelTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.headline)
            .multilineTextAlignment(.center)
            .frame(width: 35.0)
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack{
            LabelTextView(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            LabelTextView(text: "100")
        }
        .padding()
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionsText(text: "Instructions")
            BigNumberText(text: "24")
            LabelTextView(text: "1")
        }
    }
}
