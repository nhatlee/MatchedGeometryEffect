//
//  ShareNameSpace.swift
//  Triangle
//
//  Created by nhatle on 7/27/20.
//

import SwiftUI

struct ContentViewNameSpace: View {
    @State private var isExpanded = false
    @Namespace private var namespace


    var body: some View {
        Group() {
        if isExpanded {
            VerticalView(namespace: namespace)
        } else {
            HorizontalView(namespace: namespace)
        }
        }.onTapGesture {
        withAnimation {
            isExpanded.toggle()
        }
        }
    }
}

struct VerticalView: View {
    var namespace: Namespace.ID

    var body: some View {
        VStack {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color.pink)
            .frame(width: 60, height: 60)
            .matchedGeometryEffect(id: "rect", in: namespace, properties: .frame)
        Text("Hello SwiftUI!").fontWeight(.semibold)
            .matchedGeometryEffect(id: "text", in: namespace)
        }
    }
}

struct HorizontalView: View {
    var namespace: Namespace.ID

    var body: some View {
        HStack {
        Text("Hello SwiftUI!").fontWeight(.semibold)
            .matchedGeometryEffect(id: "text", in: namespace)
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color.pink)
            .frame(width: 60, height: 60)
            .matchedGeometryEffect(id: "rect", in: namespace, properties: .frame)
        }
    }
}
