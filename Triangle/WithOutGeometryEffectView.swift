//
//  WithOutGeometryEffectView.swift
//  Triangle
//
//  Created by nhatle on 7/27/20.
//

import SwiftUI

struct WithOutGeometryEffectView: View {
    @Namespace var ns
    @State var matched: Bool = false

    var body: some View {
        let viewArect = CGRect(x: 0, y: 0, width: 150, height: 150)
        let viewBrect = CGRect(x: 180, y: 37.5, width: 75, height: 75)

        return VStack(spacing: 30) {
            HStack(spacing: 30) {
                Triangle(.down, .blue)
                    .frame(width: 150, height: 150)
                    .border(Color.gray)

                Triangle(.right, .green)
                    // ---------------------------------------------------
                    // Here begins our .matchedGeometryEffect equivalent
                    .offset(x: !matched ? 0 : (viewArect.origin.x - viewBrect.origin.x) + ((viewArect.size.width - viewBrect.size.width) / 2.0),
                            y: !matched ? 0 : (viewArect.origin.y - viewBrect.origin.y) + ((viewArect.size.height - viewBrect.size.height) / 2.0))
                    .frame(width: !matched ? viewBrect.size.width : viewArect.size.width,
                           height: !matched ? viewBrect.size.height : viewArect.size.height)
                    // Here ends our .matchedGeometryEffect equivalent
                    // ---------------------------------------------------
                    .frame(width: 75, height: 75)
                    .border(Color.gray)

            }

            Toggle(isOn: $matched.animation(.easeInOut), label: { Text("Matched") }).frame(width: 140)
        }
    }
}
