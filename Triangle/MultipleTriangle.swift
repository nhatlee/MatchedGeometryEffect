//
//  MultipleTriangle.swift
//  Triangle
//
//  Created by nhatle on 7/27/20.
//

import SwiftUI

struct MultipleTriangle: View {
    @Namespace var ns
    @State private var matched = false

    var body: some View {
        VStack(spacing: 50) {
            HStack {
                Triangle(.down, .purple)
                    .matchedGeometryEffect(id: "id1", in: ns)
                    .frame(width: 100, height: 100)
                    .border(Color.gray)

                Triangle(.right, .green)
                    .matchedGeometryEffect(id: matched ? "id1" : "unpair1", in: ns, isSource: false)
                    .frame(width: 100, height: 100)
                    .border(Color.gray)

                Triangle(.up, .yellow)
                    .matchedGeometryEffect(id: "id2", in: ns)
                    .frame(width: 100, height: 100)
                    .border(Color.gray)

                Triangle(.left, .red)
                    .matchedGeometryEffect(id: matched ? "id2" : "unpair2", in: ns, isSource: false)
                    .frame(width: 100, height: 100)
                    .border(Color.gray)

                Triangle(.down, .orange)
                    .matchedGeometryEffect(id: matched ? "id2" : "unpair3", in: ns, isSource: false)
                    .frame(width: 100, height: 100)
                    .border(Color.gray)
            }
        }

        Toggle(isOn: $matched.animation(.easeInOut), label: { Text("Matched") }).frame(width: 140)

    }
}
