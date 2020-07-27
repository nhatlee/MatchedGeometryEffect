//
//  HomeView.swift
//  Triangle
//
//  Created by nhatle on 7/27/20.
//

import SwiftUI
struct Example: Identifiable {
    let id: Int
    let name: String
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
private let lists: [Example] = [
    Example(id: 1, name: "Basic matchedGeometryEffect"),
    Example(id: 2, name: "matchedGeometryEffect with many name space"),
    Example(id: 3, name: "PreferenceView with matchedGeometryEffect"),
    Example(id: 4, name: "Without matched geometry effect"),
    Example(id: 5, name: "MultipleTriangle"),
    Example(id: 6, name: "FlowTheFlower"),
    Example(id: 7, name: "Zoomable"),
    Example(id: 8, name: "Shared name space")
]
struct HomeView: View {
    var body: some View {
        NavigationView {
            List(lists) { item in
                NavigationLink(destination: destinationView(for: item)) {
                    Text(item.name)
                }
            }
            .padding()
            .navigationBarTitle("Select example")
        }
    }

    @ViewBuilder
    private func destinationView(for item: Example) -> some View {
        switch item.id {
        case 1:
            ContentView()
        case 2:
            NameSpaceExample()
        case 3:
            PreferenceView()
        case 4:
            WithOutGeometryEffectView()
        case 5:
            MultipleTriangle()
        case 6:
            FlowTheFlower()
        case 7:
            ZoomableView()
        case 8:
            ContentViewNameSpace()
        default:
            Text("Not handle yet")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
