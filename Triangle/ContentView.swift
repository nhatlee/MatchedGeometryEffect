//
//  ContentView.swift
//  Triangle
//
//  Created by nhatle on 7/26/20.
//

import SwiftUI

struct ContentView: View {


    // MARK:- With matchedGeometryEffect

    @Namespace var ns
    @State var matched: Bool = false

    var body: some View {
        VStack(spacing: 50) {
            HStack(spacing: 30) {
                Triangle(.down, .blue)
                    .matchedGeometryEffect(id: "id1", in: ns, anchor: .topLeading)
                    .frame(width: 150, height: 150)
                    .border(Color.gray)

                Triangle(.right, .green)
                    .matchedGeometryEffect(id: matched ? "id1" : "", in: ns, anchor: .bottomTrailing, isSource: false)
                    .frame(width: 75, height: 75)
                    .border(Color.gray)

            }

            Toggle(isOn: $matched.animation(.easeInOut), label: { Text("Matched") }).frame(width: 140)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
