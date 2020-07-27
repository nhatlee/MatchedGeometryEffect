//
//  NameSpaceExample.swift
//  Triangle
//
//  Created by nhatle on 7/27/20.
//

import SwiftUI

struct NameSpaceExample: View {
    @Namespace var empty_namespace
    @Namespace var namespace1
    @Namespace var namespace2
    @Namespace var namespace3

    @State private var namespaceInUse = 0

    var body: some View {
        let colors: [Color] = [.purple, .green, .yellow, .red]
        let direction: [Triangle.Direction] = [.up, .down, .left, .right]

        VStack(spacing: 30) {
            HStack {
                // Namespace 1
                ZStack {
                    Rectangle().fill(Color.green.opacity(0.2)).frame(width: 50, height: 50)
                        .matchedGeometryEffect(id: 0, in: namespace1)
                        .matchedGeometryEffect(id: 1, in: namespace1)
                    Text("ns 1")
                }
                ZStack {
                    Rectangle().fill(Color.green.opacity(0.2)).frame(width: 50, height: 50)
                        .matchedGeometryEffect(id: 2, in: namespace1)
                        .matchedGeometryEffect(id: 3, in: namespace1)
                    Text("ns 1")
                }

                // Namespace 2
                ZStack {
                    Rectangle().fill(Color.blue.opacity(0.2)).frame(width: 50, height: 50)
                        .matchedGeometryEffect(id: 0, in: namespace2)
                        .matchedGeometryEffect(id: 2, in: namespace2)
                    Text("ns 2")
                }
                ZStack {
                    Rectangle().fill(Color.blue.opacity(0.2)).frame(width: 50, height: 50)
                        .matchedGeometryEffect(id: 1, in: namespace2)
                        .matchedGeometryEffect(id: 3, in: namespace2)
                    Text("ns 2")
                }
                // Namespace 3
                ZStack {
                    Rectangle().fill(Color.red.opacity(0.2)).frame(width: 50, height: 50)
                        .matchedGeometryEffect(id: 0, in: namespace3)
                        .matchedGeometryEffect(id: 1, in: namespace3)
                        .matchedGeometryEffect(id: 2, in: namespace3)
                        .matchedGeometryEffect(id: 3, in: namespace3)
                    Text("ns 3")
                }

            }

            HStack {
                ForEach(0..<4) { idx in
                    Triangle(direction[idx], colors[idx])
                        .matchedGeometryEffect(id: idx, in: activeNamespace(), isSource: false)
                        .frame(width: 50, height: 50)
                }
            }

            HStack(spacing: 30) {
                Button("Match namespace1") { withAnimation { namespaceInUse = 1 }}
                Button("Match namespace2") { withAnimation { namespaceInUse = 2 }}
                Button("Match namespace3") { withAnimation { namespaceInUse = 3 }}
            }
            Button("Unmatch") { withAnimation { namespaceInUse = 0 }}
        }
    }

    func activeNamespace() -> Namespace.ID {
        if namespaceInUse == 1 {
            return namespace1
        } else if namespaceInUse == 2 {
            return namespace2
        } else if namespaceInUse == 3 {
            return namespace3
        } else {
            return empty_namespace
        }
    }
}


