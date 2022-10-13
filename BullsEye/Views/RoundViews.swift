//
//  RoundViews.swift
//  BullsEye
//
//  Created by Joseph Acquah on 09/10/2022.
//

import SwiftUI

struct RoundViewsStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height: 56.0)
            .overlay(
                Circle()
                    .strokeBorder(Color("RoundedButtonStrokeColor"), lineWidth: 2.0 )
            )
    }
}

struct RoundViewsFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("RoundedButtonFontColor"))
            .frame(width: 56.0, height: 56.0)
            .background(
                Circle()
                    .background(Color("RoundedButtonFillColor"))
            )
    }
}


struct PreviewView: View {
    
    var body: some View {
        VStack(spacing: 10.0) {
            RoundViewsStroked(systemName: "arrow.counterclockwise")
            RoundViewsFilled(systemName: "list.dash")
        }
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
