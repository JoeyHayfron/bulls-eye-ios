//
//  RowView.swift
//  BullsEye
//
//  Created by Joseph Acquah on 12/10/2022.
//

import SwiftUI

struct RowView: View {
    var index: Int
    var score: Int
    var date: Date = Date()
    
    var body: some View {
        HStack {
            Text(String(index))
                .bold()
                .font(.title3)
                .cornerRadius(28.0)
                .frame(width: 56.0, height: 56.0)
                .background(
                    Circle()
                        .strokeBorder(Color("RowViewBorderColor"), lineWidth: 2.0)
                )
            Spacer()
            Text(String(score))
                .bold()
                .font(.title3)
                .kerning(-0.2)
                .frame(width: 50.0)
            Spacer()
                Text(date, style: .time)
                .bold()
                .font(.title3)
                .kerning(-0.2)
                .frame(width: 170.0)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("RowViewBorderColor"), lineWidth: 2.0)
        )
        .frame(maxWidth: 480.0)
        .padding(.leading)
        .padding(.trailing)
    }
        
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(index: 1, score: 10, date: Date())
        RowView(index: 1, score: 10, date: Date())
            .previewLayout(.fixed(width: 560, height: 320))
        RowView(index: 1, score: 10, date: Date())
            .preferredColorScheme(.dark)
        RowView(index: 1, score: 10, date: Date())
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 560, height: 320))
    }
}
