//
//  PreferenceView.swift
//  Triangle
//
//  Created by nhatle on 7/27/20.
//

import SwiftUI

struct PreferenceView : View {
    @Namespace var ns
    @State private var selection: Int = 1

    var body: some View {
        VStack(spacing: 20) {
            ForEach(0..<3) { (row: Int) in
                HStack(spacing: 30) {
                    ForEach(1..<5) { (col: Int) in
                        MonthView(selection: $selection, month: row * 4 + col)
                            .matchedGeometryEffect(id: row * 4 + col, in: ns)
                    }
                }
            }
        }.background(
            RoundedRectangle(cornerRadius: 8).stroke(Color.green, lineWidth: 3)
                .matchedGeometryEffect(id: selection, in: ns, isSource: false)
        )
    }

    struct MonthView: View {
        let monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        @Binding var selection: Int
        let month: Int

        var body: some View {
            Text(monthNames[month-1])
                .padding(10)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.selection = month
                    }
                }
        }
    }
}
